import 'package:flutter/material.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/essential_expenses.dart';

class EssentialExpensesSection extends StatelessWidget {
  const EssentialExpensesSection({super.key, required this.data});

  final EssentialExpenses data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (data.items.isEmpty) {
      return Text(
        'Tidak ada pengeluaran kebutuhan pokok dalam rentang tanggal ini.',
        style: theme.textTheme.bodyMedium,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ...data.items.map(
          (item) => ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(item.kategori, style: theme.textTheme.titleSmall),
            trailing: Text(
              formatRupiah(item.subtotal),
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            children: item.rincianList
                .map(
                  (rincian) => Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 8,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            rincian.rincian,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                        Text(
                          formatRupiah(rincian.total),
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const Divider(height: 24),
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
