import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/features/accounts/data/accounts_repository.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/onboarding/data/models/onboarding_entries.dart';
import 'package:wealth_checker_mobile/features/onboarding/presentation/providers/onboarding_wizard_provider.dart';

class _RecordingAccountsRepository extends AccountsRepository {
  _RecordingAccountsRepository(this.created, {this.shouldFail = false})
      : super(Dio());

  final List<({String nama, double saldoAwal})> created;
  final bool shouldFail;

  @override
  Future<Account> createAccount({
    required String nama,
    required double saldoAwal,
  }) async {
    if (shouldFail) {
      throw const ApiException(message: 'Gagal menyimpan rekening');
    }
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
  group('OnboardingWizard', () {
    test('submitCurrentStepAndAdvance advances step after successful submit',
        () async {
      final created = <({String nama, double saldoAwal})>[];
      final container = ProviderContainer(
        overrides: [
          accountsRepositoryProvider.overrideWith(
            (ref) => _RecordingAccountsRepository(created),
          ),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(onboardingWizardProvider.notifier);
      notifier
        ..addLocalEntry(
          0,
          const OnboardingAccountEntry(nama: 'BCA', saldoAwal: 1000000),
        )
        ..addLocalEntry(
          0,
          const OnboardingAccountEntry(nama: 'Mandiri', saldoAwal: 500000),
        );

      final completed = await notifier.submitCurrentStepAndAdvance();

      expect(completed, isFalse);
      expect(container.read(onboardingWizardProvider).currentStepIndex, 1);
      expect(created, [
        (nama: 'BCA', saldoAwal: 1000000),
        (nama: 'Mandiri', saldoAwal: 500000),
      ]);
      expect(container.read(onboardingWizardProvider).accountEntries, isEmpty);
    });

    test('submitCurrentStepAndAdvance does not advance when submit fails', () async {
      final created = <({String nama, double saldoAwal})>[];
      final container = ProviderContainer(
        overrides: [
          accountsRepositoryProvider.overrideWith(
            (ref) => _RecordingAccountsRepository(created, shouldFail: true),
          ),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(onboardingWizardProvider.notifier);
      notifier.addLocalEntry(
        0,
        const OnboardingAccountEntry(nama: 'BCA', saldoAwal: 1000000),
      );

      final completed = await notifier.submitCurrentStepAndAdvance();

      expect(completed, isFalse);
      expect(container.read(onboardingWizardProvider).currentStepIndex, 0);
      expect(
        container.read(onboardingWizardProvider).submitStatus,
        OnboardingSubmitStatus.error,
      );
      expect(
        container.read(onboardingWizardProvider).errorMessage,
        'Gagal menyimpan rekening',
      );
      expect(container.read(onboardingWizardProvider).accountEntries.length, 1);
    });
  });
}
