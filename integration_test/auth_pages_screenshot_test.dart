import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture login and register pages on simulator', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await waitForScreenReady(
      tester,
      readyFinder: find.text('Masuk untuk melihat kekayaan bersihmu'),
    );
    await holdForHostScreenshot(tester, 'login_page_simulator');

    await tester.tap(find.text('Daftar'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await waitForScreenReady(
      tester,
      readyFinder: find.text(
        'Buat akun baru untuk mulai memantau kekayaanmu',
      ),
    );
    await holdForHostScreenshot(tester, 'register_page_simulator');
  });
}
