import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../features/dashboard/data/models/wealth_history_point.dart';

/// Compact line + gradient chart for the Beranda net worth card.
class NetWorthTrendChart extends StatelessWidget {
  const NetWorthTrendChart({
    super.key,
    required this.history,
    this.height = 120,
  });

  final WealthHistory history;
  final double height;

  @override
  Widget build(BuildContext context) {
    final points = history.history;
    if (points.isEmpty) {
      return SizedBox(
        height: height,
        child: Center(
          child: Text(
            'Belum ada data tren',
            style: AppTextStyles.bodySmall(AppColors.textMuted),
          ),
        ),
      );
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lineColor =
        isDark ? AppColors.accentBlueDark : AppColors.accentBlue;
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
    final values = points.map((point) => point.kekayaanBersih.toDouble());
    final minY = values.reduce((a, b) => a < b ? a : b);
    final maxY = values.reduce((a, b) => a > b ? a : b);
    final yPadding = ((maxY - minY) * 0.15).clamp(1000, double.infinity);

    return SizedBox(
      height: height,
      child: LineChart(
        LineChartData(
          minY: minY - yPadding,
          maxY: maxY + yPadding,
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: lineColor,
              barWidth: 2.5,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    lineColor.withValues(alpha: 0.22),
                    lineColor.withValues(alpha: 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
