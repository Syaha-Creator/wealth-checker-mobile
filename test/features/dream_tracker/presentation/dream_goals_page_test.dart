import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/data/models/dream_goal.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/presentation/pages/dream_goals_page.dart';
import 'package:wealth_checker_mobile/features/dream_tracker/presentation/providers/dream_goals_list_provider.dart';

void main() {
  group('DreamGoalsPage', () {
    testWidgets('renders goals with progress and tercapai badge', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(goalsOverride: _SuccessDreamGoalsList.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dream Tracker'), findsOneWidget);
      expect(find.text('Liburan ke Jepang'), findsOneWidget);
      expect(find.text('Dana Pendidikan'), findsOneWidget);
      expect(find.text('Tercapai'), findsOneWidget);
      expect(find.textContaining('Rp 15.000.000'), findsWidgets);
    });

    testWidgets('shows empty state when no goals', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(goalsOverride: _EmptyDreamGoalsList.new),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada impian'), findsOneWidget);
      expect(find.text('Tambah Goal'), findsOneWidget);
    });
  });
}

Widget _buildTestApp({
  required DreamGoalsList Function() goalsOverride,
}) {
  return ProviderScope(
    overrides: [
      dreamGoalsListProvider.overrideWith(goalsOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const DreamGoalsPage(),
    ),
  );
}

const _sampleGoals = [
  DreamGoal(
    id: 'goal-1',
    namaGoal: 'Liburan ke Jepang',
    accountId: 'acc-1',
    targetNominal: 20000000,
    saldoSaatIni: 20000000,
    persentase: 100,
    tercapai: true,
    sisaMenujuTarget: 0,
  ),
  DreamGoal(
    id: 'goal-2',
    namaGoal: 'Dana Pendidikan',
    targetNominal: 50000000,
    saldoSaatIni: 15000000,
    persentase: 30,
    tercapai: false,
    sisaMenujuTarget: 35000000,
  ),
];

class _SuccessDreamGoalsList extends DreamGoalsList {
  @override
  Future<List<DreamGoal>> build() async => _sampleGoals;
}

class _EmptyDreamGoalsList extends DreamGoalsList {
  @override
  Future<List<DreamGoal>> build() async => const [];
}
