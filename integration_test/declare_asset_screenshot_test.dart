import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
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

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('declare owned asset updates net worth not account balance',
      (tester) async {
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
    final bcaTestSaldoBefore = _readAccountSaldoByName(tester, 'BCA Test');
    final bcaTabunganSaldoBefore =
        _readAccountSaldoByName(tester, 'BCA Tabungan');

    expect(netWorthBefore, isNotNull);
    expect(bcaTestSaldoBefore, isNotNull);
    expect(bcaTabunganSaldoBefore, isNotNull);

    await holdForHostScreenshot(tester, 'declare_asset_01_beranda_before');

    await tapNavTab(tester, 'Lainnya');
    await tester.tap(find.byKey(const Key('more_menu_assets')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('more_add_investasi_btn')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('snapshot_add_mode_declare')));
    await tester.pumpAndSettle();

    await waitForScreenReady(
      tester,
      readyFinder: find.text('Sudah Dimiliki (Investasi)'),
    );
    await holdForHostScreenshot(tester, 'declare_asset_02_form');

    final assetName = 'Declare RD ${DateTime.now().millisecondsSinceEpoch}';
    await _enterFieldText(tester, const Key('declare_nama_aset_field'), assetName);
    await _enterFieldText(tester, const Key('declare_jumlah_field'), '10');
    await _enterFieldText(tester, const Key('declare_harga_field'), '100000');
    await tester.tap(find.textContaining('Catat aset yang sudah'));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('declare_asset_submit_btn')));

    final submitDeadline = DateTime.now().add(const Duration(seconds: 25));
    while (DateTime.now().isBefore(submitDeadline)) {
      await tester.pump(const Duration(milliseconds: 500));
      if (find.text('Sudah Dimiliki (Investasi)').evaluate().isEmpty) {
        break;
      }
    }

    if (find.text('Sudah Dimiliki (Investasi)').evaluate().isNotEmpty) {
      await holdForHostScreenshot(tester, 'declare_asset_02b_submit_error');
      final visibleTexts = tester
          .widgetList<Text>(find.byType(Text))
          .map((widget) => widget.data)
          .whereType<String>()
          .where((text) => text.trim().isNotEmpty)
          .take(12)
          .join(' | ');
      fail('Declare form did not close. Visible text: $visibleTexts');
    }

    await tapNavTab(tester, 'Beranda');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kekayaan Bersih (Net Worth)'),
    );

    final netWorthAfter = _readAmountAfterLabel(
      tester,
      'Kekayaan Bersih (Net Worth)',
    );
    final bcaTestSaldoAfter = _readAccountSaldoByName(tester, 'BCA Test');
    final bcaTabunganSaldoAfter =
        _readAccountSaldoByName(tester, 'BCA Tabungan');

    expect(netWorthAfter, greaterThan(netWorthBefore!));
    expect(bcaTestSaldoAfter, bcaTestSaldoBefore);
    expect(bcaTabunganSaldoAfter, bcaTabunganSaldoBefore);

    await holdForHostScreenshot(tester, 'declare_asset_03_beranda_after');
  });
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

  final texts = tester.widgetList<Text>(
    find.descendant(of: columnFinder.first, matching: find.byType(Text)),
  );

  for (final text in texts) {
    final data = text.data;
    if (data != null && data.startsWith('Rp')) {
      return _parseRupiah(data);
    }
  }

  return null;
}

int? _readAccountSaldoByName(WidgetTester tester, String accountName) {
  final nameFinder = find.text(accountName);
  if (nameFinder.evaluate().isEmpty) {
    return null;
  }

  final rowFinder = find.ancestor(
    of: nameFinder,
    matching: find.byType(Row),
  );
  if (rowFinder.evaluate().isEmpty) {
    return null;
  }

  for (final text in tester.widgetList<Text>(
    find.descendant(of: rowFinder.first, matching: find.byType(Text)),
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
