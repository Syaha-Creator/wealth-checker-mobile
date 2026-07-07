import 'package:flutter/material.dart';

import '../models/wealth_level_colors.dart';

class WealthLevelBadge extends StatelessWidget {
  const WealthLevelBadge({
    super.key,
    required this.wealthLevel,
    required this.wealthLevelName,
    this.large = false,
  });

  final int wealthLevel;
  final String wealthLevelName;
  final bool large;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final levelColor = colorForWealthLevel(wealthLevel, isDark: isDark);
    final label = wealthLevelName.isNotEmpty
        ? 'Level $wealthLevel: $wealthLevelName'
        : wealthLevel >= 0
            ? 'Level $wealthLevel'
            : 'Belum ada data';

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 16 : 12,
        vertical: large ? 10 : 6,
      ),
      decoration: BoxDecoration(
        color: levelColor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: levelColor.withValues(alpha: 0.4)),
      ),
      child: Text(
        label,
        style: (large
                ? Theme.of(context).textTheme.titleMedium
                : Theme.of(context).textTheme.labelLarge)
            ?.copyWith(
          color: levelColor,
          fontWeight: large ? FontWeight.w600 : null,
        ),
      ),
    );
  }
}
