// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgeting_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentBudgetPlan)
final currentBudgetPlanProvider = CurrentBudgetPlanProvider._();

final class CurrentBudgetPlanProvider
    extends
        $FunctionalProvider<
          AsyncValue<BudgetPlan?>,
          BudgetPlan?,
          FutureOr<BudgetPlan?>
        >
    with $FutureModifier<BudgetPlan?>, $FutureProvider<BudgetPlan?> {
  CurrentBudgetPlanProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentBudgetPlanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentBudgetPlanHash();

  @$internal
  @override
  $FutureProviderElement<BudgetPlan?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BudgetPlan?> create(Ref ref) {
    return currentBudgetPlan(ref);
  }
}

String _$currentBudgetPlanHash() => r'dc7fefd2c6cc2bd2a5cbc9b371de172b56d0fe7b';

@ProviderFor(budgetingAdvice)
final budgetingAdviceProvider = BudgetingAdviceProvider._();

final class BudgetingAdviceProvider
    extends
        $FunctionalProvider<
          AsyncValue<BudgetingAdvice>,
          BudgetingAdvice,
          FutureOr<BudgetingAdvice>
        >
    with $FutureModifier<BudgetingAdvice>, $FutureProvider<BudgetingAdvice> {
  BudgetingAdviceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetingAdviceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetingAdviceHash();

  @$internal
  @override
  $FutureProviderElement<BudgetingAdvice> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BudgetingAdvice> create(Ref ref) {
    return budgetingAdvice(ref);
  }
}

String _$budgetingAdviceHash() => r'56aa13631c7910349402d6182505087c7e86e876';
