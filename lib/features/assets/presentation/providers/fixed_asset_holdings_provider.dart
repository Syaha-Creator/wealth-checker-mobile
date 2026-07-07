import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/assets_repository.dart';
import '../../data/models/fixed_asset_holding.dart';

part 'fixed_asset_holdings_provider.g.dart';

@riverpod
class FixedAssetHoldings extends _$FixedAssetHoldings {
  @override
  Future<List<FixedAssetHolding>> build() async {
    final holdings =
        await ref.read(assetsRepositoryProvider).getFixedAssetHoldings();
    return holdings.where((holding) => holding.isActive).toList();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
@riverpod
Future<List<FixedAssetHolding>> allFixedAssetHoldings(Ref ref) async {
  return ref.read(assetsRepositoryProvider).getFixedAssetHoldings(all: true);
}
