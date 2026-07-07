import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/providers/analytics_date_filter_provider.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../data/models/budget_vs_actual.dart';
import '../../data/models/emergency_fund.dart';
import '../../data/models/essential_expenses.dart';
import '../../data/models/income_report.dart';
import '../../data/models/monthly_profit_loss.dart';
import '../../../dashboard/data/models/wealth_history_point.dart';
import '../providers/analytics_providers.dart';
import '../widgets/budget_vs_actual_section.dart';
import '../widgets/emergency_fund_section.dart';
import '../widgets/essential_expenses_section.dart';
import '../widgets/income_section.dart';

class AnalyticsPage extends ConsumerWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wealthHistoryAsync = ref.watch(wealthHistoryProvider);
    final monthlyPlAsync = ref.watch(monthlyPlProvider);
    final budgetVsActualAsync = ref.watch(budgetVsActualProvider);
    final emergencyFundAsync = ref.watch(emergencyFundProvider);
    final essentialExpensesAsync = ref.watch(essentialExpensesProvider);
    final incomeAsync = ref.watch(incomeProvider);

    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      appBar: AppBar(
        title: const Text('Analisa Keuangan'),
        backgroundColor: AppColors.bgPrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          const _AnalyticsDateFilterBar(),
          const SizedBox(height: AppSpacing.lg),
          _AnalyticsSectionCard(
            title: 'Kekayaan Bersih',
            child: AsyncValueWidget<WealthHistory>(
              value: wealthHistoryAsync,
              onRetry: () => ref.invalidate(wealthHistoryProvider),
              data: (history) => _WealthHistoryChart(history: history),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _AnalyticsSectionCard(
            title: 'Laba Rugi Bulanan',
            child: AsyncValueWidget<List<MonthlyProfitLoss>>(
              value: monthlyPlAsync,
              onRetry: () => ref.invalidate(monthlyPlProvider),
              data: (rows) => _MonthlyPlTable(rows: rows),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AsyncValueWidget<BudgetVsActual>(
            value: budgetVsActualAsync,
            onRetry: () => ref.invalidate(budgetVsActualProvider),
            data: (data) {
              final insight = budgetInsightMessage(data);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (insight != null) ...[
                    BudgetInsightBanner(message: insight),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                  _AnalyticsSectionCard(
                    title: 'Anggaran vs Aktual',
                    child: BudgetVsActualSection(data: data),
                  ),
                ],
              );
            },
            loading: const _AnalyticsSectionCard(
              title: 'Anggaran vs Aktual',
              child: Center(child: CircularProgressIndicator()),
            ),
            errorMessageBuilder: (_) => 'Gagal memuat anggaran vs aktual',
          ),
          const SizedBox(height: AppSpacing.lg),
          _AnalyticsSectionCard(
            title: 'Dana Darurat',
            child: AsyncValueWidget<EmergencyFund>(
              value: emergencyFundAsync,
              onRetry: () => ref.invalidate(emergencyFundProvider),
              data: (data) => EmergencyFundSection(data: data),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _AnalyticsSectionCard(
            title: 'Kebutuhan Pokok',
            child: AsyncValueWidget<EssentialExpenses>(
              value: essentialExpensesAsync,
              onRetry: () => ref.invalidate(essentialExpensesProvider),
              data: (data) => EssentialExpensesSection(data: data),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          _AnalyticsSectionCard(
            title: 'Sumber Pemasukan',
            child: AsyncValueWidget<IncomeReport>(
              value: incomeAsync,
              onRetry: () => ref.invalidate(incomeProvider),
              data: (data) => IncomeSection(data: data),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnalyticsDateFilterBar extends ConsumerWidget {
  const _AnalyticsDateFilterBar();

  static const _presets = [
    _Preset('Bulan ini', _PresetAction.bulanIni),
    _Preset('3 bulan', _PresetAction.terakhir3),
    _Preset('6 bulan', _PresetAction.terakhir6),
    _Preset('Tahun ini', _PresetAction.tahunIni),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final range = ref.watch(analyticsDateFilterProvider);
    final notifier = ref.read(analyticsDateFilterProvider.notifier);
    final dateFormat = DateFormat('dd MMM yyyy', 'id_ID');

    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Rentang Tanggal',
            style: AppTextStyles.headingSmall(AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${dateFormat.format(range.from)} – ${dateFormat.format(range.to)}',
            style: AppTextStyles.bodySmall(AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              ..._presets.map(
                (preset) => _FilterChipButton(
                  label: preset.label,
                  onPressed: () => _applyPreset(notifier, preset.action),
                ),
              ),
              _FilterChipButton(
                label: 'Kustom',
                icon: Icons.date_range_outlined,
                onPressed: () => _pickCustomRange(context, ref, range),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _applyPreset(AnalyticsDateFilter notifier, _PresetAction action) {
    switch (action) {
      case _PresetAction.bulanIni:
        notifier.setBulanIni();
      case _PresetAction.terakhir3:
        notifier.set3BulanTerakhir();
      case _PresetAction.terakhir6:
        notifier.set6BulanTerakhir();
      case _PresetAction.tahunIni:
        notifier.setTahunIni();
    }
  }

  Future<void> _pickCustomRange(
    BuildContext context,
    WidgetRef ref,
    AnalyticsDateRange current,
  ) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDateRange: DateTimeRange(start: current.from, end: current.to),
      locale: const Locale('id'),
    );
    if (picked == null) {
      return;
    }
    ref.read(analyticsDateFilterProvider.notifier).setCustomRange(
          picked.start,
          picked.end,
        );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgSurface,
      shadowColor: AppColors.brandPrimary.withValues(alpha: 0.08),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circular,
        side: BorderSide(color: AppColors.borderDefault.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: AppRadius.circular,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 16, color: AppColors.textSecondary),
                const SizedBox(width: AppSpacing.xs),
              ],
              Text(
                label,
                style: AppTextStyles.labelMedium(AppColors.textPrimary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Preset {
  const _Preset(this.label, this.action);

  final String label;
  final _PresetAction action;
}

enum _PresetAction { bulanIni, terakhir3, terakhir6, tahunIni }

class _AnalyticsSectionCard extends StatelessWidget {
  const _AnalyticsSectionCard({
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
            style: AppTextStyles.headingSmall(AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.lg),
          child,
        ],
      ),
    );
  }
}

class _WealthHistoryChart extends StatelessWidget {
  const _WealthHistoryChart({required this.history});

  final WealthHistory history;

  @override
  Widget build(BuildContext context) {
    if (history.history.isEmpty) {
      return const EmptyStateWidget(
        title: 'Belum ada data',
        message: 'Tidak ada snapshot kekayaan bersih dalam rentang tanggal ini.',
        icon: Icons.show_chart_outlined,
      );
    }

    final points = history.history;
    final spots = points
        .asMap()
        .entries
        .map(
          (entry) => FlSpot(
            entry.key.toDouble(),
            entry.value.kekayaanBersih.toDouble(),
          ),
        )
        .toList();
    final minY = points
        .map((point) => point.kekayaanBersih)
        .reduce((a, b) => a < b ? a : b)
        .toDouble();
    final maxY = points
        .map((point) => point.kekayaanBersih)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
    final yPadding = ((maxY - minY) * 0.1).clamp(1000, double.infinity);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (history.hasEnoughPoints)
          Text(
            'Perubahan: ${formatRupiah(history.delta)}',
            style: AppTextStyles.bodySmall(AppColors.textMuted),
          ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 220,
          child: LineChart(
            LineChartData(
              minY: minY - yPadding,
              maxY: maxY + yPadding,
              gridData: const FlGridData(show: true, drawVerticalLine: false),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 56,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        _compactRupiah(value.toInt()),
                        style: AppTextStyles.bodySmall(AppColors.textMuted),
                      );
                    },
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: (points.length / 4).clamp(1, 999).toDouble(),
                    getTitlesWidget: (value, meta) {
                      final index = value.round();
                      if (index < 0 || index >= points.length) {
                        return const SizedBox.shrink();
                      }
                      final tanggal = DateTime.tryParse(points[index].tanggal);
                      if (tanggal == null) {
                        return const SizedBox.shrink();
                      }
                      return Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.sm),
                        child: Text(
                          DateFormat('dd/MM').format(tanggal),
                          style: AppTextStyles.bodySmall(AppColors.textMuted),
                        ),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: AppColors.accentBlue,
                  barWidth: 3,
                  dotData: FlDotData(
                    show: points.length <= 12,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.accentBlueSoft.withValues(alpha: 0.8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _compactRupiah(int value) {
    final abs = value.abs();
    if (abs >= 1000000000) {
      return '${(value / 1000000000).toStringAsFixed(1)}M';
    }
    if (abs >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}jt';
    }
    if (abs >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}rb';
    }
    return value.toString();
  }
}

class _MonthlyPlTable extends StatelessWidget {
  const _MonthlyPlTable({required this.rows});

  final List<MonthlyProfitLoss> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const EmptyStateWidget(
        title: 'Belum ada data',
        message: 'Tidak ada transaksi dalam rentang tanggal ini.',
        icon: Icons.table_chart_outlined,
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('Bulan', style: AppTextStyles.labelMedium(AppColors.textPrimary)),
          ),
          DataColumn(
            label: Text('Pendapatan', style: AppTextStyles.labelMedium(AppColors.textPrimary)),
          ),
          DataColumn(
            label: Text('Pengeluaran', style: AppTextStyles.labelMedium(AppColors.textPrimary)),
          ),
          DataColumn(
            label: Text('Tabungan', style: AppTextStyles.labelMedium(AppColors.textPrimary)),
          ),
        ],
        rows: rows.map((row) {
          final tabunganColor = row.tabunganNegatif
              ? AppColors.dangerPrimary
              : AppColors.brandPrimary;
          return DataRow(
            cells: [
              DataCell(Text(_formatBulan(row.bulan))),
              DataCell(Text(formatRupiah(row.pendapatan))),
              DataCell(Text(formatRupiah(row.pengeluaran))),
              DataCell(
                Text(
                  formatRupiah(row.tabungan),
                  style: AppTextStyles.money(tabunganColor),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  String _formatBulan(String bulan) {
    final parsed = DateTime.tryParse('$bulan-01');
    if (parsed == null) {
      return bulan;
    }
    return DateFormat('MMM yyyy', 'id_ID').format(parsed);
  }
}
