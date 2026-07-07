// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liquid_asset_holdings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LiquidAssetHoldings)
final liquidAssetHoldingsProvider = LiquidAssetHoldingsProvider._();

final class LiquidAssetHoldingsProvider
    extends
        $AsyncNotifierProvider<LiquidAssetHoldings, List<LiquidAssetHolding>> {
  LiquidAssetHoldingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liquidAssetHoldingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liquidAssetHoldingsHash();

  @$internal
  @override
  LiquidAssetHoldings create() => LiquidAssetHoldings();
}

String _$liquidAssetHoldingsHash() =>
    r'337ab879584489085a7272060c08942fda69af1b';

abstract class _$LiquidAssetHoldings
    extends $AsyncNotifier<List<LiquidAssetHolding>> {
  FutureOr<List<LiquidAssetHolding>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<LiquidAssetHolding>>,
              List<LiquidAssetHolding>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<LiquidAssetHolding>>,
                List<LiquidAssetHolding>
              >,
              AsyncValue<List<LiquidAssetHolding>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.

@ProviderFor(allLiquidAssetHoldings)
final allLiquidAssetHoldingsProvider = AllLiquidAssetHoldingsProvider._();

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.

final class AllLiquidAssetHoldingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LiquidAssetHolding>>,
          List<LiquidAssetHolding>,
          FutureOr<List<LiquidAssetHolding>>
        >
    with
        $FutureModifier<List<LiquidAssetHolding>>,
        $FutureProvider<List<LiquidAssetHolding>> {
  /// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
  AllLiquidAssetHoldingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'allLiquidAssetHoldingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$allLiquidAssetHoldingsHash();

  @$internal
  @override
  $FutureProviderElement<List<LiquidAssetHolding>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LiquidAssetHolding>> create(Ref ref) {
    return allLiquidAssetHoldings(ref);
  }
}

String _$allLiquidAssetHoldingsHash() =>
    r'7cbcf7ecbd922f963cc2a687376b25ebfc8950e1';
