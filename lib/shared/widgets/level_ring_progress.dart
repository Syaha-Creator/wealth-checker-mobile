import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

class LevelRingProgress extends StatelessWidget {
  const LevelRingProgress({
    super.key,
    required this.level,
    required this.progress,
    this.size = 56,
    this.strokeWidth = 5,
  });

  final int level;
  final double progress;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ringColor =
        isDark ? AppColors.accentBlueDark : AppColors.accentBlue;
    final trackColor = isDark
        ? AppColors.borderDark
        : AppColors.borderDefault.withValues(alpha: 0.5);

    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _RingPainter(
          progress: progress.clamp(0, 1),
          ringColor: ringColor,
          trackColor: trackColor,
          strokeWidth: strokeWidth,
        ),
        child: Center(
          child: Text(
            level < 0 ? '–' : '$level',
            style: AppTextStyles.headingSmall(
              Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter({
    required this.progress,
    required this.ringColor,
    required this.trackColor,
    required this.strokeWidth,
  });

  final double progress;
  final Color ringColor;
  final Color trackColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final progressPaint = Paint()
      ..color = ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5707963267948966,
      6.283185307179586 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.ringColor != ringColor ||
        oldDelegate.trackColor != trackColor;
  }
}

/// Estimates ring fill from wealth level (0–6). No dedicated API field yet.
double levelRingProgress(int wealthLevel) {
  if (wealthLevel < 0) {
    return 0;
  }
  if (wealthLevel >= 6) {
    return 1;
  }
  return (wealthLevel + 1) / 7;
}

int levelProgressPercent(int wealthLevel) {
  return (levelRingProgress(wealthLevel) * 100).round();
}
