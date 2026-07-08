import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/pages/login_page.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/pages/register_page.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/widgets/auth_page_widgets.dart';

void main() {
  group('LoginPage', () {
    testWidgets('shows validation when submitting empty form', (tester) async {
      await tester.pumpWidget(_buildLoginApp());

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

    testWidgets('renders centered auth header and footer link', (tester) async {
      await tester.pumpWidget(_buildLoginApp());
      await tester.pumpAndSettle();

      expect(find.byType(AuthLogoMark), findsOneWidget);
      expect(find.text('Wealth Checker'), findsOneWidget);
      expect(find.text('Masuk untuk melihat kekayaan bersihmu'), findsOneWidget);
      expect(find.text('Daftar'), findsOneWidget);
      expect(find.text('Belum punya akun? '), findsOneWidget);
    });
  });

  group('RegisterPage', () {
    testWidgets('renders register fields and footer link', (tester) async {
      await tester.pumpWidget(_buildRegisterApp());
      await tester.pumpAndSettle();

      expect(find.text('Buat akun baru untuk mulai memantau kekayaanmu'),
          findsOneWidget);
      expect(find.text('Nama'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Kata Sandi'), findsOneWidget);
      expect(find.text('Minimal 8 karakter'), findsOneWidget);
      expect(find.text('Masuk'), findsWidgets);
      expect(find.text('Sudah punya akun? '), findsOneWidget);
    });
  });
}

Widget _buildLoginApp() {
  return ProviderScope(
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const LoginPage(),
    ),
  );
}

Widget _buildRegisterApp() {
  return ProviderScope(
    child: MaterialApp.router(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: '/login',
            builder: (context, state) => const LoginPage(),
          ),
        ],
      ),
    ),
  );
}
