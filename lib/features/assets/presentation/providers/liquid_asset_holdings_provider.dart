import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/assets_repository.dart';
import '../../data/models/liquid_asset_holding.dart';

part 'liquid_asset_holdings_provider.g.dart';

@riverpod
class LiquidAssetHoldings extends _$LiquidAssetHoldings {
  @override
  Future<List<LiquidAssetHolding>> build() async {
    final holdings =
        await ref.read(assetsRepositoryProvider).getLiquidAssetHoldings();
    return holdings.where((holding) => holding.isActive).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
@riverpod
Future<List<LiquidAssetHolding>> allLiquidAssetHoldings(Ref ref) async {
  return ref.read(assetsRepositoryProvider).getLiquidAssetHoldings(all: true);
}
