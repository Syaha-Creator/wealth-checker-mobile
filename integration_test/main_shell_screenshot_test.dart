import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture beranda and bottom nav tabs', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await loginForScreenshots(tester);
    expect(find.text('Beranda'), findsOneWidget);

    await waitForScreenReady(
      tester,
      readyFinder: find.textContaining('Kekayaan Bersih'),
    );
    await holdForHostScreenshot(tester, '03_beranda_simulator');

    await tapNavTab(tester, 'Impian');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Target Impian'),
    );
    await holdForHostScreenshot(tester, '04_tab_impian_simulator');

    await tapNavTab(tester, 'Analitik');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Analisa Keuangan'),
    );
    await holdForHostScreenshot(tester, '05_tab_analitik_simulator');

    await tapNavTab(tester, 'Transaksi');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Transaksi'),
    );
    await holdForHostScreenshot(tester, '06_tab_transaksi_simulator');
  });
}
