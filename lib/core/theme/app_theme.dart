import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Color palette aligned with the Next.js web app (`globals.css`).
abstract final class AppColors {
  // Light mode
  static const background = Color(0xFFF8FAFC);
  static const backgroundSubtle = Color(0xFFF1F5F9);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceHover = Color(0xFFF8FAFC);
  static const border = Color(0xFFE2E8F0);
  static const borderStrong = Color(0xFFCBD5E1);
  static const textPrimary = Color(0xFF0F172A);
  static const textSecondary = Color(0xFF475569);
  static const textMuted = Color(0xFF94A3B8);
  static const brand = Color(0xFF059669);
  static const brandHover = Color(0xFF047857);
  static const brandActive = Color(0xFF065F46);
  static const brandSoft = Color(0xFFECFDF5);
  static const danger = Color(0xFFEF4444);
  static const dangerHover = Color(0xFFDC2626);
  static const warning = Color(0xFFF59E0B);
  static const warningHover = Color(0xFFD97706);
  static const info = Color(0xFF3B82F6);
  static const infoSoft = Color(0xFFEFF6FF);
  static const accentPurple = Color(0xFF7C3AED);
  static const accentPurpleSoft = Color(0xFFF5F3FF);

  // Dark mode
  static const backgroundDark = Color(0xFF0B1120);
  static const backgroundSubtleDark = Color(0xFF0F172A);
  static const surfaceDark = Color(0xFF131C2E);
  static const surfaceHoverDark = Color(0xFF1A2436);
  static const borderDark = Color(0xFF253349);
  static const borderStrongDark = Color(0xFF334155);
  static const textPrimaryDark = Color(0xFFF1F5F9);
  static const textSecondaryDark = Color(0xFFB6C2D4);
  static const textMutedDark = Color(0xFF64748B);
  static const brandDark = Color(0xFF34D399);
  static const brandHoverDark = Color(0xFF6EE7B7);
  static const dangerDark = Color(0xFFF87171);
  static const warningDark = Color(0xFFFBBF24);
  static const accentPurpleDark = Color(0xFFA78BFA);
}

/// Reusable text styles for prominent numeric displays across the app.
abstract final class AppTextStyles {
  static const _tabularFigures = [FontFeature.tabularFigures()];

  static TextStyle heroNumber(Color color) {
    return GoogleFonts.plusJakartaSans(
      fontSize: 42,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      height: 1.1,
      color: color,
      fontFeatures: _tabularFigures,
    );
  }
}

