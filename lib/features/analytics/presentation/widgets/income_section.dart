import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../data/models/income_report.dart';

const _incomeChartColors = [
  AppColors.accentBlue,
  AppColors.brandPrimary,
  AppColors.investPurple,
  AppColors.amberAccent,
  AppColors.infoPrimary,
];

class IncomeSection extends StatelessWidget {
  const IncomeSection({super.key, required this.data});

  final IncomeReport data;

  @override
  Widget build(BuildContext context) {
    if (data.items.isEmpty) {
      return Text(
        'Tidak ada pemasukan dalam rentang tanggal ini.',
        style: AppTextStyles.bodyMedium(AppColors.textSecondary),
      );
    }

    final sections = data.items.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      return PieChartSectionData(
        value: item.total.toDouble(),
        color: _incomeChartColors[index % _incomeChartColors.length],
        radius: 42,
        title: '',
        showTitle: false,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 180,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 36,
                    sections: sections,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data.items.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final color =
                        _incomeChartColors[index % _incomeChartColors.length];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _IncomeLegendRow(
                        color: color,
                        label: item.kategori,
                        percent: item.persentaseDariTotal,
                        isTerbesar: item.isTerbesar,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Row(
          children: [
            Expanded(
              child: Text(
                'Total',
                style: AppTextStyles.headingSmall(AppColors.textPrimary),
              ),
            ),
            Text(
              formatRupiah(data.grandTotal),
              style: AppTextStyles.money(AppColors.textPrimary),
            ),
          ],
        ),
      ],
    );
  }
}

class _IncomeLegendRow extends StatelessWidget {
  const _IncomeLegendRow({
    required this.color,
    required this.label,
    required this.percent,
    required this.isTerbesar,
  });

  final Color color;
  final String label;
  final double percent;
  final bool isTerbesar;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.bodyMedium(AppColors.textPrimary).copyWith(
              fontWeight: isTerbesar ? FontWeight.w600 : FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          '${percent.toStringAsFixed(1)}%',
          style: AppTextStyles.labelMedium(AppColors.textSecondary),
        ),
      ],
    );
  }
}
