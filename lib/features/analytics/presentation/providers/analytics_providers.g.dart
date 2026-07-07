// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wealthHistory)
final wealthHistoryProvider = WealthHistoryProvider._();

final class WealthHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<WealthHistory>,
          WealthHistory,
          FutureOr<WealthHistory>
        >
    with $FutureModifier<WealthHistory>, $FutureProvider<WealthHistory> {
  WealthHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wealthHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wealthHistoryHash();

  @$internal
  @override
  $FutureProviderElement<WealthHistory> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<WealthHistory> create(Ref ref) {
    return wealthHistory(ref);
  }
}

String _$wealthHistoryHash() => r'5ab5ec671c634eac12294e0a88cdab59601acd93';

@ProviderFor(monthlyPl)
final monthlyPlProvider = MonthlyPlProvider._();

final class MonthlyPlProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MonthlyProfitLoss>>,
          List<MonthlyProfitLoss>,
          FutureOr<List<MonthlyProfitLoss>>
        >
    with
        $FutureModifier<List<MonthlyProfitLoss>>,
        $FutureProvider<List<MonthlyProfitLoss>> {
  MonthlyPlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'monthlyPlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$monthlyPlHash();

  @$internal
  @override
  $FutureProviderElement<List<MonthlyProfitLoss>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MonthlyProfitLoss>> create(Ref ref) {
    return monthlyPl(ref);
  }
}

String _$monthlyPlHash() => r'cb8ac0150b703159b355daa3d934f016cec41259';

@ProviderFor(budgetVsActual)
final budgetVsActualProvider = BudgetVsActualProvider._();

final class BudgetVsActualProvider
    extends
        $FunctionalProvider<
          AsyncValue<BudgetVsActual>,
          BudgetVsActual,
          FutureOr<BudgetVsActual>
        >
    with $FutureModifier<BudgetVsActual>, $FutureProvider<BudgetVsActual> {
  BudgetVsActualProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetVsActualProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetVsActualHash();

  @$internal
  @override
  $FutureProviderElement<BudgetVsActual> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<BudgetVsActual> create(Ref ref) {
    return budgetVsActual(ref);
  }
}

String _$budgetVsActualHash() => r'284e5a257298d7858df29179da217d0484002c2b';

/// Reflects the user's current state — deliberately does NOT watch the
/// analytics date filter. Invalidate manually after mutations if needed.

@ProviderFor(emergencyFund)
final emergencyFundProvider = EmergencyFundProvider._();

/// Reflects the user's current state — deliberately does NOT watch the
/// analytics date filter. Invalidate manually after mutations if needed.

final class EmergencyFundProvider
    extends
        $FunctionalProvider<
          AsyncValue<EmergencyFund>,
          EmergencyFund,
          FutureOr<EmergencyFund>
        >
    with $FutureModifier<EmergencyFund>, $FutureProvider<EmergencyFund> {
  /// Reflects the user's current state — deliberately does NOT watch the
  /// analytics date filter. Invalidate manually after mutations if needed.
  EmergencyFundProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'emergencyFundProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$emergencyFundHash();

  @$internal
  @override
  $FutureProviderElement<EmergencyFund> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EmergencyFund> create(Ref ref) {
    return emergencyFund(ref);
  }
}

String _$emergencyFundHash() => r'5bb645d7ea5c7bc523990629380b84eea758e185';

@ProviderFor(essentialExpenses)
final essentialExpensesProvider = EssentialExpensesProvider._();

final class EssentialExpensesProvider
    extends
        $FunctionalProvider<
          AsyncValue<EssentialExpenses>,
          EssentialExpenses,
          FutureOr<EssentialExpenses>
        >
    with
        $FutureModifier<EssentialExpenses>,
        $FutureProvider<EssentialExpenses> {
  EssentialExpensesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'essentialExpensesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$essentialExpensesHash();

  @$internal
  @override
  $FutureProviderElement<EssentialExpenses> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<EssentialExpenses> create(Ref ref) {
    return essentialExpenses(ref);
  }
}

String _$essentialExpensesHash() => r'276003a3bfb615c69a8eb58486e639c8df270ee4';

@ProviderFor(income)
final incomeProvider = IncomeProvider._();

final class IncomeProvider
    extends
        $FunctionalProvider<
          AsyncValue<IncomeReport>,
          IncomeReport,
          FutureOr<IncomeReport>
        >
    with $FutureModifier<IncomeReport>, $FutureProvider<IncomeReport> {
  IncomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomeHash();

  @$internal
  @override
  $FutureProviderElement<IncomeReport> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IncomeReport> create(Ref ref) {
    return income(ref);
  }
}

String _$incomeHash() => r'f00ac2e916fbba408e0633bb5dd5a7d8eee976a3';
