// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_asset_holdings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FixedAssetHoldings)
final fixedAssetHoldingsProvider = FixedAssetHoldingsProvider._();

final class FixedAssetHoldingsProvider
    extends
        $AsyncNotifierProvider<FixedAssetHoldings, List<FixedAssetHolding>> {
  FixedAssetHoldingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fixedAssetHoldingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fixedAssetHoldingsHash();

  @$internal
  @override
  FixedAssetHoldings create() => FixedAssetHoldings();
}

String _$fixedAssetHoldingsHash() =>
    r'a1b6c02cfb9dc83cac541bad7d1881af69d5c3ac';

abstract class _$FixedAssetHoldings
    extends $AsyncNotifier<List<FixedAssetHolding>> {
  FutureOr<List<FixedAssetHolding>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<FixedAssetHolding>>,
              List<FixedAssetHolding>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<FixedAssetHolding>>,
                List<FixedAssetHolding>
              >,
              AsyncValue<List<FixedAssetHolding>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.

@ProviderFor(allFixedAssetHoldings)
final allFixedAssetHoldingsProvider = AllFixedAssetHoldingsProvider._();

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.

final class AllFixedAssetHoldingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FixedAssetHolding>>,
          List<FixedAssetHolding>,
          FutureOr<List<FixedAssetHolding>>
        >
    with
        $FutureModifier<List<FixedAssetHolding>>,
        $FutureProvider<List<FixedAssetHolding>> {
  /// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
  AllFixedAssetHoldingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allFixedAssetHoldingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allFixedAssetHoldingsHash();

  @$internal
  @override
  $FutureProviderElement<List<FixedAssetHolding>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FixedAssetHolding>> create(Ref ref) {
    return allFixedAssetHoldings(ref);
  }
}

String _$allFixedAssetHoldingsHash() =>
    r'3a248b7c05accc97e5797d4390bd8f9bdc428413';
