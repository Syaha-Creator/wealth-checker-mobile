import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design-token primitives — do not use raw hex outside this file.
abstract final class AppColors {
  // Primitives
  static const green500 = Color(0xFF059669);
  static const green400 = Color(0xFF34D399);
  static const green50 = Color(0xFFECFDF5);
  static const blue500 = Color(0xFF3B82F6);
  static const blue50 = Color(0xFFEFF6FF);
  static const purple500 = Color(0xFF7C3AED);
  static const purple300 = Color(0xFFA78BFA);
  static const purple50 = Color(0xFFF5F3FF);
  static const red500 = Color(0xFFEF4444);
  static const red400 = Color(0xFFF87171);
  static const amber500 = Color(0xFFF59E0B);
  static const amber400 = Color(0xFFFBBF24);
  static const gray900 = Color(0xFF0F172A);
  static const gray700 = Color(0xFF334155);
  static const gray500 = Color(0xFF64748B);
  static const gray300 = Color(0xFFCBD5E1);
  static const gray100 = Color(0xFFF1F5F9);
  static const gray50 = Color(0xFFF8FAFC);
  static const white = Color(0xFFFFFFFF);
  static const charcoal900 = Color(0xFF0B1120);
  static const charcoal800 = Color(0xFF131C2E);

  static const dangerNew = Color(0xFFD64545);
  static const dangerNewDark = Color(0xFFE8746C);
  static const dangerNewSoft = Color(0xFFFBEAEA);

  // Mockup v2 accent palette
  static const accentBlue = Color(0xFF3E6FD9);
  static const accentBlueDark = Color(0xFF6D93E8);
  static const accentBlueSoft = Color(0xFFEAF0FD);
  static const investPurple = Color(0xFF7B5FD9);
  static const investPurpleDark = Color(0xFFA794EA);
  static const investPurpleSoft = Color(0xFFF0EDFC);
  static const amberAccent = Color(0xFFC97A1E);
  static const amberAccentDark = Color(0xFFE0A344);
  static const amberAccentSoft = Color(0xFFFBF0E1);

  // Semantic — light mode
  static const bgPrimary = gray50;
  static const bgSurface = white;
  static const bgBrandSoft = green50;
  static const bgInfoSoft = blue50;
  static const bgAccentSoft = purple50;
  static const borderDefault = gray300;
  static const textPrimary = gray900;
  static const textSecondary = gray700;
  static const textMuted = gray500;
  static const brandPrimary = green500;
  static const infoPrimary = blue500;
  static const accentPrimary = purple500;
  static const dangerPrimary = dangerNew;
  static const warningPrimary = amberAccent;

  // Backward-compatible aliases used across the app
  static const background = bgPrimary;
  static const backgroundSubtle = gray100;
  static const surface = bgSurface;
  static const surfaceHover = gray50;
  static const border = borderDefault;
  static const borderStrong = gray300;
  static const brand = brandPrimary;
  static const brandSoft = bgBrandSoft;
  static const brandHover = Color(0xFF047857);
  static const brandActive = Color(0xFF065F46);
  static const danger = dangerPrimary;
  static const dangerHover = Color(0xFFDC2626);
  static const warning = warningPrimary;
  static const info = infoPrimary;
  static const infoSoft = bgInfoSoft;
  static const accentPurple = accentPrimary;
  static const accentPurpleSoft = bgAccentSoft;

  // Dark mode (reserved)
  static const backgroundDark = charcoal900;
  static const backgroundSubtleDark = gray900;
  static const surfaceDark = charcoal800;
  static const surfaceHoverDark = Color(0xFF1A2436);
  static const borderDark = Color(0xFF253349);
  static const borderStrongDark = gray700;
  static const textPrimaryDark = gray100;
  static const textSecondaryDark = Color(0xFFB6C2D4);
  static const textMutedDark = gray500;
  static const brandDark = green400;
  static const brandHoverDark = Color(0xFF6EE7B7);
  static const dangerDark = red400;
  static const warningDark = amber400;
  static const accentPurpleDark = purple300;

  static const accentBlueSoftDark = Color(0xFF1A2744);
  static const investPurpleSoftDark = Color(0xFF241E38);
  static const amberAccentSoftDark = Color(0xFF382B1A);
  static const brandSoftDark = Color(0xFF102820);
  static const dangerSoftDark = Color(0xFF3A2222);
}

/// Strict spacing scale — only these values in layout code.
abstract final class AppSpacing {
  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 32.0;
}

