import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/dream_goal.dart';
import '../providers/dream_goals_list_provider.dart';

class DreamGoalsPage extends ConsumerWidget {
  const DreamGoalsPage({super.key});

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    DreamGoal goal,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus impian?'),
        content: Text(
          'Goal "${goal.namaGoal}" akan dihapus permanen.',
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
      await ref.read(dreamGoalsListProvider.notifier).deleteGoal(goal.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Goal "${goal.namaGoal}" berhasil dihapus')),
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(dreamGoalsListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Target Impian')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/dream-goals/new'),
        icon: const Icon(Icons.add),
        label: const Text('Tambah'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dreamGoalsListProvider);
          await ref.read(dreamGoalsListProvider.future);
        },
        child: AsyncValueWidget<List<DreamGoal>>(
          value: goalsAsync,
          onRetry: () => ref.invalidate(dreamGoalsListProvider),
          data: (goals) {
            if (goals.isEmpty) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 80),
                  EmptyStateWidget(
                    icon: Icons.flag_outlined,
                    title: 'Belum ada impian',
                    message:
                        'Buat goal tabungan pertama Anda dan lacak progresnya '
                        'secara otomatis dari rekening atau saldo manual.',
                    action: ElevatedButton(
                      onPressed: () => context.push('/dream-goals/new'),
                      child: const Text('Tambah Goal'),
                    ),
                  ),
                ],
              );
            }

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: goals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final goal = goals[index];
                return _DreamGoalCard(
                  goal: goal,
                  onEdit: () => context.push(
                    '/dream-goals/${goal.id}/edit',
                    extra: goal,
                  ),
                  onDelete: () => _confirmDelete(context, ref, goal),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _DreamGoalCard extends StatelessWidget {
  const _DreamGoalCard({
    required this.goal,
    required this.onEdit,
    required this.onDelete,
  });

  final DreamGoal goal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = (goal.persentase / 100).clamp(0.0, 1.0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    goal.namaGoal,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (goal.tercapai)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.green.withValues(alpha: 0.4),
                      ),
                    ),
                    child: Text(
                      'Tercapai',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'edit') {
                      onEdit();
                    } else if (value == 'delete') {
                      onDelete();
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'edit', child: Text('Edit')),
                    PopupMenuItem(value: 'delete', child: Text('Hapus')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${formatRupiah(goal.saldoSaatIni)} / ${formatRupiah(goal.targetNominal)}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${goal.persentase.toStringAsFixed(1)}% · '
              'Sisa ${formatRupiah(goal.sisaMenujuTarget)}',
              style: theme.textTheme.bodySmall,
            ),
            if (goal.isLinkedToAccount) ...[
              const SizedBox(height: 4),
              Text(
                'Terhubung ke rekening',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
