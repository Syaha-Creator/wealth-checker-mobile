import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

const _legacyItemLabel = 'Buat surat wasiat';
const _budgetingToggleLabel = 'Belum Diterapkan';

Future<void> _goBackToMorePage(WidgetTester tester) async {
  if (find.byType(BackButton).evaluate().isNotEmpty) {
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle(const Duration(seconds: 2));
  }
}

Future<void> _openRetirementChecklist(WidgetTester tester) async {
  await tapNavTab(tester, 'Lainnya');
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Kelola & Modul'),
  );
  await tester.scrollUntilVisible(
    find.byKey(const Key('more_menu_retirement')),
    120,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('more_menu_retirement')));
  await tester.pumpAndSettle(const Duration(seconds: 8));
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Checklist Warisan'),
    timeout: const Duration(seconds: 30),
  );
}

Future<void> _openBudgetingTips(WidgetTester tester) async {
  await _goBackToMorePage(tester);
  if (find.text('Kelola & Modul').evaluate().isEmpty) {
    await tapNavTab(tester, 'Lainnya');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kelola & Modul'),
    );
  }
  await tester.scrollUntilVisible(
    find.byKey(const Key('more_menu_budgeting')),
    120,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(const Key('more_menu_budgeting')));
  await tester.pumpAndSettle(const Duration(seconds: 8));
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Tips Budgeting'),
    timeout: const Duration(seconds: 30),
  );
}

Future<void> _scrollToChecklistSection(WidgetTester tester, String title) async {
  await tester.scrollUntilVisible(
    find.text(title),
    120,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle(const Duration(milliseconds: 500));
}
Future<void> _scrollToAndTap(WidgetTester tester, Finder finder) async {
  await tester.scrollUntilVisible(
    finder,
    120,
    scrollable: find.byType(Scrollable).first,
  );
  await tester.pumpAndSettle();
  await tester.tap(finder);
}

Future<void> _captureLegacyChecklist(WidgetTester tester, String fileStem) async {
  await _scrollToChecklistSection(tester, 'Checklist Warisan');
  await holdForHostScreenshot(tester, fileStem);
}

Future<void> _captureBudgetingTips(WidgetTester tester, String fileStem) async {
  await _scrollToChecklistSection(tester, 'Tips Budgeting');
  await holdForHostScreenshot(tester, fileStem);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final phase = const String.fromEnvironment('CHECKLIST_PHASE', defaultValue: 'toggle');

  testWidgets('checklist persistence screenshots — $phase', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await loginForScreenshots(tester);

    if (phase == 'toggle') {
      await _openRetirementChecklist(tester);
      if (find.text('1/4').evaluate().isEmpty) {
        await _scrollToAndTap(tester, find.text(_legacyItemLabel));
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }
      expect(find.text('1/4'), findsOneWidget);
      await _captureLegacyChecklist(tester, 'legacy_checklist_before_close');

      await _openBudgetingTips(tester);
      if (find.text('Sudah Diterapkan').evaluate().isEmpty) {
        await _scrollToAndTap(tester, find.text(_budgetingToggleLabel).first);
        await tester.pumpAndSettle(const Duration(seconds: 2));
      }
      expect(find.text('Sudah Diterapkan'), findsOneWidget);
      await _captureBudgetingTips(tester, 'budgeting_tips_before_close');
      return;
    }

    if (phase == 'verify') {
      await _openRetirementChecklist(tester);
      expect(find.text('1/4'), findsOneWidget);
      await _captureLegacyChecklist(tester, 'legacy_checklist_after_reopen');

      await _openBudgetingTips(tester);
      expect(find.text('Sudah Diterapkan'), findsOneWidget);
      await _captureBudgetingTips(tester, 'budgeting_tips_after_reopen');
      return;
    }

    fail('Unknown CHECKLIST_PHASE: $phase');
  });
}
