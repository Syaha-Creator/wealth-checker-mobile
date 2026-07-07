import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/pages/accounts_list_page.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';

void main() {
  group('AccountsListPage', () {
    testWidgets('renders account list on success', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          accountsListOverride: _SuccessAccountsList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('BCA Tabungan'), findsOneWidget);
      expect(find.textContaining('Rp 1.500.000'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no accounts', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          accountsListOverride: _EmptyAccountsList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada rekening'), findsOneWidget);
    });

    testWidgets('shows specific message when delete fails with 409',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          accountsListOverride: _DeleteConflictAccountsList.new,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();
      await tester.tap(find.widgetWithText(TextButton, 'Hapus'));
      await tester.pumpAndSettle();

      expect(find.text('Tidak bisa dihapus'), findsOneWidget);
      expect(find.text(accountDeleteConflictMessage), findsOneWidget);
    });
  });
}

Widget _buildTestApp({
  required AccountsList Function() accountsListOverride,
}) {
  return ProviderScope(
    overrides: [
      accountsListProvider.overrideWith(accountsListOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const AccountsListPage(),
    ),
  );
}

const _sampleAccount = Account(
  id: 'acc-1',
  userId: 'user-1',
  nama: 'BCA Tabungan',
  saldoCache: 1500000,
  isActive: true,
  createdAt: '2026-07-01T00:00:00.000Z',
);

class _SuccessAccountsList extends AccountsList {
  @override
  Future<List<Account>> build() async => const [_sampleAccount];
}

class _EmptyAccountsList extends AccountsList {
  @override
  Future<List<Account>> build() async => const [];
}

class _DeleteConflictAccountsList extends AccountsList {
  @override
  Future<List<Account>> build() async => const [_sampleAccount];

  @override
  Future<void> deleteAccount(String id) async {
    throw const ApiException(
      statusCode: 409,
      message: 'Rekening masih memiliki transaksi terkait',
    );
  }
}
