import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

Future<void> _goToOnboarding(WidgetTester tester) async {
  await tester.pumpAndSettle(const Duration(seconds: 2));
  final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
  final router = materialApp.routerConfig! as GoRouter;
  router.go('/onboarding');
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

Future<void> _addAccountEntry(WidgetTester tester) async {
  final fields = find.byType(TextField);
  await tester.enterText(fields.at(0), 'BCA Tabungan');
  await tester.enterText(fields.at(1), '1500000');
  await tester.tap(find.text('Tambah ke daftar'));
  await tester.pumpAndSettle(const Duration(seconds: 2));
}

Future<void> _advanceToProfileStep(WidgetTester tester) async {
  for (var step = 0; step < 6; step++) {
    await tester.tap(find.text('Lanjut'));
    await tester.pumpAndSettle(const Duration(seconds: 3));
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture onboarding wizard representative steps', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await loginForScreenshots(tester);
    await _goToOnboarding(tester);

    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kas dan Tabungan'),
    );
    await _addAccountEntry(tester);
    expect(find.textContaining('BCA Tabungan'), findsOneWidget);
    await holdForHostScreenshot(tester, 'onboarding_accounts_step');

    await _advanceToProfileStep(tester);
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Rencana Keuangan'),
    );
    expect(find.text('Tanggal lahir'), findsOneWidget);
    await holdForHostScreenshot(tester, 'onboarding_profile_step');
  });
}
