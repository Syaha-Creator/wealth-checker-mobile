import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/data/debts_repository.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/data/models/debt.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/presentation/pages/debts_list_page.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/presentation/providers/debts_list_provider.dart';

void main() {
  group('DebtsListPage', () {
    testWidgets('renders active utang biasa with repayment progress',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(debtsListOverride: _SuccessDebtsList.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Bank BRI'), findsOneWidget);
      expect(find.textContaining('Rp 8.000.000'), findsOneWidget);
      expect(find.text('Terlunasi 20%'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no active debts',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(debtsListOverride: _EmptyDebtsList.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada utang aktif'), findsOneWidget);
    });

    test('excludes kartu kredit from list provider filter', () async {
      final container = ProviderContainer(
        overrides: [
          debtsRepositoryProvider.overrideWith((_) => _MixedDebtsRepository()),
        ],
      );
      addTearDown(container.dispose);

      final debts = await container.read(debtsListProvider.future);

      expect(debts, hasLength(1));
      expect(debts.single.tipe, DebtType.utangBiasa);
    });
  });
}

Widget _buildTestApp({
  required DebtsList Function() debtsListOverride,
}) {
  return ProviderScope(
    overrides: [
      debtsListProvider.overrideWith(debtsListOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const DebtsListPage(),
    ),
  );
}

const _utangBiasa = Debt(
  id: 'debt-1',
  userId: 'user-1',
  pemberiUtang: 'Bank BRI',
  tipe: DebtType.utangBiasa,
  saldoAwal: 10000000,
  sisaSaldo: 8000000,
  createdAt: '2026-07-01T00:00:00.000Z',
);

class _SuccessDebtsList extends DebtsList {
  @override
  Future<List<Debt>> build() async => const [_utangBiasa];
}

class _EmptyDebtsList extends DebtsList {
  @override
  Future<List<Debt>> build() async => const [];
}

class _MixedDebtsRepository extends DebtsRepository {
  _MixedDebtsRepository() : super(_UnusedDio());

  @override
  Future<List<Debt>> getDebts() async {
    return const [
      _utangBiasa,
      Debt(
        id: 'debt-2',
        userId: 'user-1',
        pemberiUtang: 'BCA Card',
        tipe: DebtType.kartuKredit,
        saldoAwal: 5000000,
        sisaSaldo: 3000000,
        createdAt: '2026-07-01T00:00:00.000Z',
      ),
    ];
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
