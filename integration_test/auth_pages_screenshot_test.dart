import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture login, forgot password, and success states', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 3));

    await waitForScreenReady(
      tester,
      readyFinder: find.text('Masuk untuk melihat kekayaan bersihmu'),
    );
    await holdForHostScreenshot(tester, 'login_page_forgot_link_simulator');

    await tester.tap(find.text('Lupa kata sandi?'));
    await tester.pumpAndSettle(const Duration(seconds: 2));

    await waitForScreenReady(
      tester,
      readyFinder: find.text(
        'Masukkan email akunmu, kami kirimkan tautan reset kata sandi',
      ),
    );
    await holdForHostScreenshot(tester, 'forgot_password_empty_simulator');

    await tester.enterText(find.byType(TextField), 'user@example.com');
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ElevatedButton, 'Kirim Tautan Reset'));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await waitForScreenReady(
      tester,
      readyFinder: find.text(
        'Jika email terdaftar, tautan reset sudah dikirim. Silakan cek email kamu.',
      ),
    );
    await holdForHostScreenshot(tester, 'forgot_password_success_simulator');
  });
}
