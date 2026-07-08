import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:wealth_checker_mobile/features/onboarding/presentation/widgets/onboarding_page_widgets.dart';

void main() {
  testWidgets('OnboardingPage shows progress header and primary action',
      (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('id')],
          home: const OnboardingPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Langkah 1 dari 7'), findsOneWidget);
    expect(find.text('Kas dan Tabungan'), findsOneWidget);
    expect(find.byType(OnboardingProgressHeader), findsOneWidget);
    expect(find.text('Lanjut'), findsOneWidget);
    expect(find.text('Kembali'), findsNothing);
  });
}
