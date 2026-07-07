import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/receivable.dart';
import '../providers/receivables_list_provider.dart';

class ReceivablesListPage extends ConsumerWidget {
  const ReceivablesListPage({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Receivable receivable,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus piutang?'),
        content: Text(
          'Piutang dari "${receivable.peminjam}" akan dihapus permanen. '
          'Tindakan ini tidak bisa dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) {
      return;
    }

    try {
      await ref.read(receivablesListProvider.notifier).deleteReceivable(
            receivable.id,
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Piutang "${receivable.peminjam}" berhasil dihapus',
            ),
          ),
        );
      }
    } on ApiException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    }
  }

  void _showDetailSheet(BuildContext context, Receivable receivable) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => _ReceivableDetailSheet(receivable: receivable),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receivablesAsync = ref.watch(receivablesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Piutang')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/receivables/new'),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(receivablesListProvider);
          await ref.read(receivablesListProvider.future);
        },
        child: AsyncValueWidget<List<Receivable>>(
          value: receivablesAsync,
          onRetry: () => ref.invalidate(receivablesListProvider),
          data: (receivables) {
            if (receivables.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  EmptyStateWidget(
                    title: 'Belum ada piutang aktif',
                    message:
                        'Piutang yang masih outstanding akan muncul di sini.',
                    icon: Icons.savings_outlined,
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: receivables.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final receivable = receivables[index];
                return _ReceivableCard(
                  receivable: receivable,
                  onTap: () => _showDetailSheet(context, receivable),
                  onEdit: () => context.push(
                    '/receivables/${receivable.id}/edit',
                    extra: receivable,
                  ),
                  onDelete: () => _confirmDelete(context, ref, receivable),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _ReceivableCard extends StatelessWidget {
  const _ReceivableCard({
    required this.receivable,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final Receivable receivable;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final progress = receivable.collectionProgress;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      receivable.peminjam,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Edit',
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  IconButton(
                    tooltip: 'Hapus',
                    onPressed: onDelete,
                    icon: const Icon(Icons.delete_outline),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Sisa: ${formatRupiah(receivable.sisaSaldo)} dari ${formatRupiah(receivable.saldoAwal)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: colorScheme.primaryContainer,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Tertagih ${(progress * 100).toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReceivableDetailSheet extends StatelessWidget {
  const _ReceivableDetailSheet({required this.receivable});

  final Receivable receivable;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              receivable.peminjam,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Sisa piutang: ${formatRupiah(receivable.sisaSaldo)}'),
            Text('Saldo awal: ${formatRupiah(receivable.saldoAwal)}'),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                context.push(
                  '/transactions/new?type=penerimaan_piutang&relatedReceivableId=${receivable.id}',
                );
              },
              icon: const Icon(Icons.payments_outlined),
              label: const Text('Catat Penerimaan'),
            ),
          ],
        ),
      ),
    );
  }
}
