import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/budget_vs_actual.dart';

class BudgetVsActualSection extends StatelessWidget {
  const BudgetVsActualSection({super.key, required this.data});

  final BudgetVsActual data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (data.hasNoFinancialData) {
      return Text(
        'Lengkapi data keuangan Anda terlebih dahulu untuk melihat '
        'perbandingan rencana dan realisasi anggaran.',
        style: theme.textTheme.bodyMedium,
      );
    }

    if (!data.hasPlan) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Belum ada rencana budget untuk bulan ini.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
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
          const Divider(height: 24),
        ],
        ...data.alokasi.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _AllocationRow(item: item),
          ),
        ),
      ],
    );
  }
}

class _PendapatanRow extends StatelessWidget {
  const _PendapatanRow({required this.pendapatan});

  final BudgetVsActualPendapatan pendapatan;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pendapatan',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Rencana ${formatRupiah(pendapatan.rencanaNominal)} · '
          'Aktual ${formatRupiah(pendapatan.aktualNominal)}',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class _AllocationRow extends StatelessWidget {
  const _AllocationRow({required this.item});

  final BudgetVsActualItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selisihColor =
        item.overBudget ? theme.colorScheme.error : theme.colorScheme.primary;
    final persenLabel = item.selisihPersen == null
        ? '-'
        : '${item.selisihPersen!.toStringAsFixed(1)}%';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.kategori,
                style: theme.textTheme.titleSmall,
              ),
            ),
            if (item.overBudget)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Over budget',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Rencana ${formatRupiah(item.rencanaNominal)} · '
          'Aktual ${formatRupiah(item.aktualNominal)}',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 2),
        Text(
          'Selisih ${formatRupiah(item.selisih)} ($persenLabel)',
          style: theme.textTheme.bodySmall?.copyWith(
            color: selisihColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
