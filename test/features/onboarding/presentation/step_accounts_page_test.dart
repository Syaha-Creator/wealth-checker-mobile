import 'package:dio/dio.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/accounts_repository.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/onboarding/presentation/pages/step_accounts_page.dart';
import 'package:wealth_checker_mobile/features/onboarding/presentation/providers/onboarding_wizard_provider.dart';

class _RecordingAccountsRepository extends AccountsRepository {
  _RecordingAccountsRepository(this.created) : super(Dio());

  final List<({String nama, double saldoAwal})> created;

  @override
  Future<Account> createAccount({
    required String nama,
    required double saldoAwal,
  }) async {
    created.add((nama: nama, saldoAwal: saldoAwal));
    return Account(
      id: 'acc-${created.length}',
      userId: 'user-1',
      nama: nama,
      saldoCache: saldoAwal.toInt(),
      isActive: true,
      createdAt: '2026-07-01T00:00:00.000Z',
    );
  }
}

void main() {
  testWidgets('StepAccountsPage submits two local entries sequentially',
      (tester) async {
    final created = <({String nama, double saldoAwal})>[];

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          accountsRepositoryProvider.overrideWith(
            (ref) => _RecordingAccountsRepository(created),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.light,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('id')],
          home: const Scaffold(body: StepAccountsPage()),
        ),
      ),
    );

    await tester.pumpAndSettle();

    Future<void> addAccount(String name, String balance) async {
      final fields = find.byType(FormBuilderTextField);
      expect(fields, findsNWidgets(2));
      await tester.enterText(fields.at(0), name);
      await tester.enterText(fields.at(1), balance);
      await tester.tap(find.text('Tambah ke daftar'));
      await tester.pumpAndSettle();
    }

    await addAccount('BCA', '1000000');
    await addAccount('Mandiri', '500000');

    expect(find.textContaining('BCA'), findsOneWidget);
    expect(find.textContaining('Mandiri'), findsOneWidget);

    final container = ProviderScope.containerOf(
      tester.element(find.byType(StepAccountsPage)),
    );
    final completed =
        await container.read(onboardingWizardProvider.notifier).submitCurrentStepAndAdvance();
    await tester.pumpAndSettle();

    expect(completed, isFalse);
    expect(created, [
      (nama: 'BCA', saldoAwal: 1000000),
      (nama: 'Mandiri', saldoAwal: 500000),
    ]);
    expect(
      container.read(onboardingWizardProvider).currentStepIndex,
      1,
    );
  });
}
