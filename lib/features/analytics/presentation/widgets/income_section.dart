import 'package:flutter/material.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/income_report.dart';

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key, required this.data});

  final IncomeReport data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (data.items.isEmpty) {
      return Text(
        'Tidak ada pemasukan dalam rentang tanggal ini.',
        style: theme.textTheme.bodyMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...data.items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _IncomeRow(item: item),
          ),
        ),
        const Divider(height: 16),
        Row(
          children: [
            Expanded(
              child: Text(
                'Total',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              formatRupiah(data.grandTotal),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _IncomeRow extends StatelessWidget {
  const _IncomeRow({required this.item});

  final IncomeItem item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor =
        item.isTerbesar ? theme.colorScheme.primary : theme.colorScheme.tertiary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                item.kategori,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: item.isTerbesar ? FontWeight.w700 : null,
                ),
              ),
            ),
            if (item.isTerbesar)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Terbesar',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${formatRupiah(item.total)} · '
          '${item.persentaseDariTotal.toStringAsFixed(1)}%',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: (item.persentaseDariTotal / 100).clamp(0.0, 1.0),
            minHeight: 6,
            color: barColor,
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}
