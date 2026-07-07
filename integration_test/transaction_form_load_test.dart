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

Future<void> _openTransactionType(
  WidgetTester tester,
  String quickAddLabel,
  String expectedTitle,
) async {
  await tester.tap(find.byType(FloatingActionButton));
  await tester.pumpAndSettle();
  await tester.tap(find.text(quickAddLabel).last);
  await tester.pumpAndSettle(const Duration(seconds: 15));

  expect(find.text(expectedTitle), findsOneWidget);
  expect(find.byType(CircularProgressIndicator), findsNothing);

  if (quickAddLabel != 'Transfer') {
    expect(find.text('Nominal'), findsOneWidget);
  } else {
    expect(find.text('Rekening asal'), findsOneWidget);
    expect(find.text('Rekening tujuan'), findsOneWidget);
  }
  expect(find.text('Catat'), findsOneWidget);

  await tester.pageBack();
  await tester.pumpAndSettle();
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('transaction forms open without prolonged loading', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await _login(tester);

    await _openTransactionType(
      tester,
      'Pendapatan',
      'Tambah Pendapatan',
    );
    await _openTransactionType(
      tester,
      'Pengeluaran',
      'Tambah Pengeluaran',
    );
    await _openTransactionType(
      tester,
      'Transfer',
      'Tambah Transfer',
    );
  });
}
