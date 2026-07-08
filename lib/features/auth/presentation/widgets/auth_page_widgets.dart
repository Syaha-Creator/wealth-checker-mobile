import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/theme/app_theme.dart';

const _inputBorderRadius = BorderRadius.all(Radius.circular(12));
const _primaryButtonRadius = BorderRadius.all(Radius.circular(14));

class AuthPageHeader extends StatelessWidget {
  const AuthPageHeader({
    super.key,
    required this.subtitle,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthLogoMark(),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Wealth Checker',
          style: AppTextStyles.headingLarge(AppColors.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          subtitle,
          style: AppTextStyles.bodyMedium(AppColors.textMuted),
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.brandSoft,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.cardSubtle,
      ),
      child: const SizedBox(
        width: 64,
        height: 64,
        child: Center(
          child: _LogoInnerCircle(),
        ),
      ),
    );
  }
}

class _LogoInnerCircle extends StatelessWidget {
  const _LogoInnerCircle();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.brandPrimary,
          width: 2.5,
        ),
      ),
      child: const SizedBox(
        width: 28,
        height: 28,
        child: Icon(
          Icons.trending_up_rounded,
          color: AppColors.brandPrimary,
          size: 16,
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
          style: AppTextStyles.labelMedium(AppColors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.sm),
        field,
      ],
    );
  }
}

InputDecoration authInputDecoration({
  String? hintText,
  String? helperText,
}) {
  const borderSide = BorderSide(
    color: AppColors.borderDefault,
    width: 1.5,
  );

  return InputDecoration(
    hintText: hintText,
    helperText: helperText,
    helperStyle: AppTextStyles.bodySmall(AppColors.textMuted),
    filled: true,
    fillColor: AppColors.bgSurface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.md,
    ),
    border: const OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: borderSide,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: borderSide,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: AppColors.brandPrimary,
        width: 1.5,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: AppColors.dangerPrimary,
        width: 1.5,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: _inputBorderRadius,
      borderSide: BorderSide(
        color: AppColors.dangerPrimary,
        width: 1.5,
      ),
    ),
  );
}

TextStyle get authFieldTextStyle =>
    AppTextStyles.bodyLarge(AppColors.textPrimary).copyWith(
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
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandPrimary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.textMuted.withValues(alpha: 0.3),
          disabledForegroundColor: AppColors.textMuted,
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
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          leadingText,
          style: AppTextStyles.bodyMedium(AppColors.textMuted),
        ),
        GestureDetector(
          onTap: enabled ? onTap : null,
          child: Text(
            actionText,
            style: AppTextStyles.bodyMedium(AppColors.brandPrimary).copyWith(
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.dangerNewSoft,
        borderRadius: AppRadius.circular,
        border: Border.all(color: AppColors.dangerPrimary.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Text(
          message,
          style: AppTextStyles.bodySmall(AppColors.dangerPrimary),
        ),
      ),
    );
  }
}
