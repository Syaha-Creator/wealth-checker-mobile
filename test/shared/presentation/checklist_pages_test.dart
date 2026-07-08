import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budget_plan.dart';
import 'package:wealth_checker_mobile/features/budgeting/data/models/budgeting_advice.dart';
import 'package:wealth_checker_mobile/features/budgeting/presentation/pages/budgeting_advisor_page.dart';
import 'package:wealth_checker_mobile/features/budgeting/presentation/providers/budgeting_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/data/models/retirement_plan.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/presentation/pages/retirement_plan_page.dart';
import 'package:wealth_checker_mobile/features/retirement_plan/presentation/providers/retirement_plan_provider.dart';
import 'package:wealth_checker_mobile/shared/data/checklist_repository.dart';
import 'package:wealth_checker_mobile/shared/models/checklist_item.dart';

Future<void> _scrollToAndTap(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    120,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
  await tester.tap(finder);
}

void main() {
  group('RetirementPlanPage checklist', () {
    testWidgets('optimistically checks legacy item on tap', (tester) async {
      final repository = _RecordingChecklistRepository();

      await tester.pumpWidget(
        _buildRetirementApp(repository),
      );
      await tester.pumpAndSettle();

      expect(find.text('Checklist Warisan'), findsOneWidget);
      expect(find.text('1/4'), findsNothing);

      await _scrollToAndTap(tester, find.text('Buat surat wasiat'));
      await tester.pump();

      expect(find.text('1/4'), findsOneWidget);
      expect(repository.toggles, hasLength(1));
      expect(repository.toggles.single.itemKey, 'buat_surat_wasiat');
      expect(repository.toggles.single.checked, isTrue);

      await tester.pumpAndSettle();
    });

    testWidgets('rolls back legacy checklist when API fails', (tester) async {
      final repository = _RecordingChecklistRepository(shouldFailToggle: true);

      await tester.pumpWidget(
        _buildRetirementApp(repository),
      );
      await tester.pumpAndSettle();

      await _scrollToAndTap(tester, find.text('Buat surat wasiat'));
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('1/4'), findsNothing);
      expect(find.text('Gagal menyimpan checklist'), findsOneWidget);
    });
  });

  group('BudgetingAdvisorPage checklist', () {
    testWidgets('optimistically marks budgeting tip as applied', (tester) async {
      final repository = _RecordingChecklistRepository();

      await tester.pumpWidget(
        _buildBudgetingApp(repository),
      );
      await tester.pumpAndSettle();

      expect(find.text('Tips Budgeting'), findsOneWidget);
      expect(find.text('Sudah Diterapkan'), findsNothing);

      await _scrollToAndTap(tester, find.text('Belum Diterapkan').first);
      await tester.pump();

      expect(find.text('Sudah Diterapkan'), findsOneWidget);
      expect(repository.toggles.single.itemKey, 'otomatiskan_transfer_tabungan');

      await tester.pumpAndSettle();
    });

    testWidgets('rolls back budgeting tip when API fails', (tester) async {
      final repository = _RecordingChecklistRepository(shouldFailToggle: true);

      await tester.pumpWidget(
        _buildBudgetingApp(repository),
      );
      await tester.pumpAndSettle();

      await _scrollToAndTap(tester, find.text('Belum Diterapkan').first);
      await tester.pump();
      await tester.pumpAndSettle();

      expect(find.text('Sudah Diterapkan'), findsNothing);
      expect(find.text('Gagal menyimpan checklist'), findsOneWidget);
    });
  });
}

Widget _buildRetirementApp(_RecordingChecklistRepository repository) {
  return ProviderScope(
    overrides: [
      retirementPlanProvider.overrideWith((_) async => _sampleRetirementPlan),
      checklistRepositoryProvider.overrideWith((_) => repository),
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

Widget _buildBudgetingApp(_RecordingChecklistRepository repository) {
  return ProviderScope(
    overrides: [
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
      currentBudgetPlanProvider.overrideWith((_) async => _sampleBudgetPlan),
      budgetingAdviceProvider.overrideWith((_) async => _sampleAdvice),
      checklistRepositoryProvider.overrideWith((_) => repository),
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

const _sampleRetirementPlan = RetirementPlan(
  hasProfile: true,
  mode: 'simple',
  plan: RetirementPlanDetails(
    tahunMenujuPensiun: 10,
    tahunMenujuWarisan: 30,
    danaDibutuhkanSebelumPensiun: 100000000,
    danaDibutuhkanSelamaPensiun: 500000000,
    totalDanaPensiunWarisan: 600000000,
  ),
  sisaUangBulanan: 2000000,
  danaTerkumpulSaatIni: 50000000,
  selisihMenujuTarget: 550000000,
  collectedFunds: RetirementCollectedFunds(
    danaDaruratTerkumpul: 20000000,
    danaPensiunTerkumpul: 20000000,
    danaWarisanTerkumpul: 10000000,
  ),
  debtPayoff: RetirementDebtPayoff(
    bisaLunasSekarang: false,
    bulanLunasDenganKas: 12,
    bulanLunasDenganSisaGaji: 18,
  ),
  realizedPL: RetirementRealizedPL(
    untungRugiJualBarang: 0,
    untungRugiInvestasi: 0,
  ),
);

const _sampleSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'jane@example.com',
  totalKas: 0,
  totalLiquidAssets: 0,
  totalFixedAssets: 0,
  totalReceivables: 0,
  totalUtang: 0,
  totalAset: 0,
  kekayaanBersih: 0,
  wealthLevel: 2,
  wealthLevelName: 'Terlihat Kaya',
);

const _sampleBudgetPlan = BudgetPlan(
  id: 'plan-1',
  userId: 'user-1',
  householdId: 'household-1',
  rencanaPemasukanBulanan: 10000000,
  bulanTahun: '2026-07',
  createdAt: '2026-07-01T00:00:00.000Z',
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
  ],
  totalPersen: 50,
  sisaTidakTeralokasi: 5000000,
);

class _ToggleCall {
  const _ToggleCall({
    required this.itemKey,
    required this.category,
    required this.checked,
  });

  final String itemKey;
  final String category;
  final bool checked;
}

class _RecordingChecklistRepository extends ChecklistRepository {
  _RecordingChecklistRepository({this.shouldFailToggle = false})
      : super(_UnusedDio());

  final bool shouldFailToggle;
  final toggles = <_ToggleCall>[];

  @override
  Future<List<ChecklistItem>> getChecklist(String category) async {
    return const [];
  }

  @override
  Future<ChecklistItem> toggleChecklistItem({
    required String itemKey,
    required String category,
    required bool checked,
  }) async {
    toggles.add(
      _ToggleCall(
        itemKey: itemKey,
        category: category,
        checked: checked,
      ),
    );

    if (shouldFailToggle) {
      throw const ApiException(message: 'Gagal menyimpan checklist');
    }

    return ChecklistItem(
      itemKey: itemKey,
      isChecked: checked,
      updatedAt: '2026-07-08T00:00:00.000Z',
    );
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
