import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const screenshotTestEmail = 'wc-txform-1783390317@example.com';
const screenshotTestPassword = 'TestPass123!';

/// Hold window after signaling host simctl — keep in sync with shell scripts.
const screenshotHoldDuration = Duration(seconds: 30);

/// Magic prefix read by tool/capture_*_screenshots.sh to trigger simctl capture.
const screenshotSignalPrefix = '@@SCREENSHOT@@:';

Future<void> loginForScreenshots(WidgetTester tester) async {
  final fields = find.byType(TextField);
  await tester.enterText(fields.at(0), screenshotTestEmail);
  await tester.enterText(fields.at(1), screenshotTestPassword);
  await tester.tap(find.byType(ElevatedButton));
  await tester.pumpAndSettle(const Duration(seconds: 30));
}

Future<void> tapNavTab(WidgetTester tester, String label) async {
  final tooltip = find.byTooltip(label);
  if (tooltip.evaluate().isNotEmpty) {
    await tester.tap(tooltip);
  } else {
    await tester.tap(find.text(label));
  }
  await tester.pumpAndSettle(const Duration(milliseconds: 500));
}

Future<void> waitForScreenReady(
  WidgetTester tester, {
  required Finder readyFinder,
  Duration timeout = const Duration(seconds: 20),
}) async {
  final deadline = DateTime.now().add(timeout);

  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 200));

    final hasReadyContent = readyFinder.evaluate().isNotEmpty;
    final isLoading = find.byType(CircularProgressIndicator).evaluate().isNotEmpty;

    if (hasReadyContent && !isLoading) {
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      return;
    }
  }

  fail('Timed out waiting for screen marker: $readyFinder');
}

void signalScreenshotReady(String fileStem) {
  // ignore: avoid_print
  print('$screenshotSignalPrefix$fileStem');
}

Future<void> holdForHostScreenshot(WidgetTester tester, String fileStem) async {
  signalScreenshotReady(fileStem);
  await tester.pump(screenshotHoldDuration);
}
