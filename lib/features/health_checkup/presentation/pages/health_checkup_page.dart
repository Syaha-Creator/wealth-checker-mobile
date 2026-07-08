import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/models/wealth_level_colors.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/level_ring_progress.dart';
import '../../data/models/health_checkup.dart';
import '../providers/health_checkup_provider.dart';

class HealthCheckupPage extends ConsumerWidget {
  const HealthCheckupPage({super.key});

  static const _maxLevel = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkupAsync = ref.watch(healthCheckupProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: context.semanticColors.background,
      appBar: AppBar(
        title: const Text('Cek Kesehatan Finansial'),
        backgroundColor: context.semanticColors.background,
      ),
      body: AsyncValueWidget<HealthCheckup>(
        value: checkupAsync,
        onRetry: () => ref.invalidate(healthCheckupProvider),
        data: (checkup) {
          final levelProgress = checkup.wealthLevel < 0
              ? 0.0
              : ((checkup.wealthLevel + 1) / (_maxLevel + 1)).clamp(0.0, 1.0);

          return ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              AppCard.subtle(
                padding: const EdgeInsets.all(AppSpacing.xl),
                child: Column(
                  children: [
                    LevelRingProgress(
                      level: checkup.wealthLevel < 0 ? 0 : checkup.wealthLevel,
                      progress: levelProgress,
                      size: 88,
                      strokeWidth: 7,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      checkup.wealthLevelName.isNotEmpty
                          ? 'Level ${checkup.wealthLevel} · ${checkup.wealthLevelName}'
                          : 'Level ${checkup.wealthLevel}',
                      style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              if (!checkup.hasContent) ...[
                AppCard.subtle(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Text(
                    'Lengkapi data keuangan Anda terlebih dahulu untuk mendapatkan '
                    'diagnosa dan saran kesehatan finansial.',
                    style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                ),
              ] else ...[
                _SectionCard(
                  title: 'Diagnosa',
                  child: Text(
                    checkup.diagnosa,
                    style: AppTextStyles.bodyMedium(context.semanticColors.textPrimary),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _SectionCard(
                  title: 'Ciri-ciri',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: checkup.ciri
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  size: 18,
                                  color: context.semanticColors.brand,
                                ),
                                const SizedBox(width: AppSpacing.sm),
                                Expanded(
                                  child: Text(
                                    item,
                                    style: AppTextStyles.bodyMedium(
                                      context.semanticColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _SectionCard(
                  title: 'Saran',
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.semanticColors.accentBlueSoft,
                      borderRadius: AppRadius.circular,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Text(
                        checkup.saran,
                        style: AppTextStyles.bodyMedium(context.semanticColors.textPrimary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                _SectionCard(
                  title: 'Ringkasan Keuangan',
                  child: Column(
                    children: [
                      _SummaryRow(
                        label: 'Kekayaan bersih',
                        value: formatRupiah(checkup.kekayaanBersih),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _SummaryRow(
                        label: 'Total aset',
                        value: formatRupiah(checkup.totalAset),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _SummaryRow(
                        label: 'Total utang',
                        value: formatRupiah(checkup.totalUtang),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Perjalanan Level',
                  style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                ),
                const SizedBox(height: AppSpacing.sm),
                ...List.generate(_maxLevel + 1, (level) {
                  final passed = checkup.wealthLevel >= level;
                  final isCurrent = checkup.wealthLevel == level;
                  final color = colorForWealthLevel(level, isDark: isDark);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: AppCard.subtle(
                      color: isCurrent ? context.semanticColors.accentBlueSoft : null,
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      child: Row(
                        children: [
                          Icon(
                            passed ? Icons.check_circle : Icons.radio_button_unchecked,
                            color: passed ? context.semanticColors.brand : context.semanticColors.textMuted,
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: Text(
                              isCurrent && checkup.wealthLevelName.isNotEmpty
                                  ? 'Level $level · ${checkup.wealthLevelName}'
                                  : 'Level $level',
                              style: AppTextStyles.bodyLarge(
                                passed
                                    ? context.semanticColors.textPrimary
                                    : context.semanticColors.textMuted,
                              ),
                            ),
                          ),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
        Text(label, style: AppTextStyles.bodyMedium(context.semanticColors.textSecondary)),
        Text(value, style: AppTextStyles.money(context.semanticColors.textPrimary)),
      ],
    );
  }
}