/// Single corner radius for cards, buttons, inputs, and chips.
abstract final class AppRadius {
  static const value = 12.0;
  static const circular = BorderRadius.all(Radius.circular(value));
}

/// Brand-tinted and neutral shadows for card elevation variants.
abstract final class AppShadows {
  static const cardElevated = <BoxShadow>[
    BoxShadow(
      color: Color(0x0F059669), // green500 @ 0.06
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: Color(0x1A059669), // green500 @ 0.10
      offset: Offset(0, 8),
      blurRadius: 20,
      spreadRadius: -4,
    ),
  ];

  static const cardSubtle = <BoxShadow>[
    BoxShadow(
      color: Color.fromRGBO(20, 60, 40, 0.06),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  /// Default card shadow for mockup v2 — alias of [cardSubtle].
  static const shadowSm = cardSubtle;
}

/// BoxDecoration helpers for card variants.
abstract final class AppDecorations {
  static BoxDecoration cardElevated({Color? color}) => BoxDecoration(
        color: color ?? AppColors.bgSurface,
        borderRadius: AppRadius.circular,
        boxShadow: AppShadows.cardElevated,
      );

  static BoxDecoration cardSubtle({Color? color}) => BoxDecoration(
        color: color ?? AppColors.bgSurface,
        borderRadius: AppRadius.circular,
        boxShadow: AppShadows.cardSubtle,
      );
}

/// Premium fintech typography — Plus Jakarta Sans (bundled locally).
abstract final class AppTextStyles {
  static const fontFamily = 'Plus Jakarta Sans';
  static const _tabularFigures = [FontFeature.tabularFigures()];

  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
    Color? color,
    List<FontFeature>? fontFeatures,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
      fontFeatures: fontFeatures,
    );
  }

  static TextStyle heroNumberCompact(Color color) => _base(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: -0.5,
        color: color,
        fontFeatures: _tabularFigures,
      );

  /// Display/HeroNumber — net worth hero only.
  static TextStyle heroNumber(Color color) => _base(
        fontSize: 44,
        fontWeight: FontWeight.w700,
        height: 1.0,
        letterSpacing: -0.5,
        color: color,
        fontFeatures: _tabularFigures,
      );

  /// Display/HeadingLarge
  static TextStyle headingLarge(Color color) => _base(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.25,
        color: color,
      );

  /// Heading/Medium — section titles
  static TextStyle headingMedium(Color color) => _base(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: color,
      );

  /// Heading/Small
  static TextStyle headingSmall(Color color) => _base(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.3,
        color: color,
      );

  /// Body/Large
  static TextStyle bodyLarge(Color color) => _base(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: color,
      );

  /// Body/Medium
  static TextStyle bodyMedium(Color color) => _base(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: color,
      );

  /// Body/Small
  static TextStyle bodySmall(Color color) => _base(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.4,
        color: color,
      );

  /// Label/Medium
  static TextStyle labelMedium(Color color) => _base(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.3,
        letterSpacing: 0.1,
        color: color,
      );

  /// Money/Medium — transaction amounts, lists, forms.
  static TextStyle money(Color color) => _base(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: color,
        fontFeatures: _tabularFigures,
      );
}

/// Card wrapper with explicit elevation variant — replaces default bordered Card.
class AppCard extends StatelessWidget {
  const AppCard.elevated({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
  }) : _elevated = true;

  const AppCard.subtle({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
  }) : _elevated = false;

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final bool _elevated;

  @override
  Widget build(BuildContext context) {
    final surfaceColor = color ?? context.semanticColors.surface;
    final decoration = _elevated
        ? AppDecorations.cardElevated(color: surfaceColor)
        : AppDecorations.cardSubtle(color: surfaceColor);

    final content = Padding(
      padding: padding ?? EdgeInsets.zero,
      child: child,
    );

    if (onTap == null) {
      return DecoratedBox(
        decoration: decoration,
        child: content,
      );
    }

    return DecoratedBox(
      decoration: decoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.circular,
          child: content,
        ),
      ),
    );
  }
}

