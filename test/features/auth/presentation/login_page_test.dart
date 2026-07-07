import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/pages/login_page.dart';

void main() {
  testWidgets('LoginPage shows validation when submitting empty form',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('en')],
          home: const LoginPage(),
        ),
      ),
    );

    await tester.tap(find.widgetWithText(ElevatedButton, 'Masuk'));
    await tester.pumpAndSettle();

    final decorators = tester.widgetList<InputDecorator>(
      find.descendant(
        of: find.byType(FormBuilder),
        matching: find.byType(InputDecorator),
      ),
    );

    expect(decorators.length, greaterThanOrEqualTo(2));
    expect(
      decorators.where((decorator) => decorator.decoration.errorText != null),
      isNotEmpty,
    );
  });
}
