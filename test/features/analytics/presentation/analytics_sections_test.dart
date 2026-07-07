import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/budget_vs_actual.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/emergency_fund.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/essential_expenses.dart';
import 'package:wealth_checker_mobile/features/analytics/data/models/income_report.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/widgets/budget_vs_actual_section.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/widgets/emergency_fund_section.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/widgets/essential_expenses_section.dart';
import 'package:wealth_checker_mobile/features/analytics/presentation/widgets/income_section.dart';

void main() {
  group('BudgetVsActualSection', () {
    testWidgets('renders allocation rows with over budget badge and null persen',
        (tester) async {
      const data = BudgetVsActual(
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
          BudgetVsActualItem(
            kategori: 'Dana Warisan',
            rencanaNominal: 0,
            aktualNominal: 0,
            selisih: 0,
            selisihPersen: null,
            overBudget: false,
          ),
        ],
      );

      await tester.pumpWidget(
        _wrap(const BudgetVsActualSection(data: data)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Kebutuhan Pokok'), findsOneWidget);
      expect(find.text('Over budget'), findsOneWidget);
      expect(find.textContaining('8.6%'), findsOneWidget);
      expect(find.text('Dana Warisan'), findsOneWidget);
      expect(find.textContaining('(-)'), findsOneWidget);
      expect(find.textContaining('Pendapatan'), findsOneWidget);
    });

    testWidgets('shows link to Saran Budgeting when hasPlan is false',
        (tester) async {
      const data = BudgetVsActual(
        wealthLevel: 3,
        hasPlan: false,
        pendapatan: null,
        alokasi: [],
      );

      await tester.pumpWidget(
        _wrap(const BudgetVsActualSection(data: data)),
      );
      await tester.pumpAndSettle();

      expect(
        find.text('Belum ada rencana budget untuk bulan ini.'),
        findsOneWidget,
      );
      expect(find.text('Buka Saran Budgeting'), findsOneWidget);
    });

    testWidgets('shows empty state message when wealthLevel is -1',
        (tester) async {
      const data = BudgetVsActual(
        wealthLevel: -1,
        hasPlan: false,
        pendapatan: null,
        alokasi: [],
      );

      await tester.pumpWidget(
        _wrap(const BudgetVsActualSection(data: data)),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Lengkapi data keuangan'),
        findsOneWidget,
      );
      expect(find.text('Buka Saran Budgeting'), findsNothing);
    });
  });

  group('EmergencyFundSection', () {
    testWidgets('renders amount, cukup badge, and bulan tertanggung',
        (tester) async {
      const data = EmergencyFund(
        danaDarurat: 15000000,
        status: 'cukup',
        bulanTertanggung: 5.5,
      );

      await tester.pumpWidget(_wrap(const EmergencyFundSection(data: data)));
      await tester.pumpAndSettle();

      expect(find.text('Rp 15.000.000'), findsOneWidget);
      expect(find.text('Cukup'), findsOneWidget);
      expect(find.text('Menanggung: 5.5 bulan'), findsOneWidget);
    });

    testWidgets('renders dash and hint when bulanTertanggung is null',
        (tester) async {
      const data = EmergencyFund(
        danaDarurat: 0,
        status: 'belum_cukup',
        bulanTertanggung: null,
      );

      await tester.pumpWidget(_wrap(const EmergencyFundSection(data: data)));
      await tester.pumpAndSettle();

      expect(find.text('Belum cukup'), findsOneWidget);
      expect(find.text('Menanggung: -'), findsOneWidget);
      expect(
        find.textContaining('rencana pengeluaran bulanan'),
        findsOneWidget,
      );
    });
  });

  group('EssentialExpensesSection', () {
    testWidgets('renders categories, expands rincian, and shows grand total',
        (tester) async {
      const data = EssentialExpenses(
        categories: ['Konsumsi', 'Transportasi'],
        items: [
          EssentialExpenseItem(
            kategori: 'Konsumsi',
            rincianList: [
              EssentialExpenseRincian(rincian: 'Makan siang', total: 500000),
              EssentialExpenseRincian(rincian: 'Kopi', total: 100000),
            ],
            subtotal: 600000,
          ),
        ],
        grandTotal: 600000,
      );

      await tester.pumpWidget(
        _wrap(const EssentialExpensesSection(data: data)),
      );
      await tester.pumpAndSettle();

      expect(find.text('Konsumsi'), findsOneWidget);
      expect(find.text('Rp 600.000'), findsNWidgets(2));
      expect(find.text('Makan siang'), findsNothing);

      await tester.tap(find.text('Konsumsi'));
      await tester.pumpAndSettle();

      expect(find.text('Makan siang'), findsOneWidget);
      expect(find.text('Kopi'), findsOneWidget);
    });

    testWidgets('shows empty message when no items', (tester) async {
      const data = EssentialExpenses(
        categories: [],
        items: [],
        grandTotal: 0,
      );

      await tester.pumpWidget(
        _wrap(const EssentialExpensesSection(data: data)),
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Tidak ada pengeluaran kebutuhan pokok'),
        findsOneWidget,
      );
    });
  });

  group('IncomeSection', () {
    testWidgets('renders items with percentage bars and terbesar badge',
        (tester) async {
      const data = IncomeReport(
        items: [
          IncomeItem(
            kategori: 'Gaji',
            total: 9000000,
            persentaseDariTotal: 90,
            isTerbesar: true,
          ),
          IncomeItem(
            kategori: 'Bonus',
            total: 1000000,
            persentaseDariTotal: 10,
            isTerbesar: false,
          ),
        ],
        grandTotal: 10000000,
      );

      await tester.pumpWidget(_wrap(const IncomeSection(data: data)));
      await tester.pumpAndSettle();

      expect(find.text('Gaji'), findsOneWidget);
      expect(find.text('Bonus'), findsOneWidget);
      expect(find.text('Terbesar'), findsNothing);
      expect(find.byType(PieChart), findsOneWidget);
      expect(find.text('Rp 10.000.000'), findsOneWidget);
    });

    testWidgets('shows empty message when no items', (tester) async {
      const data = IncomeReport(items: [], grandTotal: 0);

      await tester.pumpWidget(_wrap(const IncomeSection(data: data)));
      await tester.pumpAndSettle();

      expect(find.textContaining('Tidak ada pemasukan'), findsOneWidget);
    });
  });
}

Widget _wrap(Widget child) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(child: child),
        ),
      ),
      GoRoute(
        path: '/budgeting',
        builder: (context, state) => const Scaffold(body: SizedBox()),
      ),
    ],
  );

  return MaterialApp.router(
    theme: AppTheme.light,
    localizationsDelegates: const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('id')],
    routerConfig: router,
  );
}
