import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
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

  Future<void> declareAsset({
    required String namaAset,
    required double jumlah,
    required double hargaBeliRataRata,
  }) async {
    final container = ref.container;
    await ref.read(assetsRepositoryProvider).createFixedAsset(
          namaAset: namaAset,
          jumlah: jumlah,
          hargaBeliRataRata: hargaBeliRataRata,
        );
    _invalidateAfterMutation(container);
  }

  Future<void> updateAsset({
    required String id,
    String? namaAset,
    double? jumlah,
    double? hargaBeliRataRata,
  }) async {
    final container = ref.container;
    await ref.read(assetsRepositoryProvider).updateFixedAsset(
          id: id,
          namaAset: namaAset,
          jumlah: jumlah,
          hargaBeliRataRata: hargaBeliRataRata,
        );
    _invalidateAfterMutation(container);
  }

  Future<void> deleteAsset(String id) async {
    final container = ref.container;
    await ref.read(assetsRepositoryProvider).deleteFixedAsset(id);
    _invalidateAfterMutation(container);
  }

  void _invalidateAfterMutation(ProviderContainer container) {
    container.invalidate(fixedAssetHoldingsProvider);
    container.invalidate(allFixedAssetHoldingsProvider);
    container.invalidate(wealthSummaryProvider);
    container.invalidate(emergencyFundProvider);
  }
}

/// Includes sold-off assets (`jumlah = 0`) for name autocomplete.
@riverpod
Future<List<FixedAssetHolding>> allFixedAssetHoldings(Ref ref) async {
  return ref.read(assetsRepositoryProvider).getFixedAssetHoldings(all: true);
}
