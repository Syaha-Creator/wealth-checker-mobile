import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/wealth_level_badge.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../data/models/health_checkup.dart';
import '../providers/health_checkup_provider.dart';

class HealthCheckupPage extends ConsumerWidget {
  const HealthCheckupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkupAsync = ref.watch(healthCheckupProvider);
    final summaryAsync = ref.watch(wealthSummaryProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cek Kesehatan Finansial')),
      body: AsyncValueWidget<HealthCheckup>(
        value: checkupAsync,
        onRetry: () => ref.invalidate(healthCheckupProvider),
        data: (checkup) {
          final summaryLevel = summaryAsync.maybeWhen(
            data: (summary) => summary.wealthLevel,
            orElse: () => checkup.wealthLevel,
          );

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: WealthLevelBadge(
                  wealthLevel: summaryLevel,
                  wealthLevelName: checkup.wealthLevelName,
                  large: true,
                ),
              ),
              const SizedBox(height: 24),
              if (!checkup.hasContent) ...[
                Text(
                  'Lengkapi data keuangan Anda terlebih dahulu untuk mendapatkan '
                  'diagnosa dan saran kesehatan finansial.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                _SectionCard(
                  title: 'Diagnosa',
                  child: Text(
                    checkup.diagnosa,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: 'Ciri-ciri',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: checkup.ciri
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('• '),
                                Expanded(
                                  child: Text(
                                    item,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: 'Saran',
                  child: Text(
                    checkup.saran,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                _SectionCard(
                  title: 'Ringkasan Keuangan',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SummaryRow(
                        label: 'Kekayaan bersih',
                        value: formatRupiah(checkup.kekayaanBersih),
                      ),
                      const SizedBox(height: 8),
                      _SummaryRow(
                        label: 'Total aset',
                        value: formatRupiah(checkup.totalAset),
                      ),
                      const SizedBox(height: 8),
                      _SummaryRow(
                        label: 'Total utang',
                        value: formatRupiah(checkup.totalUtang),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
