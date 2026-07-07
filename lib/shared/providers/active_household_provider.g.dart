// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_household_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Active household context for API requests.
///
/// `null` means the backend falls back to the user's default household.

@ProviderFor(ActiveHouseholdId)
final activeHouseholdIdProvider = ActiveHouseholdIdProvider._();

/// Active household context for API requests.
///
/// `null` means the backend falls back to the user's default household.
final class ActiveHouseholdIdProvider
    extends $NotifierProvider<ActiveHouseholdId, String?> {
  /// Active household context for API requests.
  ///
  /// `null` means the backend falls back to the user's default household.
  ActiveHouseholdIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeHouseholdIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeHouseholdIdHash();

  @$internal
  @override
  ActiveHouseholdId create() => ActiveHouseholdId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$activeHouseholdIdHash() => r'56e20b3d0ece26032878d1aec3ff594a47d3919b';

/// Active household context for API requests.
///
/// `null` means the backend falls back to the user's default household.

abstract class _$ActiveHouseholdId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
