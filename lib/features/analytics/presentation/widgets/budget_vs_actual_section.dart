import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/budget_vs_actual.dart';

const _categoryColors = [
  AppColors.accentBlue,
  AppColors.brandPrimary,
  AppColors.investPurple,
  AppColors.amberAccent,
  AppColors.infoPrimary,
];

Color categoryColorForIndex(int index) =>
    _categoryColors[index % _categoryColors.length];

class BudgetVsActualSection extends StatelessWidget {
  const BudgetVsActualSection({super.key, required this.data});

  final BudgetVsActual data;

  @override
  Widget build(BuildContext context) {
    if (data.hasNoFinancialData) {
      return Text(
        'Lengkapi data keuangan Anda terlebih dahulu untuk melihat '
        'perbandingan rencana dan realisasi anggaran.',
        style: AppTextStyles.bodyMedium(AppColors.textSecondary),
      );
    }

    if (!data.hasPlan) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Belum ada rencana budget untuk bulan ini.',
            style: AppTextStyles.bodyMedium(AppColors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.md),
          OutlinedButton.icon(
            onPressed: () => context.push('/budgeting'),
            icon: const Icon(Icons.pie_chart_outline),
            label: const Text('Buka Saran Budgeting'),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (data.pendapatan != null) ...[
          _PendapatanRow(pendapatan: data.pendapatan!),
          const SizedBox(height: AppSpacing.lg),
        ],
        ...data.alokasi.asMap().entries.map(
          (entry) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: _AllocationRow(
              item: entry.value,
              color: categoryColorForIndex(entry.key),
            ),
          ),
        ),
      ],
    );
  }
}

class BudgetInsightBanner extends StatelessWidget {
  const BudgetInsightBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.accentBlueSoft,
        borderRadius: AppRadius.circular,
        boxShadow: AppShadows.shadowSm,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: AppRadius.circular,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Icon(
                  Icons.info_outline,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.bodyMedium(AppColors.textPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PendapatanRow extends StatelessWidget {
  const _PendapatanRow({required this.pendapatan});

  final BudgetVsActualPendapatan pendapatan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pendapatan',
          style: AppTextStyles.headingSmall(AppColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${formatRupiah(pendapatan.aktualNominal)} / '
          '${formatRupiah(pendapatan.rencanaNominal)}',
          style: AppTextStyles.bodyMedium(AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _AllocationRow extends StatelessWidget {
  const _AllocationRow({
    required this.item,
    required this.color,
  });

  final BudgetVsActualItem item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final barColor = item.overBudget ? AppColors.dangerPrimary : color;
    final progress = item.rencanaNominal <= 0
        ? 0.0
        : (item.aktualNominal / item.rencanaNominal).clamp(0.0, 1.0);
    final persenLabel = item.selisihPersen == null
        ? '(-)'
        : '${item.selisihPersen!.toStringAsFixed(1)}%';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.kategori,
                style: AppTextStyles.headingSmall(AppColors.textPrimary),
              ),
            ),
            if (item.overBudget)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.dangerNewSoft,
                  borderRadius: AppRadius.circular,
                ),
                child: Text(
                  'Over budget',
                  style: AppTextStyles.labelMedium(AppColors.dangerPrimary),
                ),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${formatRupiah(item.aktualNominal)} / '
          '${formatRupiah(item.rencanaNominal)}',
          style: AppTextStyles.bodyMedium(AppColors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.sm),
        ClipRRect(
          borderRadius: AppRadius.circular,
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            color: barColor,
            backgroundColor: AppColors.backgroundSubtle,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Selisih ${formatRupiah(item.selisih)} ($persenLabel)',
          style: AppTextStyles.bodySmall(
            item.overBudget ? AppColors.dangerPrimary : AppColors.textMuted,
          ).copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

String? budgetInsightMessage(BudgetVsActual data) {
  final overItems =
      data.alokasi.where((item) => item.overBudget).toList(growable: false);
  if (overItems.isEmpty) {
    return null;
  }

  overItems.sort((a, b) {
    final aPercent = a.selisihPersen ?? 0;
    final bPercent = b.selisihPersen ?? 0;
    return bPercent.compareTo(aPercent);
  });

  final worst = overItems.first;
  final percent = worst.selisihPersen?.toStringAsFixed(1) ?? '0';
  return 'Pengeluaran ${worst.kategori} kamu $percent% di atas anggaran bulan ini';
}
