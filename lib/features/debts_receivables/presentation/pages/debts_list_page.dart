import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/debt.dart';
import '../providers/debts_list_provider.dart';

class DebtsListPage extends ConsumerWidget {
  const DebtsListPage({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    Debt debt,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus utang?'),
        content: Text(
          'Utang ke "${debt.pemberiUtang}" akan dihapus permanen. '
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
      await ref.read(debtsListProvider.notifier).deleteDebt(debt.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Utang "${debt.pemberiUtang}" berhasil dihapus'),
          ),
        );
      }
    } on ApiException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Terjadi kesalahan. Silakan coba lagi.'),
          ),
        );
      }
    }
  }

  void _showDetailSheet(BuildContext context, Debt debt) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) => _DebtDetailSheet(debt: debt),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debtsAsync = ref.watch(debtsListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Utang')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/debts/new'),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(debtsListProvider);
          await ref.read(debtsListProvider.future);
        },
        child: AsyncValueWidget<List<Debt>>(
          value: debtsAsync,
          onRetry: () => ref.invalidate(debtsListProvider),
          data: (debts) {
            if (debts.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 80),
                  EmptyStateWidget(
                    title: 'Belum ada utang aktif',
                    message:
                        'Utang biasa yang masih berjalan akan muncul di sini. '
                        'Kartu kredit tidak ditampilkan di halaman ini.',
                    icon: Icons.money_off_outlined,
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: debts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final debt = debts[index];
                return _DebtCard(
                  debt: debt,
                  onTap: () => _showDetailSheet(context, debt),
                  onEdit: () => context.push(
                    '/debts/${debt.id}/edit',
                    extra: debt,
                  ),
                  onDelete: () => _confirmDelete(context, ref, debt),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _DebtCard extends StatelessWidget {
  const _DebtCard({
    required this.debt,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  final Debt debt;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final progress = debt.repaymentProgress;
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
                      debt.pemberiUtang,
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
                'Sisa: ${formatRupiah(debt.sisaSaldo)} dari ${formatRupiah(debt.saldoAwal)}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 8,
                  backgroundColor: colorScheme.errorContainer,
                  color: colorScheme.error,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Terlunasi ${(progress * 100).toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DebtDetailSheet extends StatelessWidget {
  const _DebtDetailSheet({required this.debt});

  final Debt debt;

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
              debt.pemberiUtang,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text('Sisa utang: ${formatRupiah(debt.sisaSaldo)}'),
            Text('Saldo awal: ${formatRupiah(debt.saldoAwal)}'),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).pop();
                context.push(
                  '/transactions/new?type=bayar_utang&relatedDebtId=${debt.id}',
                );
              },
              icon: const Icon(Icons.payments_outlined),
              label: const Text('Catat Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
