import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

Future<void> _goToAccountForm(WidgetTester tester) async {
  final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
  final router = materialApp.routerConfig! as GoRouter;
  router.go('/accounts/new');
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Tambah Rekening'),
  );
}

Future<void> _goToDebtForm(WidgetTester tester) async {
  final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
  final router = materialApp.routerConfig! as GoRouter;
  router.go('/debts/new');
  await tester.pumpAndSettle(const Duration(seconds: 3));
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Tambah Utang'),
  );
}

Future<void> _submitFormAndCaptureSnackBar(
  WidgetTester tester,
  String buttonLabel,
  String snackBarText,
  String screenshotStem,
) async {
  final submitButton = find.widgetWithText(ElevatedButton, buttonLabel);
  await tester.ensureVisible(submitButton);
  await tester.tap(submitButton);
  await tester.pump(const Duration(milliseconds: 300));

  final deadline = DateTime.now().add(const Duration(seconds: 15));
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 200));
    if (find.text(snackBarText).evaluate().isNotEmpty) {
      break;
    }
  }

  expect(find.text(snackBarText), findsOneWidget);
  await holdForHostScreenshot(tester, screenshotStem);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture snackbar feedback after account and debt create', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await loginForScreenshots(tester);

    await _goToAccountForm(tester);
    final uniqueAccount = 'Snack Audit ${DateTime.now().millisecondsSinceEpoch}';
    final accountFields = find.byType(TextField);
    await tester.enterText(accountFields.at(0), uniqueAccount);
    await tester.enterText(accountFields.at(1), '1000000');
    await _submitFormAndCaptureSnackBar(
      tester,
      'Tambah',
      'Rekening berhasil ditambahkan',
      'snackbar_account_create',
    );

    await _goToDebtForm(tester);
    final uniqueDebt = 'Bank Snack ${DateTime.now().millisecondsSinceEpoch}';
    final debtFields = find.byType(TextField);
    await tester.enterText(debtFields.at(0), uniqueDebt);
    await tester.enterText(debtFields.at(1), '500000');
    await _submitFormAndCaptureSnackBar(
      tester,
      'Tambah',
      'Utang berhasil ditambahkan',
      'snackbar_debt_create',
    );
  });
}
