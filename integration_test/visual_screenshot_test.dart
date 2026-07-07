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
  await tester.pumpAndSettle(const Duration(seconds: 20));
  expect(find.text('Kekayaan Bersih'), findsOneWidget);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture dashboard and transaction form screenshots', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await _login(tester);

    // Pause on dashboard for host simctl screenshot.
    await tester.pump(const Duration(seconds: 20));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Pendapatan').last);
    await tester.pumpAndSettle(const Duration(seconds: 30));

    expect(find.text('Nominal'), findsOneWidget);

    // Pause on transaction form for host simctl screenshot.
    await tester.pump(const Duration(seconds: 45));
  });
}
