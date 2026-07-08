import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
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

  Future<void> declareAsset({
    required String namaAset,
    required double jumlah,
    required double hargaBeliRataRata,
  }) async {
    final container = ref.container;
    await ref.read(assetsRepositoryProvider).createLiquidAsset(
          namaAset: namaAset,
          jumlah: jumlah,
          hargaBeliRataRata: hargaBeliRataRata,
        );
    container.invalidate(liquidAssetHoldingsProvider);
    container.invalidate(allLiquidAssetHoldingsProvider);
    container.invalidate(wealthSummaryProvider);
    container.invalidate(emergencyFundProvider);
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
@riverpod
Future<List<LiquidAssetHolding>> allLiquidAssetHoldings(Ref ref) async {
  return ref.read(assetsRepositoryProvider).getLiquidAssetHoldings(all: true);
}
