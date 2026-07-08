import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/theme/app_theme.dart';

const _inputBorderRadius = BorderRadius.all(Radius.circular(12));
const _primaryButtonRadius = BorderRadius.all(Radius.circular(14));

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({
    super.key,
    this.title = 'Wealth Checker',
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return Column(
      children: [
        const AuthLogoMark(),
        const SizedBox(height: AppSpacing.xl),
        Text(
          title,
          style: AppTextStyles.headingLarge(colors.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          subtitle,
          style: AppTextStyles.bodyMedium(colors.textMuted),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class AuthLogoMark extends StatelessWidget {
  const AuthLogoMark({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandSoft,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.cardSubtle,
      ),
      child: SizedBox(
        width: 64,
        height: 64,
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: colors.brand,
                width: 2.5,
              ),
            ),
            child: SizedBox(
              width: 28,
              height: 28,
              child: Icon(
                Icons.trending_up_rounded,
                color: colors.brand,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthLabeledField extends StatelessWidget {
  const AuthLabeledField({
    super.key,
    required this.label,
    required this.field,
  });

  final String label;
  final FormBuilderTextField field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppTextStyles.labelMedium(context.semanticColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}

InputDecoration authInputDecoration(
  BuildContext context, {
  String? hintText,
  String? helperText,
}) {
  final colors = context.semanticColors;
  final borderSide = BorderSide(
    color: colors.border,
    width: 1.5,
  );

  return InputDecoration(
    hintText: hintText,
    helperText: helperText,
    helperStyle: AppTextStyles.bodySmall(colors.textMuted),
    filled: true,
    fillColor: colors.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    border: OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: borderSide,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: borderSide,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: colors.brand,
        width: 1.5,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: colors.danger,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: colors.dangerHover,
        width: 1.5,
      ),
    ),
  );
}

TextStyle authFieldTextStyle(BuildContext context) =>
    AppTextStyles.bodyLarge(context.semanticColors.textPrimary).copyWith(
      fontWeight: FontWeight.w600,
    );

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.brand,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: colors.textMuted.withValues(alpha: 0.3),
          disabledForegroundColor: colors.textMuted,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: _primaryButtonRadius,
          ),
          textStyle: AppTextStyles.bodyLarge(AppColors.white).copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.white,
                ),
              )
            : Text(label),
      ),
    );
  }
}

class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    super.key,
    required this.leadingText,
    required this.actionText,
    required this.onTap,
    this.enabled = true,
  });

  final String leadingText;
  final String actionText;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          leadingText,
          style: AppTextStyles.bodyMedium(colors.textMuted),
        ),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Text(
            actionText,
            style: AppTextStyles.bodyMedium(colors.brand).copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class AuthErrorBanner extends StatelessWidget {
  const AuthErrorBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.dangerSoft,
        borderRadius: AppRadius.circular,
        border: Border.all(color: colors.danger.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Text(
          message,
          style: AppTextStyles.bodySmall(colors.danger),
        ),
      ),
    );
  }
}

class AuthSuccessBanner extends StatelessWidget {
  const AuthSuccessBanner({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandSoft,
        borderRadius: AppRadius.circular,
        border: Border.all(color: colors.brand.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Text(
          message,
          style: AppTextStyles.bodySmall(colors.brand),
        ),
      ),
    );
  }
}