abstract final class AppTheme {
  static ThemeData get light => _buildTheme(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColors.brandPrimary,
          onPrimary: AppColors.white,
          primaryContainer: AppColors.bgBrandSoft,
          onPrimaryContainer: AppColors.brandActive,
          secondary: AppColors.textSecondary,
          onSecondary: AppColors.white,
          surface: AppColors.bgSurface,
          onSurface: AppColors.textPrimary,
          error: AppColors.dangerPrimary,
          onError: AppColors.white,
          outline: AppColors.borderDefault,
        ),
        scaffoldBackground: AppColors.bgPrimary,
        appBarBackground: AppColors.bgSurface,
        appBarForeground: AppColors.textPrimary,
        cardColor: AppColors.bgSurface,
        dividerColor: AppColors.borderDefault,
        textPrimary: AppColors.textPrimary,
        textSecondary: AppColors.textSecondary,
        textMuted: AppColors.textMuted,
        brand: AppColors.brandPrimary,
        brandHover: AppColors.brandHover,
        danger: AppColors.dangerPrimary,
        dangerHover: AppColors.dangerHover,
        warning: AppColors.warningPrimary,
        info: AppColors.infoPrimary,
        accentPurple: AppColors.accentPrimary,
        infoSoft: AppColors.bgInfoSoft,
        accentPurpleSoft: AppColors.bgAccentSoft,
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
        info: AppColors.infoPrimary,
        accentPurple: AppColors.accentPurpleDark,
        infoSoft: const Color(0xFF1E3A8A),
        accentPurpleSoft: const Color(0xFF4C1D95),
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
          displayLarge: AppTextStyles.headingLarge(textPrimary),
          titleMedium: AppTextStyles.headingMedium(textPrimary),
          titleSmall: AppTextStyles.headingSmall(textPrimary),
          bodyLarge: AppTextStyles.bodyLarge(textPrimary),
          bodyMedium: AppTextStyles.bodyMedium(textSecondary),
          bodySmall: AppTextStyles.bodySmall(textMuted),
          labelLarge: AppTextStyles.labelMedium(textPrimary),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: AppTextStyles.fontFamily,
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
        titleTextStyle: AppTextStyles.headingSmall(appBarForeground),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.circular,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brand,
          foregroundColor: brightness == Brightness.light
              ? AppColors.white
              : AppColors.backgroundDark,
          disabledBackgroundColor: textMuted.withValues(alpha: 0.3),
          disabledForegroundColor: textMuted,
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circular,
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
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circular,
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
        hintStyle: AppTextStyles.bodyMedium(textMuted),
        labelStyle: AppTextStyles.labelMedium(textSecondary),
        prefixStyle: AppTextStyles.money(textPrimary),
        border: OutlineInputBorder(
          borderRadius: AppRadius.circular,
          borderSide: BorderSide(color: dividerColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular,
          borderSide: BorderSide(color: dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular,
          borderSide: BorderSide(color: brand, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular,
          borderSide: BorderSide(color: danger),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circular,
          borderSide: BorderSide(color: dangerHover, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: brand,
        foregroundColor: brightness == Brightness.light
            ? AppColors.white
            : AppColors.backgroundDark,
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circular,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textPrimary,
        contentTextStyle: TextStyle(
          color: brightness == Brightness.light
              ? AppColors.bgSurface
              : AppColors.textPrimaryDark,
        ),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.circular),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: brand),
      extensions: [
        AppSemanticColors(
          textPrimary: textPrimary,
          textSecondary: textSecondary,
          textMuted: textMuted,
          background: scaffoldBackground,
          surface: cardColor,
          border: dividerColor,
          backgroundSubtle: brightness == Brightness.light
              ? AppColors.backgroundSubtle
              : AppColors.backgroundSubtleDark,
          surfaceHover: brightness == Brightness.light
              ? AppColors.surfaceHover
              : AppColors.surfaceHoverDark,
          borderStrong: brightness == Brightness.light
              ? AppColors.borderStrong
              : AppColors.borderStrongDark,
          brand: brand,
          brandSoft: brightness == Brightness.light
              ? AppColors.bgBrandSoft
              : AppColors.brandSoftDark,
          danger: danger,
          dangerSoft: brightness == Brightness.light
              ? AppColors.dangerNewSoft
              : AppColors.dangerSoftDark,
          dangerHover: dangerHover,
          warning: warning,
          info: info,
          infoSoft: infoSoft,
          accentBlue: brightness == Brightness.light
              ? AppColors.accentBlue
              : AppColors.accentBlueDark,
          accentBlueSoft: brightness == Brightness.light
              ? AppColors.accentBlueSoft
              : AppColors.accentBlueSoftDark,
          investPurple: brightness == Brightness.light
              ? AppColors.investPurple
              : AppColors.investPurpleDark,
          investPurpleSoft: brightness == Brightness.light
              ? AppColors.investPurpleSoft
              : AppColors.investPurpleSoftDark,
          amberAccent: brightness == Brightness.light
              ? AppColors.amberAccent
              : AppColors.amberAccentDark,
          amberAccentSoft: brightness == Brightness.light
              ? AppColors.amberAccentSoft
              : AppColors.amberAccentSoftDark,
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
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.background,
    required this.surface,
    required this.border,
    required this.backgroundSubtle,
    required this.surfaceHover,
    required this.borderStrong,
    required this.brand,
    required this.brandSoft,
    required this.danger,
    required this.dangerSoft,
    required this.dangerHover,
    required this.warning,
    required this.info,
    required this.infoSoft,
    required this.accentBlue,
    required this.accentBlueSoft,
    required this.investPurple,
    required this.investPurpleSoft,
    required this.amberAccent,
    required this.amberAccentSoft,
    required this.accentPurple,
    required this.accentPurpleSoft,
  });

  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color background;
  final Color surface;
  final Color border;
  final Color backgroundSubtle;
  final Color surfaceHover;
  final Color borderStrong;
  final Color brand;
  final Color brandSoft;
  final Color danger;
  final Color dangerSoft;
  final Color dangerHover;
  final Color warning;
  final Color info;
  final Color infoSoft;
  final Color accentBlue;
  final Color accentBlueSoft;
  final Color investPurple;
  final Color investPurpleSoft;
  final Color amberAccent;
  final Color amberAccentSoft;
  final Color accentPurple;
  final Color accentPurpleSoft;

  @override
  AppSemanticColors copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? textMuted,
    Color? background,
    Color? surface,
    Color? border,
    Color? backgroundSubtle,
    Color? surfaceHover,
    Color? borderStrong,
    Color? brand,
    Color? brandSoft,
    Color? danger,
    Color? dangerSoft,
    Color? dangerHover,
    Color? warning,
    Color? info,
    Color? infoSoft,
    Color? accentBlue,
    Color? accentBlueSoft,
    Color? investPurple,
    Color? investPurpleSoft,
    Color? amberAccent,
    Color? amberAccentSoft,
    Color? accentPurple,
    Color? accentPurpleSoft,
  }) {
    return AppSemanticColors(
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textMuted: textMuted ?? this.textMuted,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      border: border ?? this.border,
      backgroundSubtle: backgroundSubtle ?? this.backgroundSubtle,
      surfaceHover: surfaceHover ?? this.surfaceHover,
      borderStrong: borderStrong ?? this.borderStrong,
      brand: brand ?? this.brand,
      brandSoft: brandSoft ?? this.brandSoft,
      danger: danger ?? this.danger,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      dangerHover: dangerHover ?? this.dangerHover,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      infoSoft: infoSoft ?? this.infoSoft,
      accentBlue: accentBlue ?? this.accentBlue,
      accentBlueSoft: accentBlueSoft ?? this.accentBlueSoft,
      investPurple: investPurple ?? this.investPurple,
      investPurpleSoft: investPurpleSoft ?? this.investPurpleSoft,
      amberAccent: amberAccent ?? this.amberAccent,
      amberAccentSoft: amberAccentSoft ?? this.amberAccentSoft,
      accentPurple: accentPurple ?? this.accentPurple,
      accentPurpleSoft: accentPurpleSoft ?? this.accentPurpleSoft,
    );
  }

  @override
  AppSemanticColors lerp(ThemeExtension<AppSemanticColors>? other, double t) {
    if (other is! AppSemanticColors) return this;
    return AppSemanticColors(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      border: Color.lerp(border, other.border, t)!,
      backgroundSubtle:
          Color.lerp(backgroundSubtle, other.backgroundSubtle, t)!,
      surfaceHover: Color.lerp(surfaceHover, other.surfaceHover, t)!,
      borderStrong: Color.lerp(borderStrong, other.borderStrong, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandSoft: Color.lerp(brandSoft, other.brandSoft, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
      dangerHover: Color.lerp(dangerHover, other.dangerHover, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoSoft: Color.lerp(infoSoft, other.infoSoft, t)!,
      accentBlue: Color.lerp(accentBlue, other.accentBlue, t)!,
      accentBlueSoft: Color.lerp(accentBlueSoft, other.accentBlueSoft, t)!,
      investPurple: Color.lerp(investPurple, other.investPurple, t)!,
      investPurpleSoft:
          Color.lerp(investPurpleSoft, other.investPurpleSoft, t)!,
      amberAccent: Color.lerp(amberAccent, other.amberAccent, t)!,
      amberAccentSoft:
          Color.lerp(amberAccentSoft, other.amberAccentSoft, t)!,
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
