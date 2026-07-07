// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retirement_plan_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(retirementPlanRepository)
final retirementPlanRepositoryProvider = RetirementPlanRepositoryProvider._();

final class RetirementPlanRepositoryProvider
    extends
        $FunctionalProvider<
          RetirementPlanRepository,
          RetirementPlanRepository,
          RetirementPlanRepository
        >
    with $Provider<RetirementPlanRepository> {
  RetirementPlanRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'retirementPlanRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$retirementPlanRepositoryHash();

  @$internal
  @override
  $ProviderElement<RetirementPlanRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RetirementPlanRepository create(Ref ref) {
    return retirementPlanRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RetirementPlanRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RetirementPlanRepository>(value),
    );
  }
}

String _$retirementPlanRepositoryHash() =>
    r'e1ecd63c860d6e4f2d56b79d7fb55ac973371e90';
