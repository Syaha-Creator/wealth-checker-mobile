import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/navigation/main_shell.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/budget_vs_actual.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/emergency_fund.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/essential_expenses.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/income_report.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/providers/analytics_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_history_point.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/data/models/dream_goal.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/presentation/providers/dream_goals_list_provider.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/providers/transactions_list_provider.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('MainShell', () {
    testWidgets('shows five bottom navigation tabs', (tester) async {
      await tester.pumpWidget(_buildShellApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Beranda'), findsOneWidget);
      expect(find.text('Impian'), findsOneWidget);
      expect(find.text('Analitik'), findsOneWidget);
      expect(find.text('Transaksi'), findsOneWidget);
      expect(find.text('Lainnya'), findsOneWidget);
    });

    testWidgets('switches between tabs', (tester) async {
      await tester.pumpWidget(_buildShellApp());
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.textContaining('Kekayaan Bersih'), findsOneWidget);

      await tester.tap(find.text('Lainnya'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Kelola & Modul'), findsOneWidget);

      await tester.tap(find.text('Transaksi'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.text('Transaksi'), findsWidgets);

      await tester.tap(find.text('Beranda'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.textContaining('Kekayaan Bersih'), findsOneWidget);
    });
  });
}

Widget _buildShellApp() {
  return ProviderScope(
    overrides: [
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
      wealthHistoryProvider.overrideWith((_) async => _sampleHistory),
      accountsListProvider.overrideWith(_AccountsOverride.new),
      dreamGoalsListProvider.overrideWith(_DreamGoalsOverride.new),
      transactionsListProvider(const TransactionsFilter())
          .overrideWith(_TransactionsOverride.new),
      monthlyPlProvider.overrideWith((_) async => const []),
      budgetVsActualProvider.overrideWith((_) async => _sampleBudgetVsActual),
      emergencyFundProvider.overrideWith((_) async => _sampleEmergencyFund),
      essentialExpensesProvider.overrideWith((_) async => _sampleEssentialExpenses),
      incomeProvider.overrideWith((_) async => _sampleIncome),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const MainShell(),
    ),
  );
}

class _AccountsOverride extends AccountsList {
  @override
  Future<List<Account>> build() async => const [
        Account(
          id: 'acc-1',
          userId: 'user-1',
          nama: 'BCA Tabungan',
          saldoCache: 1500000,
          isActive: true,
          createdAt: '2026-07-01T00:00:00.000Z',
        ),
      ];
}

class _TransactionsOverride extends TransactionsList {
  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async => [];
}

class _DreamGoalsOverride extends DreamGoalsList {
  @override
  Future<List<DreamGoal>> build() async => [];
}

const _sampleSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'user@example.com',
  totalKas: 5000000,
  totalLiquidAssets: 15000000,
  totalFixedAssets: 30000000,
  totalReceivables: 500000,
  totalUtang: 8000000,
  totalAset: 50500000,
  kekayaanBersih: 42500000,
  wealthLevel: 2,
  wealthLevelName: 'Terlihat Kaya',
);

const _sampleHistory = WealthHistory(
  delta: 2500000,
  history: [
    WealthHistoryPoint(tanggal: '2026-05-01', kekayaanBersih: 40000000),
    WealthHistoryPoint(tanggal: '2026-06-01', kekayaanBersih: 41000000),
    WealthHistoryPoint(tanggal: '2026-07-01', kekayaanBersih: 42500000),
  ],
);

const _sampleBudgetVsActual = BudgetVsActual(
  wealthLevel: 2,
  hasPlan: false,
  pendapatan: BudgetVsActualPendapatan(
    rencanaNominal: 0,
    aktualNominal: 0,
  ),
  alokasi: [],
);

const _sampleEmergencyFund = EmergencyFund(
  danaDarurat: 0,
  status: 'belum',
  bulanTertanggung: 0,
);

const _sampleEssentialExpenses = EssentialExpenses(
  categories: [],
  items: [],
  grandTotal: 0,
);

const _sampleIncome = IncomeReport(
  items: [],
  grandTotal: 0,
);
