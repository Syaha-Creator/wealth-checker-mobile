import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

const _testEmail = 'wc-txform-1783390317@example.com';
const _testPassword = 'TestPass123!';

Future<void> _login(WidgetTester tester) async {
  final fields = find.byType(TextField);
  await tester.enterText(fields.at(0), _testEmail);
  await tester.enterText(fields.at(1), _testPassword);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle(const Duration(seconds: 30));
  expect(find.text('Beranda'), findsOneWidget);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture beranda and bottom nav tabs', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await _login(tester);
    await tester.pump(const Duration(seconds: 25));

    await tester.tap(find.text('Impian'));
    await tester.pumpAndSettle(const Duration(seconds: 8));
    await tester.pump(const Duration(seconds: 15));

    await tester.tap(find.text('Analitik'));
    await tester.pumpAndSettle(const Duration(seconds: 8));
    await tester.pump(const Duration(seconds: 15));

    await tester.tap(find.text('Beranda'));
    await tester.pumpAndSettle(const Duration(seconds: 8));
    await tester.pump(const Duration(seconds: 25));
  });
}
