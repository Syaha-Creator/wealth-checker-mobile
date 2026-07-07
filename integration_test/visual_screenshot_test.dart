import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture dashboard and transaction form screenshots', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await loginForScreenshots(tester);
    await waitForScreenReady(
      tester,
      readyFinder: find.textContaining('Kekayaan Bersih'),
    );
    await holdForHostScreenshot(tester, '01_dashboard_simulator');

    await tapNavTab(tester, 'Transaksi');
    await waitForScreenReady(
      tester,
      readyFinder: find.byType(FloatingActionButton),
    );

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Nominal'),
    );
    await holdForHostScreenshot(tester, '02_transaction_form_simulator');
  });
}
