import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account_mutation.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/pages/account_mutation_page.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/account_mutation_provider.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('AccountMutationPage', () {
    testWidgets('shows saldo awal periode when date filter is active',
        (tester) async {
      final query = AccountMutationQuery(
        accountId: 'acc-1',
        from: DateTime(2026, 1, 15),
        to: DateTime(2026, 2, 28),
      );

      await tester.pumpWidget(
        _buildTestApp(
          query: query,
          mutation: _filteredMutationWithEntries,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Saldo Awal Periode'), findsOneWidget);
      expect(find.textContaining('Rp 1.200.000'), findsWidgets);
    });

    testWidgets('shows empty state with saldo awal periode when filter has no rows',
        (tester) async {
      final query = AccountMutationQuery(
        accountId: 'acc-1',
        from: DateTime(2026, 3, 1),
        to: DateTime(2026, 3, 31),
      );

      await tester.pumpWidget(
        _buildTestApp(
          query: query,
          mutation: _filteredMutationEmpty,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Saldo Awal Periode'), findsOneWidget);
      expect(find.textContaining('Rp 1.500.000'), findsOneWidget);
      expect(find.text('Tidak ada transaksi dalam periode'), findsOneWidget);
    });

    testWidgets('shows friendly message for invalid date filter error',
        (tester) async {
      final query = AccountMutationQuery(
        accountId: 'acc-1',
        from: DateTime(2026, 3, 31),
        to: DateTime(2026, 3, 1),
      );

      await tester.pumpWidget(
        _buildTestApp(
          query: query,
          throwsError: const ApiException(
            statusCode: 400,
            message: 'from must be before or equal to to',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text(invalidDateFilterMessage), findsNWidgets(2));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Coba lagi'), findsOneWidget);
    });
  });

  testWidgets('hides saldo awal periode when no date filter is active',
      (tester) async {
    final query = AccountMutationQuery(accountId: 'acc-1');

    await tester.pumpWidget(
      _buildTestApp(
        query: query,
        mutation: _filteredMutationWithEntries,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Saldo Awal Periode'), findsNothing);
    expect(find.textContaining('Saldo awal turunan'), findsOneWidget);
  });
}

Widget _buildTestApp({
  required AccountMutationQuery query,
  AccountMutation? mutation,
  ApiException? throwsError,
}) {
  return ProviderScope(
    overrides: [
      accountMutationProvider(query).overrideWith((ref) async {
        if (throwsError != null) {
          throw throwsError;
        }
        return mutation!;
      }),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: AccountMutationPage(
        accountId: query.accountId,
        initialFrom: query.from,
        initialTo: query.to,
      ),
    ),
  );
}

const _filteredMutationWithEntries = AccountMutation(
  account: AccountMutationAccount(
    id: 'acc-1',
    nama: 'BCA Tabungan',
    saldoCache: 950000,
  ),
  saldoAwalTurunan: 1000000,
  saldoSebelumPeriode: 1200000,
  konsisten: true,
  mutasi: [
    MutationEntry(
      id: 'tx-1',
      tanggal: '2026-02-01',
      type: 'pengeluaran',
      kategori: 'Makanan',
      rincian: 'Makan siang',
      nominal: 50000,
      delta: -50000,
      saldoSetelah: 950000,
    ),
  ],
);

const _filteredMutationEmpty = AccountMutation(
  account: AccountMutationAccount(
    id: 'acc-1',
    nama: 'BCA Tabungan',
    saldoCache: 950000,
  ),
  saldoAwalTurunan: 1000000,
  saldoSebelumPeriode: 1500000,
  konsisten: true,
  mutasi: [],
);
