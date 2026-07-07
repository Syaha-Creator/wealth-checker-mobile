// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retirement_plan_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(retirementPlan)
final retirementPlanProvider = RetirementPlanProvider._();

final class RetirementPlanProvider
    extends
        $FunctionalProvider<
          AsyncValue<RetirementPlan>,
          RetirementPlan,
          FutureOr<RetirementPlan>
        >
    with $FutureModifier<RetirementPlan>, $FutureProvider<RetirementPlan> {
  RetirementPlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'retirementPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$retirementPlanHash();

  @$internal
  @override
  $FutureProviderElement<RetirementPlan> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<RetirementPlan> create(Ref ref) {
    return retirementPlan(ref);
  }
}

String _$retirementPlanHash() => r'6e94259b65341ded6fd9a68b45da9260dd01cdf6';
