import 'package:flutter/material.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/emergency_fund.dart';

class EmergencyFundSection extends StatelessWidget {
  const EmergencyFundSection({super.key, required this.data});

  final EmergencyFund data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = data.isCukup ? Colors.green : theme.colorScheme.error;
    final bulanLabel = data.bulanTertanggung == null
        ? '-'
        : '${data.bulanTertanggung!.toStringAsFixed(1)} bulan';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatRupiah(data.danaDarurat),
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: statusColor.withValues(alpha: 0.4)),
          ),
          child: Text(
            data.isCukup ? 'Cukup' : 'Belum cukup',
            style: theme.textTheme.labelLarge?.copyWith(color: statusColor),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Menanggung: $bulanLabel',
          style: theme.textTheme.bodyMedium,
        ),
        if (data.bulanTertanggung == null) ...[
          const SizedBox(height: 4),
          Text(
            'Isi rencana pengeluaran bulanan di Profil untuk melihat '
            'estimasi bulan tertanggung.',
            style: theme.textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}
