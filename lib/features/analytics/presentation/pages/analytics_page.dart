import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
      appBar: AppBar(title: const Text('Analisa Keuangan')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const _AnalyticsDateFilterBar(),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Kekayaan Bersih',
            child: AsyncValueWidget<WealthHistory>(
              value: wealthHistoryAsync,
              onRetry: () => ref.invalidate(wealthHistoryProvider),
              data: (history) => _WealthHistoryChart(history: history),
            ),
          ),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Laba Rugi Bulanan',
            child: AsyncValueWidget<List<MonthlyProfitLoss>>(
              value: monthlyPlAsync,
              onRetry: () => ref.invalidate(monthlyPlProvider),
              data: (rows) => _MonthlyPlTable(rows: rows),
            ),
          ),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Budget vs Aktual',
            child: AsyncValueWidget<BudgetVsActual>(
              value: budgetVsActualAsync,
              onRetry: () => ref.invalidate(budgetVsActualProvider),
              data: (data) => BudgetVsActualSection(data: data),
            ),
          ),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Dana Darurat',
            child: AsyncValueWidget<EmergencyFund>(
              value: emergencyFundAsync,
              onRetry: () => ref.invalidate(emergencyFundProvider),
              data: (data) => EmergencyFundSection(data: data),
            ),
          ),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Kebutuhan Pokok',
            child: AsyncValueWidget<EssentialExpenses>(
              value: essentialExpensesAsync,
              onRetry: () => ref.invalidate(essentialExpensesProvider),
              data: (data) => EssentialExpensesSection(data: data),
            ),
          ),
          const SizedBox(height: 16),
          _AnalyticsSectionCard(
            title: 'Pemasukan',
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Rentang Tanggal',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${dateFormat.format(range.from)} – ${dateFormat.format(range.to)}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ..._presets.map(
                  (preset) => ActionChip(
                    label: Text(preset.label),
                    onPressed: () => _applyPreset(notifier, preset.action),
                  ),
                ),
                ActionChip(
                  avatar: const Icon(Icons.date_range, size: 18),
                  label: const Text('Kustom'),
                  onPressed: () => _pickCustomRange(context, ref, range),
                ),
              ],
            ),
          ],
        ),
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
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

    final theme = Theme.of(context);
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
            style: theme.textTheme.bodySmall,
          ),
        const SizedBox(height: 12),
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
                        style: theme.textTheme.labelSmall,
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
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          DateFormat('dd/MM').format(tanggal),
                          style: theme.textTheme.labelSmall,
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
                  color: theme.colorScheme.primary,
                  barWidth: 3,
                  dotData: FlDotData(
                    show: points.length <= 12,
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: theme.colorScheme.primary.withValues(alpha: 0.08),
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
        columns: const [
          DataColumn(label: Text('Bulan')),
          DataColumn(label: Text('Pendapatan')),
          DataColumn(label: Text('Pengeluaran')),
          DataColumn(label: Text('Tabungan')),
        ],
        rows: rows.map((row) {
          final tabunganColor = row.tabunganNegatif
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.primary;
          return DataRow(
            cells: [
              DataCell(Text(_formatBulan(row.bulan))),
              DataCell(Text(formatRupiah(row.pendapatan))),
              DataCell(Text(formatRupiah(row.pengeluaran))),
              DataCell(
                Text(
                  formatRupiah(row.tabungan),
                  style: TextStyle(
                    color: tabunganColor,
                    fontWeight: FontWeight.w600,
                  ),
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
