import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/monthly_cash_flow.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('DashboardPage', () {
    testWidgets('renders wealth summary data on success', (tester) async {
      tester.view.physicalSize = const Size(600, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async => _sampleSummary,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Kekayaan Bersih'), findsOneWidget);
      expect(find.textContaining('Rp 42.500.000'), findsOneWidget);
      expect(find.textContaining('Level 2: Terlihat Kaya'), findsOneWidget);
      expect(find.text('Breakdown'), findsOneWidget);
      expect(find.text('Sisa Uang Bulanan'), findsOneWidget);
      expect(find.textContaining('Rp 2.500.000'), findsWidgets);
      expect(find.text('Kelola Rekening'), findsOneWidget);
      expect(find.text('Lihat Saran Budgeting'), findsOneWidget);
      expect(
        find.text('Kelola Target Impian', skipOffstage: false),
        findsOneWidget,
      );
    });

    testWidgets('shows breakdown and cash flow before navigation sections',
        (tester) async {
      tester.view.physicalSize = const Size(600, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async => _sampleSummary,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      final breakdownY = tester.getTopLeft(find.text('Breakdown')).dy;
      final cashFlowY = tester.getTopLeft(find.text('Sisa Uang Bulanan')).dy;
      final firstNavSectionY =
          tester.getTopLeft(find.text('Kelola Data Keuangan')).dy;

      expect(breakdownY, lessThan(firstNavSectionY));
      expect(cashFlowY, lessThan(firstNavSectionY));
    });

    testWidgets('renders three navigation sections in correct order',
        (tester) async {
      tester.view.physicalSize = const Size(600, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async => _sampleSummary,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      final kelolaFinder =
          find.text('Kelola Data Keuangan', skipOffstage: false);
      final wawasanFinder =
          find.text('Wawasan Finansial', skipOffstage: false);
      final perencanaanFinder =
          find.text('Perencanaan Jangka Panjang', skipOffstage: false);

      expect(kelolaFinder, findsOneWidget);
      expect(wawasanFinder, findsOneWidget);
      expect(perencanaanFinder, findsOneWidget);

      final kelolaY = tester.getTopLeft(kelolaFinder).dy;
      final wawasanY = tester.getTopLeft(wawasanFinder).dy;
      final perencanaanY = tester.getTopLeft(perencanaanFinder).dy;

      expect(kelolaY, lessThan(wawasanY));
      expect(wawasanY, lessThan(perencanaanY));
    });

    testWidgets('renders navigation as grid tiles not outlined buttons',
        (tester) async {
      tester.view.physicalSize = const Size(600, 2200);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async => _sampleSummary,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(OutlinedButton), findsNothing);
      expect(find.byType(GridView, skipOffstage: false), findsNWidgets(3));
    });

    testWidgets('renders loading state', (tester) async {
      final summaryCompleter = Completer<WealthSummary>();

      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) => summaryCompleter.future,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error state with retry button', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async {
            throw const ApiException(message: 'Gagal memuat ringkasan kekayaan');
          },
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Gagal memuat ringkasan kekayaan'), findsOneWidget);
      expect(find.text('Coba lagi'), findsOneWidget);
    });

    testWidgets('renders onboarding empty state when wealthLevel is -1',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          wealthSummaryOverride: (_) async => _onboardingSummary,
          monthlyCashFlowOverride: (_) async => _sampleCashFlow,
        ),
      );
      await tester.pumpAndSettle();

      expect(
        find.text('Kamu belum menyelesaikan onboarding'),
        findsOneWidget,
      );
      expect(find.text('Mulai onboarding'), findsOneWidget);
      expect(find.text('Kekayaan Bersih'), findsNothing);
    });
  });
}

Widget _buildTestApp({
  required Future<WealthSummary> Function(Ref ref) wealthSummaryOverride,
  required Future<MonthlyCashFlow> Function(Ref ref) monthlyCashFlowOverride,
}) {
  return ProviderScope(
    overrides: [
      wealthSummaryProvider.overrideWith(wealthSummaryOverride),
      monthlyCashFlowProvider.overrideWith(monthlyCashFlowOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const DashboardPage(),
    ),
  );
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

const _onboardingSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'user@example.com',
  totalKas: 0,
  totalLiquidAssets: 0,
  totalFixedAssets: 0,
  totalReceivables: 0,
  totalUtang: 0,
  totalAset: 0,
  kekayaanBersih: 0,
  wealthLevel: -1,
  wealthLevelName: '',
);

const _sampleCashFlow = MonthlyCashFlow(
  bulanIni: MonthSnapshot(
    bulan: '2026-07',
    pemasukan: 10000000,
    pengeluaran: 7500000,
    sisaUangBulanan: 2500000,
  ),
  bulanLalu: MonthSnapshot(
    bulan: '2026-06',
    pemasukan: 9500000,
    pengeluaran: 8000000,
    sisaUangBulanan: 1500000,
  ),
  rataRata3Bulan: RollingAverage(
    pemasukan: 9800000,
    pengeluaran: 7700000,
    sisaUangBulanan: 2100000,
  ),
  hidupTanpaGajiBulan: 6.5,
  usedProfileFallback: false,
);
