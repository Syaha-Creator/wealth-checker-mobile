import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/dream_goal.dart';
import '../providers/dream_goals_list_provider.dart';

class _GoalTint {
  const _GoalTint({required this.soft, required this.accent});

  final Color soft;
  final Color accent;
}

List<_GoalTint> _goalTints(AppSemanticColors colors) => [
  _GoalTint(soft: colors.accentBlueSoft, accent: colors.accentBlue),
  _GoalTint(soft: colors.brandSoft, accent: colors.brand),
  _GoalTint(soft: colors.investPurpleSoft, accent: colors.investPurple),
  _GoalTint(soft: colors.amberAccentSoft, accent: colors.amberAccent),
];

_GoalTint _goalTintForIndex(AppSemanticColors colors, int index) =>
    _goalTints(colors)[index % _goalTints(colors).length];

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
      backgroundColor: context.semanticColors.background,
      appBar: AppBar(
        title: const Text('Target Impian'),
        backgroundColor: context.semanticColors.background,
      ),
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
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
                  const SizedBox(height: AppSpacing.xxl),
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

            final activeGoals =
                goals.where((goal) => !goal.tercapai).length;
            final totalCollected = goals.fold<int>(
              0,
              (sum, goal) => sum + goal.saldoSaatIni,
            );

            return ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.sm,
                AppSpacing.lg,
                AppSpacing.xxl * 2,
              ),
              itemCount: goals.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _DreamGoalsSummaryHeader(
                        activeCount: activeGoals,
                        totalCollected: totalCollected,
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      _DreamGoalCard(
                        goal: goals[index],
                        tint: _goalTintForIndex(context.semanticColors, index),
                        onEdit: () => context.push(
                          '/dream-goals/${goals[index].id}/edit',
                          extra: goals[index],
                        ),
                        onDelete: () =>
                            _confirmDelete(context, ref, goals[index]),
                      ),
                    ],
                  );
                }

                final goal = goals[index];
                return _DreamGoalCard(
                  goal: goal,
                  tint: _goalTintForIndex(context.semanticColors, index),
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

class _DreamGoalsSummaryHeader extends StatelessWidget {
  const _DreamGoalsSummaryHeader({
    required this.activeCount,
    required this.totalCollected,
  });

  final int activeCount;
  final int totalCollected;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$activeCount impian aktif · ${formatRupiah(totalCollected)} terkumpul',
      style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
    );
  }
}

class _DreamGoalCard extends StatelessWidget {
  const _DreamGoalCard({
    required this.goal,
    required this.tint,
    required this.onEdit,
    required this.onDelete,
  });

  final DreamGoal goal;
  final _GoalTint tint;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final progress = (goal.persentase / 100).clamp(0.0, 1.0);
    final percentLabel = '${goal.persentase.toStringAsFixed(0)}%';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: tint.soft,
        borderRadius: AppRadius.circular,
        boxShadow: AppShadows.shadowSm,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: AppRadius.circular,
                    boxShadow: AppShadows.shadowSm,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    child: Icon(
                      goal.tercapai ? Icons.emoji_events_outlined : Icons.flag_outlined,
                      color: tint.accent,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              goal.namaGoal,
                              style: AppTextStyles.headingSmall(
                                context.semanticColors.textPrimary,
                              ),
                            ),
                          ),
                          if (goal.tercapai)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.sm,
                                vertical: AppSpacing.xs,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white.withValues(alpha: 0.7),
                                borderRadius: AppRadius.circular,
                              ),
                              child: Text(
                                'Tercapai',
                                style: AppTextStyles.labelMedium(
                                  context.semanticColors.brand,
                                ),
                              ),
                            ),
                          PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.more_horiz,
                              color: context.semanticColors.textMuted,
                            ),
                            onSelected: (value) {
                              if (value == 'edit') {
                                onEdit();
                              } else if (value == 'delete') {
                                onDelete();
                              }
                            },
                            itemBuilder: (context) => const [
                              PopupMenuItem(value: 'edit', child: Text('Edit')),
                              PopupMenuItem(
                                value: 'delete',
                                child: Text('Hapus'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        '${formatRupiah(goal.saldoSaatIni)} dari '
                        '${formatRupiah(goal.targetNominal)}',
                        style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.75),
                    borderRadius: AppRadius.circular,
                  ),
                  child: Text(
                    percentLabel,
                    style: AppTextStyles.labelMedium(tint.accent).copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            ClipRRect(
              borderRadius: AppRadius.circular,
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                color: tint.accent,
                backgroundColor: AppColors.white.withValues(alpha: 0.6),
              ),
            ),
            if (goal.isLinkedToAccount) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Terhubung ke rekening',
                style: AppTextStyles.bodySmall(tint.accent),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
