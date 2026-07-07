// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_wizard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OnboardingWizard)
final onboardingWizardProvider = OnboardingWizardProvider._();

final class OnboardingWizardProvider
    extends $NotifierProvider<OnboardingWizard, OnboardingWizardState> {
  OnboardingWizardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingWizardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingWizardHash();

  @$internal
  @override
  OnboardingWizard create() => OnboardingWizard();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingWizardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingWizardState>(value),
    );
  }
}

String _$onboardingWizardHash() => r'9ab97172892ca4beb902e8d8b6111f1db1e5f6f5';

abstract class _$OnboardingWizard extends $Notifier<OnboardingWizardState> {
  OnboardingWizardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OnboardingWizardState, OnboardingWizardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OnboardingWizardState, OnboardingWizardState>,
              OnboardingWizardState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
