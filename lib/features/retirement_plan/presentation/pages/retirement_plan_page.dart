import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/models/checklist_definitions.dart';
import '../../../../shared/widgets/persisted_checklist_section.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/retirement_plan.dart';
import '../providers/retirement_plan_provider.dart';

class RetirementPlanPage extends ConsumerWidget {
  const RetirementPlanPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planAsync = ref.watch(retirementPlanProvider);

    return Scaffold(
      backgroundColor: context.semanticColors.background,
      appBar: AppBar(
        title: const Text('Rencana Pensiun & Warisan'),
        backgroundColor: context.semanticColors.background,
      ),
      body: AsyncValueWidget<RetirementPlan>(
        value: planAsync,
        onRetry: () => ref.invalidate(retirementPlanProvider),
        data: (data) {
          if (!data.isComplete) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                EmptyStateWidget(
                  icon: Icons.person_outline,
                  title: 'Profil belum lengkap',
                  message: data.error ??
                      'Lengkapi data profil Anda untuk melihat rencana pensiun.',
                ),
              ],
            );
          }

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              _SummaryCard(plan: data),
              const SizedBox(height: AppSpacing.lg),
              _SectionCard(
                title: 'Target Dana',
                child: Column(
                  children: [
                    _InfoRow(
                      label: 'Menuju pensiun',
                      value: _formatYears(data.plan!.tahunMenujuPensiun),
                    ),
                    _InfoRow(
                      label: 'Menuju warisan',
                      value: _formatYears(data.plan!.tahunMenujuWarisan),
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      label: 'Dana sebelum pensiun',
                      value: formatRupiah(
                        data.plan!.danaDibutuhkanSebelumPensiun,
                      ),
                    ),
                    _InfoRow(
                      label: 'Dana selama pensiun',
                      value: formatRupiah(
                        data.plan!.danaDibutuhkanSelamaPensiun,
                      ),
                    ),
                    _InfoRow(
                      label: 'Total pensiun & warisan',
                      value: formatRupiah(data.plan!.totalDanaPensiunWarisan),
                      emphasized: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              const PersistedChecklistSection(
                title: 'Checklist Warisan',
                category: LegacyPlanningChecklist.category,
                definitions: LegacyPlanningChecklist.items,
                showProgress: true,
              ),
              const SizedBox(height: AppSpacing.lg),
              _SectionCard(
                title: 'Dana Terkumpul (Waterfall)',
                child: _WaterfallSection(
                  collected: data.collectedFunds!,
                  plan: data.plan!,
                ),
              ),
              const SizedBox(height: 16),
              _SectionCard(
                title: 'Pelunasan Utang',
                child: _DebtPayoffSection(payoff: data.debtPayoff!),
              ),
              const SizedBox(height: AppSpacing.lg),
              _SectionCard(
                title: 'Untung/Rugi Terealisasi',
                child: Column(
                  children: [
                    _InfoRow(
                      label: 'Jual barang',
                      value: formatRupiah(
                        data.realizedPL!.untungRugiJualBarang,
                      ),
                    ),
                    _InfoRow(
                      label: 'Investasi',
                      value: formatRupiah(
                        data.realizedPL!.untungRugiInvestasi,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static String _formatYears(int years) {
    if (years < 0) {
      return '$years tahun (sudah terlewat)';
    }
    if (years == 0) {
      return 'Tahun ini';
    }
    return '$years tahun lagi';
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.plan});

  final RetirementPlan plan;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
              'Sisa uang bulanan',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              formatRupiah(plan.sisaUangBulanan ?? 0),
              style: AppTextStyles.headingMedium(context.semanticColors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Dana terkumpul saat ini',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              formatRupiah(plan.danaTerkumpulSaatIni ?? 0),
              style: AppTextStyles.money(context.semanticColors.textPrimary),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              'Selisih menuju target',
              style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              formatRupiah(plan.selisihMenujuTarget ?? 0),
              style: AppTextStyles.money(context.semanticColors.brand),
            ),
          ],
        ),
    );
  }
}

class _WaterfallSection extends StatelessWidget {
  const _WaterfallSection({
    required this.collected,
    required this.plan,
  });

  final RetirementCollectedFunds collected;
  final RetirementPlanDetails plan;

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        'Dana darurat',
        collected.danaDaruratTerkumpul,
        plan.danaDibutuhkanSebelumPensiun,
      ),
      (
        'Dana pensiun',
        collected.danaPensiunTerkumpul,
        plan.danaDibutuhkanSelamaPensiun,
      ),
      (
        'Dana warisan',
        collected.danaWarisanTerkumpul,
        null,
      ),
    ];

    return Column(
      children: items.map((item) {
        final (label, amount, target) = item;
        final targetLabel =
            target != null ? ' / ${formatRupiah(target)}' : '';

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(label)),
                  Text('${formatRupiah(amount)}$targetLabel'),
                ],
              ),
              const SizedBox(height: 4),
              if (target != null && target > 0)
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: (amount / target).clamp(0.0, 1.0),
                    minHeight: 6,
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _DebtPayoffSection extends StatelessWidget {
  const _DebtPayoffSection({required this.payoff});

  final RetirementDebtPayoff payoff;

  static const _uncomputableMessage =
      'Tidak dapat dihitung — pengeluaran melebihi pemasukan';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              payoff.bisaLunasSekarang ? Icons.check_circle : Icons.info_outline,
              color: payoff.bisaLunasSekarang
                  ? Colors.green
                  : theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              payoff.bisaLunasSekarang
                  ? 'Utang bisa dilunasi sekarang'
                  : 'Utang belum bisa dilunasi sekarang',
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _InfoRow(
          label: 'Bulan lunas (kas + sisa gaji)',
          value: payoff.bulanLunasDenganKas == null
              ? _uncomputableMessage
              : '${payoff.bulanLunasDenganKas} bulan',
        ),
        _InfoRow(
          label: 'Bulan lunas (sisa gaji saja)',
          value: payoff.bulanLunasDenganSisaGaji == null
              ? _uncomputableMessage
              : '${payoff.bulanLunasDenganSisaGaji} bulan',
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.md),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.emphasized = false,
  });

  final String label;
  final String value;
  final bool emphasized;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: emphasized
                  ? theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    )
                  : theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
