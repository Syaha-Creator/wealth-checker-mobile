import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/transaction.dart';

Future<void> showTransactionQuickAddSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (context) => const TransactionQuickAddSheet(),
  );
}

class TransactionQuickAddSheet extends StatelessWidget {
  const TransactionQuickAddSheet({super.key});

  void _openForm(BuildContext context, TransactionType type) {
    Navigator.of(context).pop();
    context.push('/transactions/new?type=${type.name}');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Catat Transaksi',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _QuickAddButton(
              icon: Icons.arrow_upward_rounded,
              label: 'Pendapatan',
              subtitle: 'Gaji, bonus, dan pemasukan lain',
              color: colorScheme.primary,
              onTap: () => _openForm(context, TransactionType.pendapatan),
            ),
            const SizedBox(height: 12),
            _QuickAddButton(
              icon: Icons.arrow_downward_rounded,
              label: 'Pengeluaran',
              subtitle: 'Belanja, tagihan, dan pengeluaran lain',
              color: colorScheme.error,
              onTap: () => _openForm(context, TransactionType.pengeluaran),
            ),
            const SizedBox(height: 12),
            _QuickAddButton(
              icon: Icons.swap_horiz_rounded,
              label: 'Transfer',
              subtitle: 'Pindah dana antar rekening',
              color: colorScheme.tertiary,
              onTap: () => _openForm(context, TransactionType.transfer),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  const _QuickAddButton({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.08),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withValues(alpha: 0.16),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
