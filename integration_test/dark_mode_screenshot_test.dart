import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_test/integration_test.dart';

import 'package:wealth_checker_mobile/main.dart' as app;

import 'screenshot_helpers.dart';

Future<void> _openProfileSheet(WidgetTester tester) async {
  await tapNavTab(tester, 'Lainnya');
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Kelola & Modul'),
  );
  await tester.tap(find.byKey(const Key('more_menu_profile')));
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await waitForScreenReady(
    tester,
    readyFinder: find.text('Profil & Pengaturan'),
  );
}

Future<void> _scrollProfileSheetUntilVisible(
  WidgetTester tester,
  Finder target,
) async {
  await tester.scrollUntilVisible(
    target,
    120,
    scrollable: find.descendant(
      of: find.byType(DraggableScrollableSheet),
      matching: find.byType(Scrollable),
    ).first,
  );
  await tester.pumpAndSettle();
}

Future<void> _enableDarkModeFromProfile(WidgetTester tester) async {
  await _openProfileSheet(tester);
  final darkModeSwitch = find.descendant(
    of: find.widgetWithText(SwitchListTile, 'Mode Gelap'),
    matching: find.byType(Switch),
  );
  await _scrollProfileSheetUntilVisible(tester, darkModeSwitch);
  await tester.tap(darkModeSwitch);
  await tester.pumpAndSettle(const Duration(seconds: 2));
  await tester.tap(find.byIcon(Icons.close).first);
  await tester.pumpAndSettle(const Duration(seconds: 1));
}

Future<void> _logoutFromProfile(WidgetTester tester) async {
  await _openProfileSheet(tester);
  final logoutButton = find.widgetWithText(OutlinedButton, 'Keluar');
  await _scrollProfileSheetUntilVisible(tester, logoutButton);
  await tester.ensureVisible(logoutButton);
  await tester.tap(logoutButton);
  await tester.pumpAndSettle(const Duration(seconds: 15));
}

Future<void> _goToOnboarding(WidgetTester tester) async {
  final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
  final router = materialApp.routerConfig! as GoRouter;
  router.go('/onboarding');
  await tester.pumpAndSettle(const Duration(seconds: 3));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('capture dark mode screenshots via profile toggle', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 5));
    await loginForScreenshots(tester);
    expect(find.textContaining('Kekayaan Bersih'), findsOneWidget);

    await _enableDarkModeFromProfile(tester);
    await _logoutFromProfile(tester);
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Masuk untuk melihat kekayaan bersihmu'),
      timeout: const Duration(seconds: 30),
    );
    await holdForHostScreenshot(tester, 'dark_login');

    await loginForScreenshots(tester);
    expect(find.textContaining('Kekayaan Bersih'), findsOneWidget);

    await tapNavTab(tester, 'Beranda');
    await waitForScreenReady(
      tester,
      readyFinder: find.textContaining('Kekayaan Bersih'),
      timeout: const Duration(seconds: 30),
    );
    await holdForHostScreenshot(tester, 'dark_dashboard');

    await tapNavTab(tester, 'Transaksi');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Transaksi'),
    );
    await holdForHostScreenshot(tester, 'dark_transactions');

    await tapNavTab(tester, 'Lainnya');
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kelola & Modul'),
    );
    await tester.tap(find.byKey(const Key('more_menu_health')));
    await tester.pumpAndSettle(const Duration(seconds: 3));
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Cek Kesehatan Finansial'),
    );
    await holdForHostScreenshot(tester, 'dark_health_checkup');

    await _goToOnboarding(tester);
    await waitForScreenReady(
      tester,
      readyFinder: find.text('Kas dan Tabungan'),
    );
    await holdForHostScreenshot(tester, 'dark_onboarding_accounts');
  });
}
