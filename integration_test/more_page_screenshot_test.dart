import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture lainnya tab and quick action sheets', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await loginForScreenshots(tester);

    await tapNavTab(tester, 'Lainnya');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kelola & Modul'),
    );
    await holdForHostScreenshot(tester, '07_tab_lainnya_simulator');

    await tester.tap(find.byKey(const Key('more_menu_debts')));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await waitForScreenReady(
      tester,
      readyFinder: find.byIcon(Icons.close),
    );
    await holdForHostScreenshot(tester, '08_sheet_utang_simulator');

    await tester.tap(find.byIcon(Icons.close).first);
    await tester.pumpAndSettle(const Duration(milliseconds: 500));

    await tester.tap(find.byKey(const Key('more_menu_profile')));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Segera Hadir'),
    );
    await holdForHostScreenshot(tester, '09_sheet_profil_simulator');
  });
}
