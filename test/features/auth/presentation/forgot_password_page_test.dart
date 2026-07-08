import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/auth/data/auth_repository.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:wealth_checker_mobile/features/auth/presentation/widgets/auth_page_widgets.dart';

void main() {
  group('ForgotPasswordPage', () {
    testWidgets('renders forgot password form', (tester) async {
      await tester.pumpWidget(_buildForgotPasswordApp());
      await tester.pumpAndSettle();

      expect(find.text('Lupa Kata Sandi'), findsOneWidget);
      expect(
        find.text(
          'Masukkan email akunmu, kami kirimkan tautan reset kata sandi',
        ),
        findsOneWidget,
      );
      expect(find.text('Kirim Tautan Reset'), findsOneWidget);
      expect(find.text('Ingat kata sandimu? '), findsOneWidget);
      expect(find.text('Masuk'), findsOneWidget);
    });

    testWidgets('shows generic success message after submit', (tester) async {
      await tester.pumpWidget(
        _buildForgotPasswordApp(
          repository: _RecordingAuthRepository(),
        ),
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byWidgetPredicate(
          (widget) =>
              widget is FormBuilderTextField && widget.name == 'email',
        ),
        'user@example.com',
      );
      await tester.pumpAndSettle();

      await tester.tap(find.widgetWithText(ElevatedButton, 'Kirim Tautan Reset'));
      await tester.pumpAndSettle();

      expect(
        find.text(
          'Jika email terdaftar, tautan reset sudah dikirim. Silakan cek email kamu.',
        ),
        findsOneWidget,
      );
      expect(find.byType(AuthSuccessBanner), findsOneWidget);
      expect(find.text('Kirim Tautan Reset'), findsNothing);
    });
  });
}

Widget _buildForgotPasswordApp({
  AuthRepository? repository,
}) {
  return ProviderScope(
    overrides: [
      if (repository != null)
        authRepositoryProvider.overrideWith((_) => repository),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const ForgotPasswordPage(),
    ),
  );
}

class _RecordingAuthRepository extends AuthRepository {
  _RecordingAuthRepository() : super(_NoOpDio());

  @override
  Future<void> requestPasswordReset(String email) async {}
}

class _NoOpDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
