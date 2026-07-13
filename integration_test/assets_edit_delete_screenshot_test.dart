import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

Future<void> _enterFieldText(
  WidgetTester tester,
  Key fieldKey,
  String value,
) async {
  final editable = find.descendant(
    of: find.byKey(fieldKey),
    matching: find.byType(EditableText),
  );
  await tester.tap(editable);
  await tester.pumpAndSettle();
  await tester.enterText(editable, value);
  await tester.pumpAndSettle();
}

Future<void> _goToPath(WidgetTester tester, String path) async {
  final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
  final router = materialApp.routerConfig! as GoRouter;
  router.go(path);
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

int? _readAmountAfterLabel(WidgetTester tester, String label) {
  final labelFinder = find.text(label);
  if (labelFinder.evaluate().isEmpty) {
    return null;
  }

  final columnFinder = find.ancestor(
    of: labelFinder,
    matching: find.byType(Column),
  );
  if (columnFinder.evaluate().isEmpty) {
    return null;
  }

  for (final text in tester.widgetList<Text>(
    find.descendant(of: columnFinder.first, matching: find.byType(Text)),
  )) {
    final data = text.data;
    if (data != null && data.startsWith('Rp')) {
      return _parseRupiah(data);
    }
  }

  return null;
}

int _parseRupiah(String value) {
  final digits = value.replaceAll(RegExp(r'[^\d]'), '');
  return int.parse(digits);
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('edit and delete assets update list and net worth', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));

    await loginForScreenshots(tester);

    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kekayaan Bersih (Net Worth)'),
    );
    final netWorthBefore = _readAmountAfterLabel(
      tester,
      'Kekayaan Bersih (Net Worth)',
    );
    expect(netWorthBefore, isNotNull);

    await holdForHostScreenshot(tester, 'asset_edit_delete_01_beranda_before');

    await _goToPath(tester, '/assets/liquid');
    await waitForScreenReady(tester, readyFinder: find.text('Investasi'));

    final editButtons = find.byIcon(Icons.edit_outlined);
    final deleteButtons = find.byIcon(Icons.delete_outline);
    expect(editButtons, findsWidgets);
    expect(deleteButtons.evaluate().length, greaterThanOrEqualTo(2));

    await holdForHostScreenshot(tester, 'asset_edit_delete_02_liquid_list');

    await tester.tap(editButtons.first);
    await tester.pumpAndSettle();
    await waitForScreenReady(tester, readyFinder: find.text('Edit Investasi'));

    await _enterFieldText(
      tester,
      const Key('asset_edit_jumlah_field'),
      '15',
    );
    await tester.tap(find.byKey(const Key('asset_edit_submit_btn')));
    await tester.pumpAndSettle(const Duration(seconds: 10));

    await waitForScreenReady(tester, readyFinder: find.text('Investasi'));
    expect(find.textContaining('Jumlah: 15'), findsWidgets);

    await holdForHostScreenshot(tester, 'asset_edit_delete_03_after_edit');

    await tester.tap(deleteButtons.at(1));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Hapus').last);
    await tester.pumpAndSettle(const Duration(seconds: 10));

    await waitForScreenReady(tester, readyFinder: find.text('Investasi'));
    await holdForHostScreenshot(tester, 'asset_edit_delete_04_after_delete');

    await _goToPath(tester, '/home');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kekayaan Bersih (Net Worth)'),
    );

    final netWorthAfter = _readAmountAfterLabel(
      tester,
      'Kekayaan Bersih (Net Worth)',
    );
    expect(netWorthAfter, isNot(netWorthBefore));

    await holdForHostScreenshot(tester, 'asset_edit_delete_05_beranda_after');
  });
}
