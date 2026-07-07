import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/api_exception.dart';
import '../../../accounts/data/accounts_repository.dart';
import '../../../assets/data/assets_repository.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../debts_receivables/data/debts_repository.dart';
import '../../data/models/onboarding_entries.dart';
import '../../data/profile_repository.dart';

part 'onboarding_wizard_provider.freezed.dart';
part 'onboarding_wizard_provider.g.dart';

enum OnboardingSubmitStatus {
  idle,
  submitting,
  success,
  error,
}

@freezed
abstract class OnboardingWizardState with _$OnboardingWizardState {
  const factory OnboardingWizardState({
    @Default(0) int currentStepIndex,
    @Default(OnboardingSubmitStatus.idle) OnboardingSubmitStatus submitStatus,
    String? errorMessage,
    @Default([]) List<OnboardingAccountEntry> accountEntries,
    @Default([]) List<OnboardingAssetEntry> liquidAssetEntries,
    @Default([]) List<OnboardingAssetEntry> fixedAssetEntries,
    @Default([]) List<OnboardingDebtEntry> debtEntries,
    @Default([]) List<OnboardingReceivableEntry> receivableEntries,
    @Default([]) List<OnboardingDebtEntry> creditCardEntries,
    OnboardingProfileEntry? profileEntry,
  }) = _OnboardingWizardState;
}

@Riverpod(keepAlive: true)
class OnboardingWizard extends _$OnboardingWizard {
  @override
  OnboardingWizardState build() => const OnboardingWizardState();

  void addLocalEntry(int step, Object entry) {
    switch (step) {
      case 0:
        state = state.copyWith(
          accountEntries: [...state.accountEntries, entry as OnboardingAccountEntry],
        );
      case 1:
        state = state.copyWith(
          liquidAssetEntries: [
            ...state.liquidAssetEntries,
            entry as OnboardingAssetEntry,
          ],
        );
      case 2:
        state = state.copyWith(
          fixedAssetEntries: [
            ...state.fixedAssetEntries,
            entry as OnboardingAssetEntry,
          ],
        );
      case 3:
        state = state.copyWith(
          debtEntries: [...state.debtEntries, entry as OnboardingDebtEntry],
        );
      case 4:
        state = state.copyWith(
          receivableEntries: [
            ...state.receivableEntries,
            entry as OnboardingReceivableEntry,
          ],
        );
      case 5:
        state = state.copyWith(
          creditCardEntries: [
            ...state.creditCardEntries,
            entry as OnboardingDebtEntry,
          ],
        );
      default:
        throw ArgumentError('Step $step does not support multi-entry');
    }
  }

  void removeLocalEntry(int step, int index) {
    switch (step) {
      case 0:
        final entries = [...state.accountEntries]..removeAt(index);
        state = state.copyWith(accountEntries: entries);
      case 1:
        final entries = [...state.liquidAssetEntries]..removeAt(index);
        state = state.copyWith(liquidAssetEntries: entries);
      case 2:
        final entries = [...state.fixedAssetEntries]..removeAt(index);
        state = state.copyWith(fixedAssetEntries: entries);
      case 3:
        final entries = [...state.debtEntries]..removeAt(index);
        state = state.copyWith(debtEntries: entries);
      case 4:
        final entries = [...state.receivableEntries]..removeAt(index);
        state = state.copyWith(receivableEntries: entries);
      case 5:
        final entries = [...state.creditCardEntries]..removeAt(index);
        state = state.copyWith(creditCardEntries: entries);
      default:
        throw ArgumentError('Step $step does not support multi-entry');
    }
  }

  void setProfileEntry(OnboardingProfileEntry entry) {
    state = state.copyWith(profileEntry: entry);
  }

  void goBack() {
    if (state.currentStepIndex <= 0) {
      return;
    }
    state = state.copyWith(
      currentStepIndex: state.currentStepIndex - 1,
      submitStatus: OnboardingSubmitStatus.idle,
      errorMessage: null,
    );
  }

