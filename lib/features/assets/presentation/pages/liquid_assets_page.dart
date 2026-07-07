import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/liquid_asset_holding.dart';
import '../providers/liquid_asset_holdings_provider.dart';

class LiquidAssetsPage extends ConsumerWidget {
  const LiquidAssetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holdingsAsync = ref.watch(liquidAssetHoldingsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Investasi')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(
          '/transactions/new?type=beli_investasi',
        ),
        icon: const Icon(Icons.add),
        label: const Text('Beli'),
      ),
      body: AsyncValueWidget<List<LiquidAssetHolding>>(
        value: holdingsAsync,
        onRetry: () => ref.invalidate(liquidAssetHoldingsProvider),
        data: (holdings) {
          if (holdings.isEmpty) {
            return EmptyStateWidget(
              icon: Icons.trending_up_outlined,
              title: 'Belum ada investasi',
              message:
                  'Catat pembelian investasi pertama Anda untuk mulai melacak portofolio.',
              action: ElevatedButton(
                onPressed: () => context.push(
                  '/transactions/new?type=beli_investasi',
                ),
                child: const Text('Beli Investasi'),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: holdings.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final holding = holdings[index];
              return _HoldingCard(
                holding: holding,
                onTap: () => context.push(
                  '/transactions/new?type=jual_investasi&namaAset=${Uri.encodeComponent(holding.namaAset)}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _HoldingCard extends StatelessWidget {
  const _HoldingCard({
    required this.holding,
    required this.onTap,
  });

  final LiquidAssetHolding holding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      holding.namaAset,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Icon(
                    Icons.sell_outlined,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Jumlah: ${_formatJumlah(holding.jumlah)}',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                'HPP rata-rata: ${formatRupiah(holding.hargaBeliRataRata.round())}',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Total nilai: ${formatRupiah(holding.totalNilai.round())}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatJumlah(double jumlah) {
    if (jumlah == jumlah.roundToDouble()) {
      return jumlah.round().toString();
    }
    return jumlah.toString();
  }
}
