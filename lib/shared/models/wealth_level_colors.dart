import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

/// Returns the display color for a wealth level (0–6).
Color colorForWealthLevel(int level, {required bool isDark}) {
  if (level <= 1) {
    return isDark ? AppColors.dangerDark : AppColors.danger;
  }
  if (level <= 3) {
    return isDark ? AppColors.warningDark : AppColors.warning;
  }
  if (level == 4) {
    return AppColors.info;
  }
  return isDark ? AppColors.brandDark : AppColors.brand;
}