  Future<bool> submitCurrentStepAndAdvance() async {
    state = state.copyWith(
      submitStatus: OnboardingSubmitStatus.submitting,
      errorMessage: null,
    );

    try {
      await _submitStep(state.currentStepIndex);

      final completedStep = state.currentStepIndex;
      if (completedStep >= onboardingStepCount - 1) {
        ref.invalidate(wealthSummaryProvider);
        ref.invalidate(emergencyFundProvider);
        state = state.copyWith(
          submitStatus: OnboardingSubmitStatus.success,
        );
        return true;
      }

      state = state.copyWith(
        currentStepIndex: completedStep + 1,
        submitStatus: OnboardingSubmitStatus.idle,
        errorMessage: null,
        accountEntries: completedStep == 0 ? [] : state.accountEntries,
        liquidAssetEntries: completedStep == 1 ? [] : state.liquidAssetEntries,
        fixedAssetEntries: completedStep == 2 ? [] : state.fixedAssetEntries,
        debtEntries: completedStep == 3 ? [] : state.debtEntries,
        receivableEntries: completedStep == 4 ? [] : state.receivableEntries,
        creditCardEntries: completedStep == 5 ? [] : state.creditCardEntries,
      );
      return false;
    } catch (error) {
      state = state.copyWith(
        submitStatus: OnboardingSubmitStatus.error,
        errorMessage: _errorMessage(error),
      );
      return false;
    }
  }

  Future<void> _submitStep(int step) async {
    switch (step) {
      case 0:
        final accountsRepo = ref.read(accountsRepositoryProvider);
        for (final entry in state.accountEntries) {
          await accountsRepo.createAccount(
            nama: entry.nama,
            saldoAwal: entry.saldoAwal,
          );
        }
      case 1:
        final assetsRepo = ref.read(assetsRepositoryProvider);
        for (final entry in state.liquidAssetEntries) {
          await assetsRepo.createLiquidAsset(
            namaAset: entry.namaAset,
            jumlah: entry.jumlah,
            hargaBeliRataRata: entry.hargaBeliRataRata,
          );
        }
      case 2:
        final assetsRepo = ref.read(assetsRepositoryProvider);
        for (final entry in state.fixedAssetEntries) {
          await assetsRepo.createFixedAsset(
            namaAset: entry.namaAset,
            jumlah: entry.jumlah,
            hargaBeliRataRata: entry.hargaBeliRataRata,
          );
        }
      case 3:
        final debtsRepo = ref.read(debtsRepositoryProvider);
        for (final entry in state.debtEntries) {
          await debtsRepo.createDebt(
            pemberiUtang: entry.pemberiUtang,
            tipe: 'utang_biasa',
            saldoAwal: entry.saldoAwal,
          );
        }
      case 4:
        final debtsRepo = ref.read(debtsRepositoryProvider);
        for (final entry in state.receivableEntries) {
          await debtsRepo.createReceivable(
            peminjam: entry.peminjam,
            saldoAwal: entry.saldoAwal,
          );
        }
      case 5:
        final debtsRepo = ref.read(debtsRepositoryProvider);
        for (final entry in state.creditCardEntries) {
          await debtsRepo.createDebt(
            pemberiUtang: entry.pemberiUtang,
            tipe: 'kartu_kredit',
            saldoAwal: entry.saldoAwal,
          );
        }
      case 6:
        final profile = state.profileEntry;
        if (profile == null) {
          throw StateError('Lengkapi data profil sebelum melanjutkan.');
        }
        await ref.read(profileRepositoryProvider).updateProfile(
              tanggalLahir: profile.tanggalLahir,
              rencanaUsiaPensiun: profile.rencanaUsiaPensiun,
              rencanaUsiaWarisan: profile.rencanaUsiaWarisan,
              anggotaKeluargaDitanggung: profile.anggotaKeluargaDitanggung,
              pemasukanBulananRataRata: profile.pemasukanBulananRataRata,
              pengeluaranBulananRataRata: profile.pengeluaranBulananRataRata,
            );
      default:
        throw ArgumentError('Invalid step index: $step');
    }
  }

  String _errorMessage(Object error) {
    if (error is ApiException) {
      return error.message;
    }
    if (error is StateError) {
      return error.message;
    }
    return 'Terjadi kesalahan. Silakan coba lagi.';
  }
}
