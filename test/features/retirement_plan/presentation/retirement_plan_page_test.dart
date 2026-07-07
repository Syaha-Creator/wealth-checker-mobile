import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/data/models/retirement_plan.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/presentation/pages/retirement_plan_page.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/presentation/providers/retirement_plan_provider.dart';

void main() {
  group('RetirementPlanPage', () {
    testWidgets('shows profile incomplete empty state', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          const RetirementPlan(
            hasProfile: false,
            error:
                'Lengkapi tanggal lahir, rencana usia pensiun, dan rencana usia warisan di halaman Profil untuk melihat rencana pensiun.',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Profil belum lengkap'), findsOneWidget);
      expect(
        find.textContaining('Lengkapi tanggal lahir'),
        findsOneWidget,
      );
      expect(find.text('Target Dana'), findsNothing);
    });

    testWidgets('renders negative years and null debt payoff message',
        (tester) async {
      tester.view.physicalSize = const Size(800, 1600);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.resetPhysicalSize);

      await tester.pumpWidget(
        _buildTestApp(
          const RetirementPlan(
            hasProfile: true,
            mode: 'simple',
            plan: RetirementPlanDetails(
              tahunMenujuPensiun: -2,
              tahunMenujuWarisan: 30,
              danaDibutuhkanSebelumPensiun: 0,
              danaDibutuhkanSelamaPensiun: 1500000000,
              totalDanaPensiunWarisan: 1500000000,
            ),
            sisaUangBulanan: -500000,
            danaTerkumpulSaatIni: 10000000,
            selisihMenujuTarget: 1490000000,
            collectedFunds: RetirementCollectedFunds(
              danaDaruratTerkumpul: 10000000,
              danaPensiunTerkumpul: 0,
              danaWarisanTerkumpul: 0,
            ),
            debtPayoff: RetirementDebtPayoff(
              bisaLunasSekarang: false,
              bulanLunasDenganKas: null,
              bulanLunasDenganSisaGaji: null,
            ),
            realizedPL: RetirementRealizedPL(
              untungRugiJualBarang: 250000,
              untungRugiInvestasi: -100000,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Rencana Pensiun'), findsOneWidget);
      expect(find.textContaining('-2 tahun (sudah terlewat)'), findsOneWidget);

      final scrollable = find.byType(Scrollable).first;
      await tester.scrollUntilVisible(
        find.text('Pelunasan Utang'),
        200,
        scrollable: scrollable,
      );
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Tidak dapat dihitung'),
        findsNWidgets(2),
      );
      expect(find.text('Dana Terkumpul (Waterfall)'), findsOneWidget);
    });
  });
}

Widget _buildTestApp(RetirementPlan plan) {
  return ProviderScope(
    overrides: [
      retirementPlanProvider.overrideWith((_) async => plan),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const RetirementPlanPage(),
    ),
  );
}
