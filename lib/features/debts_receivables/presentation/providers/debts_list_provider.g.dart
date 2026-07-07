// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debts_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DebtsList)
final debtsListProvider = DebtsListProvider._();

final class DebtsListProvider
    extends $AsyncNotifierProvider<DebtsList, List<Debt>> {
  DebtsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debtsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debtsListHash();

  @$internal
  @override
  DebtsList create() => DebtsList();
}

String _$debtsListHash() => r'e65ad527e5a4ec1e394a1cc0533ae2389a2c69ea';

abstract class _$DebtsList extends $AsyncNotifier<List<Debt>> {
  FutureOr<List<Debt>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Debt>>, List<Debt>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Debt>>, List<Debt>>,
              AsyncValue<List<Debt>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// All active debts (including kartu kredit) for transaction linking.

@ProviderFor(allActiveDebts)
final allActiveDebtsProvider = AllActiveDebtsProvider._();

/// All active debts (including kartu kredit) for transaction linking.

final class AllActiveDebtsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Debt>>,
          List<Debt>,
          FutureOr<List<Debt>>
        >
    with $FutureModifier<List<Debt>>, $FutureProvider<List<Debt>> {
  /// All active debts (including kartu kredit) for transaction linking.
  AllActiveDebtsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allActiveDebtsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allActiveDebtsHash();

  @$internal
  @override
  $FutureProviderElement<List<Debt>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Debt>> create(Ref ref) {
    return allActiveDebts(ref);
  }
}

String _$allActiveDebtsHash() => r'6240253700aa78a9e781e9a3b44dcca424db5240';
