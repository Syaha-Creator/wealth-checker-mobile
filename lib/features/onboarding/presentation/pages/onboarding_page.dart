import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_page_widgets.dart';
import 'step_accounts_page.dart';
import 'step_credit_cards_page.dart';
import 'step_debts_page.dart';
import 'step_fixed_assets_page.dart';
import 'step_liquid_assets_page.dart';
import 'step_profile_page.dart';
import 'step_receivables_page.dart';
import '../../../auth/presentation/widgets/auth_page_widgets.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  late final PageController _pageController;
  final _profileStepKey = GlobalKey<StepProfilePageState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _handleContinue() async {
    final wizard = ref.read(onboardingWizardProvider.notifier);
    final currentStep = ref.read(onboardingWizardProvider).currentStepIndex;

    if (currentStep == onboardingStepCount - 1) {
      final isValid = _profileStepKey.currentState?.validateAndSaveDraft() ?? false;
      if (!isValid) {
        return;
      }
    }

    final completed = await wizard.submitCurrentStepAndAdvance();
    if (!mounted) {
      return;
    }

    if (completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Onboarding berhasil diselesaikan')),
      );
      context.go('/home');
      return;
    }

    final nextStep = ref.read(onboardingWizardProvider).currentStepIndex;
    if (_pageController.hasClients) {
      await _pageController.animateToPage(
        nextStep,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final wizardState = ref.watch(onboardingWizardProvider);
    final currentStep = wizardState.currentStepIndex;
    final isSubmitting =
        wizardState.submitStatus == OnboardingSubmitStatus.submitting;
    final isLastStep = currentStep == onboardingStepCount - 1;

    ref.listen(onboardingWizardProvider, (previous, next) {
      if (previous?.currentStepIndex != next.currentStepIndex &&
          _pageController.hasClients) {
        _pageController.jumpToPage(next.currentStepIndex);
      }
    });

    return Scaffold(
      backgroundColor: context.semanticColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OnboardingProgressHeader(
            currentStep: currentStep,
            stepTitle: onboardingStepTitles[currentStep],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const StepAccountsPage(),
                const StepLiquidAssetsPage(),
                const StepFixedAssetsPage(),
                const StepDebtsPage(stepIndex: 3),
                const StepReceivablesPage(),
                const StepCreditCardsPage(),
                StepProfilePage(key: _profileStepKey),
              ],
            ),
          ),
          if (wizardState.errorMessage != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                0,
                AppSpacing.lg,
                AppSpacing.sm,
              ),
              child: AuthErrorBanner(message: wizardState.errorMessage!),
            ),
          OnboardingBottomBar(
            showBack: currentStep > 0,
            primaryLabel: isLastStep ? 'Selesai' : 'Lanjut',
            isLoading: isSubmitting,
            onPrimaryPressed: isSubmitting ? null : _handleContinue,
            onBackPressed: () =>
                ref.read(onboardingWizardProvider.notifier).goBack(),
          ),
        ],
      ),
    );
  }
}
