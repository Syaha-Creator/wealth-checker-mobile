import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budget_plan.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budgeting_advice.dart';
import 'package:wealth_checker_mobile/features/budgeting/presentation/pages/budgeting_advisor_page.dart';
import 'package:wealth_checker_mobile/features/budgeting/presentation/providers/budgeting_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';

void main() {
  group('BudgetingAdvisorPage', () {
    testWidgets('renders income form and allocation cards on success',
        (tester) async {
      await tester.pumpWidget(_buildTestApp());
      await tester.pumpAndSettle();

      expect(find.text('Budgeting Advisor'), findsOneWidget);
      expect(find.text('Rencana Pemasukan Bulanan'), findsOneWidget);
      expect(find.text('10000000'), findsOneWidget);
      expect(find.text('Rekomendasi Alokasi'), findsOneWidget);
      expect(find.text('Kebutuhan Pokok'), findsOneWidget);
      expect(find.textContaining('50%'), findsOneWidget);
    });

    testWidgets('shows loading indicator while fetching advice', (tester) async {
      final completer = Completer<BudgetingAdvice>();
      await tester.pumpWidget(
        _buildTestApp(adviceFuture: completer.future),
      );
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsWidgets);
      completer.complete(_sampleAdvice);
      await tester.pumpAndSettle();
    });

    testWidgets('shows error with retry on advice failure', (tester) async {
      await tester.pumpWidget(_buildTestApp(adviceShouldFail: true));
      await tester.pumpAndSettle();

      expect(find.textContaining('Terjadi kesalahan'), findsOneWidget);
      expect(find.text('Coba lagi'), findsOneWidget);
    });
  });
}

Widget _buildTestApp({
  Future<BudgetingAdvice>? adviceFuture,
  bool adviceShouldFail = false,
}) {
  return ProviderScope(
    overrides: [
      currentBudgetPlanProvider.overrideWith((_) async => _samplePlan),
      budgetingAdviceProvider.overrideWith((_) async {
        if (adviceFuture != null) {
          return adviceFuture;
        }
        if (adviceShouldFail) {
          throw Exception('network error');
        }
        return _sampleAdvice;
      }),
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const BudgetingAdvisorPage(),
    ),
  );
}

const _samplePlan = BudgetPlan(
  id: 'plan-1',
  userId: 'user-1',
  householdId: 'household-1',
  rencanaPemasukanBulanan: 10000000,
  bulanTahun: '2026-07',
  createdAt: '2026-07-06T10:19:20.871Z',
);

const _sampleAdvice = BudgetingAdvice(
  wealthLevel: 3,
  hasPlan: true,
  rencanaPemasukanBulanan: 10000000,
  alokasi: [
    BudgetAllocation(
      kategori: 'Kebutuhan Pokok',
      persen: 50,
      nominal: 5000000,
    ),
    BudgetAllocation(
      kategori: 'Tabungan Darurat',
      persen: 30,
      nominal: 3000000,
    ),
  ],
  totalPersen: 80,
  sisaTidakTeralokasi: 0,
);

const _sampleSummary = WealthSummary(
  userName: 'Test User',
  userEmail: 'test@example.com',
  totalKas: 1000000,
  totalLiquidAssets: 2000000,
  totalFixedAssets: 3000000,
  totalReceivables: 0,
  totalUtang: 1000000,
  totalAset: 6000000,
  kekayaanBersih: 5000000,
  wealthLevel: 3,
  wealthLevelName: 'Gaji ke Gaji',
);
