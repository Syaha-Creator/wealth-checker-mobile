import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/presentation/widgets/auth_page_widgets.dart';
import '../../data/models/onboarding_entries.dart';

class OnboardingProgressHeader extends StatelessWidget {
  const OnboardingProgressHeader({
    super.key,
    required this.currentStep,
    required this.stepTitle,
  });

  final int currentStep;
  final String stepTitle;

  @override
  Widget build(BuildContext context) {
    final progress = (currentStep + 1) / onboardingStepCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Langkah ${currentStep + 1} dari $onboardingStepCount',
            style: AppTextStyles.labelMedium(AppColors.textMuted),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            stepTitle,
            style: AppTextStyles.headingMedium(AppColors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: List.generate(onboardingStepCount, (index) {
              final isCompleted = index < currentStep;
              final isActive = index == currentStep;
              final isFilled = isCompleted || isActive;

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index == onboardingStepCount - 1 ? 0 : AppSpacing.xs,
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 8,
                    decoration: BoxDecoration(
                      color: isFilled
                          ? AppColors.brandPrimary
                          : AppColors.backgroundSubtle,
                      borderRadius: BorderRadius.circular(999),
                      border: isActive
                          ? Border.all(
                              color: AppColors.brandPrimary.withValues(alpha: 0.35),
                              width: 1,
                            )
                          : null,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: AppSpacing.sm),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: AppColors.backgroundSubtle,
              color: AppColors.brandPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingStepIntro extends StatelessWidget {
  const OnboardingStepIntro({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.bodyMedium(AppColors.textSecondary),
    );
  }
}

class OnboardingFormCard extends StatelessWidget {
  const OnboardingFormCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: child,
    );
  }
}

class OnboardingLabeledField extends StatelessWidget {
  const OnboardingLabeledField({
    super.key,
    required this.label,
    required this.field,
  });

  final String label;
  final Widget field;

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

class OnboardingAddEntryButton extends StatelessWidget {
  const OnboardingAddEntryButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brandPrimary,
        side: const BorderSide(color: AppColors.brandPrimary, width: 1.5),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        textStyle: AppTextStyles.bodyMedium(AppColors.brandPrimary).copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(Icons.add_rounded, size: 20),
      label: const Text('Tambah ke daftar'),
    );
  }
}

class OnboardingSecondaryButton extends StatelessWidget {
  const OnboardingSecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          side: const BorderSide(color: AppColors.borderDefault, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(14)),
          ),
          textStyle: AppTextStyles.bodyMedium(AppColors.textSecondary).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        child: Text(label),
      ),
    );
  }
}

class OnboardingBottomBar extends StatelessWidget {
  const OnboardingBottomBar({
    super.key,
    required this.showBack,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    required this.onBackPressed,
    this.isLoading = false,
  });

  final bool showBack;
  final String primaryLabel;
  final VoidCallback? onPrimaryPressed;
  final VoidCallback? onBackPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(AppSpacing.lg),
      child: Row(
        children: [
          if (showBack) ...[
            Expanded(
              child: OnboardingSecondaryButton(
                label: 'Kembali',
                onPressed: isLoading ? null : onBackPressed,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
          ],
          Expanded(
            flex: showBack ? 2 : 1,
            child: AuthPrimaryButton(
              label: primaryLabel,
              isLoading: isLoading,
              onPressed: onPrimaryPressed,
            ),
          ),
        ],
      ),
    );
  }
}
