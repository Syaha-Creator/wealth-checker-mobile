import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/app.dart';
import 'package:wealth_checker_mobile/shared/providers/auth_state_provider.dart';

class _UnauthenticatedAuthState extends AuthState {
  @override
  Future<AuthStatus> build() async => AuthStatus.unauthenticated;
}

void main() {
  testWidgets('shows login page for unauthenticated users',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateProvider.overrideWith(_UnauthenticatedAuthState.new),
        ],
        child: const WealthCheckerApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Masuk ke akun Anda'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Masuk'), findsOneWidget);
  });
}
