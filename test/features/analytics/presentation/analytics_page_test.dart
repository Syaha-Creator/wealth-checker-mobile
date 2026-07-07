import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/analytics/data/analytics_repository.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/budget_vs_actual.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/emergency_fund.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/essential_expenses.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/income_report.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/monthly_profit_loss.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/pages/analytics_page.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/providers/analytics_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/dashboard_repository.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_history_point.dart';

void main() {
  group('AnalyticsPage', () {
    testWidgets('renders wealth history chart and monthly PL table',
        (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        _buildTestApp(
          overrideProviders: true,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Analisa Keuangan'), findsOneWidget);
      expect(find.text('Kekayaan Bersih'), findsOneWidget);
      expect(find.text('Laba Rugi Bulanan'), findsOneWidget);
      expect(find.textContaining('Perubahan'), findsOneWidget);
      // "Pendapatan" now appears both in the monthly PL table and in the
      // Budget vs Actual section (Sprint 9b).
      expect(find.text('Pendapatan'), findsWidgets);
      expect(find.byType(LineChart), findsOneWidget);

      // The Sprint 9b sections live below the fold of the lazy ListView.
      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(
        find.text('Budget vs Aktual'),
        200,
        scrollable: scrollable,
      );
      expect(find.text('Budget vs Aktual'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('Dana Darurat'),
        200,
        scrollable: scrollable,
      );
      expect(find.text('Dana Darurat'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('Pemasukan'),
        200,
        scrollable: scrollable,
      );
      expect(find.text('Kebutuhan Pokok'), findsWidgets);
      expect(find.text('Pemasukan'), findsOneWidget);
    });

    testWidgets('initial load sends bulan ini from/to before user interaction',
        (tester) async {
      final dashboardRepo = _RecordingDashboardRepository();
      final analyticsRepo = _RecordingAnalyticsRepository();
      final now = DateTime.now();
      final expectedFrom = DateTime(now.year, now.month, 1);
      final expectedTo = DateTime(now.year, now.month, now.day);

      await tester.pumpWidget(
        _buildTestApp(
          dashboardRepository: dashboardRepo,
          analyticsRepository: analyticsRepo,
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(dashboardRepo.wealthHistoryCalls, 1);
      expect(analyticsRepo.monthlyPlCalls, 1);
      expect(dashboardRepo.lastFrom, expectedFrom);
      expect(dashboardRepo.lastTo, expectedTo);
      expect(analyticsRepo.lastFrom, expectedFrom);
      expect(analyticsRepo.lastTo, expectedTo);
    });

    testWidgets('changing filter preset refetches with new date params',
        (tester) async {
      final dashboardRepo = _RecordingDashboardRepository();
      final analyticsRepo = _RecordingAnalyticsRepository();

      await tester.pumpWidget(
        _buildTestApp(
          dashboardRepository: dashboardRepo,
          analyticsRepository: analyticsRepo,
        ),
      );
      await tester.pumpAndSettle();

      expect(dashboardRepo.wealthHistoryCalls, 1);
      expect(analyticsRepo.monthlyPlCalls, 1);

      await tester.tap(find.text('3 bulan'));
      await tester.pumpAndSettle();

      expect(dashboardRepo.wealthHistoryCalls, 2);
      expect(analyticsRepo.monthlyPlCalls, 2);
      expect(dashboardRepo.lastFrom, isNotNull);
      expect(dashboardRepo.lastTo, isNotNull);
    });

    testWidgets(
        'changing filter refetches date-bound reports but NOT emergency fund',
        (tester) async {
      final analyticsRepo = _RecordingAnalyticsRepository();

      await tester.pumpWidget(
        _buildTestApp(analyticsRepository: analyticsRepo),
      );
      await tester.pumpAndSettle();

      expect(analyticsRepo.emergencyFundCalls, 1);
      expect(analyticsRepo.budgetVsActualCalls, 1);
      expect(analyticsRepo.essentialExpensesCalls, 1);
      expect(analyticsRepo.incomeCalls, 1);

      await tester.tap(find.text('3 bulan'));
      await tester.pumpAndSettle();

      expect(analyticsRepo.budgetVsActualCalls, 2);
      expect(analyticsRepo.essentialExpensesCalls, 2);
      expect(analyticsRepo.incomeCalls, 2);
      expect(analyticsRepo.emergencyFundCalls, 1);
    });

    testWidgets('shows loading indicator while fetching wealth history',
        (tester) async {
      final completer = Completer<WealthHistory>();
      await tester.pumpWidget(
        _buildTestApp(wealthHistoryFuture: completer.future),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsWidgets);
      completer.complete(_sampleWealthHistory);
      await tester.pumpAndSettle();
    });
  });
}

Widget _buildTestApp({
  _RecordingDashboardRepository? dashboardRepository,
  _RecordingAnalyticsRepository? analyticsRepository,
  Future<WealthHistory>? wealthHistoryFuture,
  bool overrideProviders = false,
}) {
  return ProviderScope(
    overrides: [
      if (overrideProviders) ...[
        wealthHistoryProvider.overrideWith((_) async => _sampleWealthHistory),
        monthlyPlProvider.overrideWith((_) async => _sampleMonthlyPl),
        budgetVsActualProvider.overrideWith((_) async => _sampleBudgetVsActual),
        emergencyFundProvider.overrideWith((_) async => _sampleEmergencyFund),
        essentialExpensesProvider
            .overrideWith((_) async => _sampleEssentialExpenses),
        incomeProvider.overrideWith((_) async => _sampleIncome),
      ] else ...[
        dashboardRepositoryProvider.overrideWith(
          (_) => dashboardRepository ?? _RecordingDashboardRepository(),
        ),
        analyticsRepositoryProvider.overrideWith(
          (_) => analyticsRepository ?? _RecordingAnalyticsRepository(),
        ),
        if (wealthHistoryFuture != null)
          wealthHistoryProvider.overrideWith((_) => wealthHistoryFuture),
      ],
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const AnalyticsPage(),
    ),
  );
}

const _sampleWealthHistory = WealthHistory(
  history: [
    WealthHistoryPoint(tanggal: '2026-06-01', kekayaanBersih: 10000000),
    WealthHistoryPoint(tanggal: '2026-07-01', kekayaanBersih: 12500000),
  ],
  delta: 2500000,
);

const _sampleMonthlyPl = [
  MonthlyProfitLoss(
    bulan: '2026-06',
    pendapatan: 10000000,
    pinjamanMasuk: 0,
    bayarUtang: 500000,
    piutangTerbayar: 0,
    pengeluaran: 7500000,
    tabungan: 2500000,
    tabunganNegatif: false,
  ),
];

const _sampleBudgetVsActual = BudgetVsActual(
  wealthLevel: 5,
  hasPlan: true,
  pendapatan: BudgetVsActualPendapatan(
    rencanaNominal: 10000000,
    aktualNominal: 9500000,
  ),
  alokasi: [
    BudgetVsActualItem(
      kategori: 'Kebutuhan Pokok',
      rencanaNominal: 3500000,
      aktualNominal: 3800000,
      selisih: 300000,
      selisihPersen: 8.6,
      overBudget: true,
    ),
  ],
);

const _sampleEmergencyFund = EmergencyFund(
  danaDarurat: 15000000,
  status: 'cukup',
  bulanTertanggung: 5.5,
);

const _sampleEssentialExpenses = EssentialExpenses(
  categories: ['Konsumsi'],
  items: [
    EssentialExpenseItem(
      kategori: 'Konsumsi',
      rincianList: [
        EssentialExpenseRincian(rincian: 'Makan siang', total: 500000),
      ],
      subtotal: 500000,
    ),
  ],
  grandTotal: 500000,
);

const _sampleIncome = IncomeReport(
  items: [
    IncomeItem(
      kategori: 'Gaji',
      total: 9000000,
      persentaseDariTotal: 90,
      isTerbesar: true,
    ),
  ],
  grandTotal: 9000000,
);

class _RecordingDashboardRepository extends DashboardRepository {
  _RecordingDashboardRepository() : super(_UnusedDio());

  int wealthHistoryCalls = 0;
  DateTime? lastFrom;
  DateTime? lastTo;

  @override
  Future<WealthHistory> getWealthHistory({
    required DateTime from,
    required DateTime to,
  }) async {
    wealthHistoryCalls++;
    lastFrom = from;
    lastTo = to;
    return _sampleWealthHistory;
  }
}

class _RecordingAnalyticsRepository extends AnalyticsRepository {
  _RecordingAnalyticsRepository() : super(_UnusedDio());

  int monthlyPlCalls = 0;
  int budgetVsActualCalls = 0;
  int emergencyFundCalls = 0;
  int essentialExpensesCalls = 0;
  int incomeCalls = 0;
  DateTime? lastFrom;
  DateTime? lastTo;

  @override
  Future<List<MonthlyProfitLoss>> getMonthlyPl({
    required DateTime from,
    required DateTime to,
  }) async {
    monthlyPlCalls++;
    lastFrom = from;
    lastTo = to;
    return _sampleMonthlyPl;
  }

  @override
  Future<BudgetVsActual> getBudgetVsActual({
    required DateTime from,
    required DateTime to,
    String? bulanTahun,
    String? kategoriPokok,
  }) async {
    budgetVsActualCalls++;
    return _sampleBudgetVsActual;
  }

  @override
  Future<EmergencyFund> getEmergencyFund() async {
    emergencyFundCalls++;
    return _sampleEmergencyFund;
  }

  @override
  Future<EssentialExpenses> getEssentialExpenses({
    required DateTime from,
    required DateTime to,
    String? kategori,
  }) async {
    essentialExpensesCalls++;
    return _sampleEssentialExpenses;
  }

  @override
  Future<IncomeReport> getIncome({
    required DateTime from,
    required DateTime to,
  }) async {
    incomeCalls++;
    return _sampleIncome;
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
