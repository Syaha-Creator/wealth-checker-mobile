// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgeting_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(budgetingRepository)
final budgetingRepositoryProvider = BudgetingRepositoryProvider._();

final class BudgetingRepositoryProvider
    extends
        $FunctionalProvider<
          BudgetingRepository,
          BudgetingRepository,
          BudgetingRepository
        >
    with $Provider<BudgetingRepository> {
  BudgetingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetingRepositoryHash();

  @$internal
  @override
  $ProviderElement<BudgetingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BudgetingRepository create(Ref ref) {
    return budgetingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BudgetingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BudgetingRepository>(value),
    );
  }
}

String _$budgetingRepositoryHash() =>
    r'15ab1ef4fa36103ac4d109ac97d1d8d0a215919e';
