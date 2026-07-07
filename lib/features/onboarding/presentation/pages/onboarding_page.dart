import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import 'step_accounts_page.dart';
import 'step_credit_cards_page.dart';
import 'step_debts_page.dart';
import 'step_fixed_assets_page.dart';
import 'step_liquid_assets_page.dart';
import 'step_profile_page.dart';
import 'step_receivables_page.dart';

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
      appBar: AppBar(
        title: const Text('Onboarding'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Langkah ${currentStep + 1} dari $onboardingStepCount',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  onboardingStepTitles[currentStep],
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: (currentStep + 1) / onboardingStepCount,
                ),
              ],
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                wizardState.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (currentStep > 0)
                  OutlinedButton(
                    onPressed: isSubmitting
                        ? null
                        : () => ref
                            .read(onboardingWizardProvider.notifier)
                            .goBack(),
                    child: const Text('Kembali'),
                  ),
                if (currentStep > 0) const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isSubmitting ? null : _handleContinue,
                    child: isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(isLastStep ? 'Selesai' : 'Lanjut'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