abstract final class AppTheme {
  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.brand,
          onPrimary: Colors.white,
          primaryContainer: AppColors.brandSoft,
          onPrimaryContainer: AppColors.brandActive,
          secondary: AppColors.textSecondary,
          onSecondary: Colors.white,
          surface: AppColors.surface,
          onSurface: AppColors.textPrimary,
          error: AppColors.danger,
          onError: Colors.white,
          outline: AppColors.border,
        ),
        scaffoldBackground: AppColors.background,
        appBarBackground: AppColors.surface,
        appBarForeground: AppColors.textPrimary,
        cardColor: AppColors.surface,
        dividerColor: AppColors.border,
        textPrimary: AppColors.textPrimary,
        textSecondary: AppColors.textSecondary,
        textMuted: AppColors.textMuted,
        brand: AppColors.brand,
        brandHover: AppColors.brandHover,
        danger: AppColors.danger,
        dangerHover: AppColors.dangerHover,
        warning: AppColors.warning,
        info: AppColors.info,
        accentPurple: AppColors.accentPurple,
        infoSoft: AppColors.infoSoft,
        accentPurpleSoft: AppColors.accentPurpleSoft,
      );

  static ThemeData get dark => _buildTheme(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.brandDark,
          onPrimary: AppColors.backgroundDark,
          primaryContainer: AppColors.brandActive,
          onPrimaryContainer: AppColors.brandHoverDark,
          secondary: AppColors.textSecondaryDark,
          onSecondary: AppColors.backgroundDark,
          surface: AppColors.surfaceDark,
          onSurface: AppColors.textPrimaryDark,
          error: AppColors.dangerDark,
          onError: AppColors.backgroundDark,
          outline: AppColors.borderDark,
        ),
        scaffoldBackground: AppColors.backgroundDark,
        appBarBackground: AppColors.surfaceDark,
        appBarForeground: AppColors.textPrimaryDark,
        cardColor: AppColors.surfaceDark,
        dividerColor: AppColors.borderDark,
        textPrimary: AppColors.textPrimaryDark,
        textSecondary: AppColors.textSecondaryDark,
        textMuted: AppColors.textMutedDark,
        brand: AppColors.brandDark,
        brandHover: AppColors.brandHoverDark,
        danger: AppColors.dangerDark,
        dangerHover: AppColors.dangerDark,
        warning: AppColors.warningDark,
        info: AppColors.info,
        accentPurple: AppColors.accentPurpleDark,
        infoSoft: Color(0xFF1E3A8A),
        accentPurpleSoft: Color(0xFF4C1D95),
      );

  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required Color scaffoldBackground,
    required Color appBarBackground,
    required Color appBarForeground,
    required Color cardColor,
    required Color dividerColor,
    required Color textPrimary,
    required Color textSecondary,
    required Color textMuted,
    required Color brand,
    required Color brandHover,
    required Color danger,
    required Color dangerHover,
    required Color warning,
    required Color info,
    required Color accentPurple,
    required Color infoSoft,
    required Color accentPurpleSoft,
  }) {
    final baseTextTheme = ThemeData(
      useMaterial3: true,
      brightness: brightness,
    ).textTheme;

    final textTheme = GoogleFonts.plusJakartaSansTextTheme(baseTextTheme)
        .apply(
          bodyColor: textPrimary,
          displayColor: textPrimary,
        )
        .copyWith(
          bodyMedium: GoogleFonts.plusJakartaSans(color: textSecondary),
          bodySmall: GoogleFonts.plusJakartaSans(color: textMuted),
          labelLarge: GoogleFonts.plusJakartaSans(
            color: textPrimary,
            fontWeight: FontWeight.w600,
          ),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      dividerColor: dividerColor,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: appBarBackground,
        foregroundColor: appBarForeground,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: appBarForeground),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: dividerColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brand,
          foregroundColor: brightness == Brightness.light
              ? Colors.white
              : AppColors.backgroundDark,
          disabledBackgroundColor: textMuted.withValues(alpha: 0.3),
          disabledForegroundColor: textMuted,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ).copyWith(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return textMuted.withValues(alpha: 0.3);
            }
            if (states.contains(WidgetState.pressed)) {
              return brandHover;
            }
            return brand;
          }),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: BorderSide(color: dividerColor),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: brand,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        hintStyle: TextStyle(color: textMuted),
        labelStyle: TextStyle(color: textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: brand, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: dangerHover, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: brand,
        foregroundColor: brightness == Brightness.light
            ? Colors.white
            : AppColors.backgroundDark,
        elevation: 2,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textPrimary,
        contentTextStyle: TextStyle(
          color: brightness == Brightness.light
              ? AppColors.surface
              : AppColors.textPrimaryDark,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: brand),
      extensions: [
        AppSemanticColors(
          backgroundSubtle: brightness == Brightness.light
              ? AppColors.backgroundSubtle
              : AppColors.backgroundSubtleDark,
          surfaceHover: brightness == Brightness.light
              ? AppColors.surfaceHover
              : AppColors.surfaceHoverDark,
          borderStrong: brightness == Brightness.light
              ? AppColors.borderStrong
              : AppColors.borderStrongDark,
          textMuted: textMuted,
          brandSoft: AppColors.brandSoft,
          danger: danger,
          dangerHover: dangerHover,
          warning: warning,
          info: info,
          infoSoft: infoSoft,
          accentPurple: accentPurple,
          accentPurpleSoft: accentPurpleSoft,
        ),
      ],
    );
  }
}

@immutable
class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.backgroundSubtle,
    required this.surfaceHover,
    required this.borderStrong,
    required this.textMuted,
    required this.brandSoft,
    required this.danger,
    required this.dangerHover,
    required this.warning,
    required this.info,
    required this.infoSoft,
    required this.accentPurple,
    required this.accentPurpleSoft,
  });

  final Color backgroundSubtle;
  final Color surfaceHover;
  final Color borderStrong;
  final Color textMuted;
  final Color brandSoft;
  final Color danger;
  final Color dangerHover;
  final Color warning;
  final Color info;
  final Color infoSoft;
  final Color accentPurple;
  final Color accentPurpleSoft;

  @override
  AppSemanticColors copyWith({
    Color? backgroundSubtle,
    Color? surfaceHover,
    Color? borderStrong,
    Color? textMuted,
    Color? brandSoft,
    Color? danger,
    Color? dangerHover,
    Color? warning,
    Color? info,
    Color? infoSoft,
    Color? accentPurple,
    Color? accentPurpleSoft,
  }) {
    return AppSemanticColors(
      backgroundSubtle: backgroundSubtle ?? this.backgroundSubtle,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      borderStrong: borderStrong ?? this.borderStrong,
      textMuted: textMuted ?? this.textMuted,
      brandSoft: brandSoft ?? this.brandSoft,
      danger: danger ?? this.danger,
      dangerHover: dangerHover ?? this.dangerHover,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      infoSoft: infoSoft ?? this.infoSoft,
      accentPurple: accentPurple ?? this.accentPurple,
      accentPurpleSoft: accentPurpleSoft ?? this.accentPurpleSoft,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      backgroundSubtle:
          Color.lerp(backgroundSubtle, other.backgroundSubtle, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      brandSoft: Color.lerp(brandSoft, other.brandSoft, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerHover: Color.lerp(dangerHover, other.dangerHover, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoSoft: Color.lerp(infoSoft, other.infoSoft, t)!,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t)!,
      accentPurpleSoft:
          Color.lerp(accentPurpleSoft, other.accentPurpleSoft, t)!,
    );
  }
}

extension AppThemeContext on BuildContext {
  AppSemanticColors get semanticColors =>
      Theme.of(this).extension<AppSemanticColors>()!;
}
