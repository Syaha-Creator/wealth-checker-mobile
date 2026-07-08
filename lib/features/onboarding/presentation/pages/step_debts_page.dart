import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../auth/presentation/widgets/auth_page_widgets.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_local_entries_list.dart';
import '../widgets/onboarding_page_widgets.dart';

class StepDebtsPage extends ConsumerStatefulWidget {
  const StepDebtsPage({super.key, required this.stepIndex});

  final int stepIndex;

  @override
  ConsumerState<StepDebtsPage> createState() => _StepDebtsPageState();
}

class _StepDebtsPageState extends ConsumerState<StepDebtsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<OnboardingDebtEntry> get _entries {
    final state = ref.watch(onboardingWizardProvider);
    return widget.stepIndex == 5
        ? state.creditCardEntries
        : state.debtEntries;
  }

  void _addEntry() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    ref.read(onboardingWizardProvider.notifier).addLocalEntry(
          widget.stepIndex,
          OnboardingDebtEntry(
            pemberiUtang: (values['pemberiUtang'] as String).trim(),
            saldoAwal: double.parse(values['saldoAwal'] as String),
          ),
        );
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final isCreditCard = widget.stepIndex == 5;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          OnboardingStepIntro(
            text: isCreditCard
                ? 'Catat kartu kredit yang masih aktif.'
                : 'Catat utang yang masih harus dibayar.',
          ),
          const SizedBox(height: AppSpacing.lg),
          OnboardingFormCard(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AuthLabeledField(
                    label: isCreditCard ? 'Nama bank/kartu' : 'Pemberi utang',
                    field: FormBuilderTextField(
                      name: 'pemberiUtang',
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(context),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Saldo awal',
                    field: FormBuilderTextField(
                      name: 'saldoAwal',
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(context),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          OnboardingAddEntryButton(onPressed: _addEntry),
          const SizedBox(height: AppSpacing.lg),
          OnboardingLocalEntriesList(
            entries: _entries,
            onRemove: (index) => ref
                .read(onboardingWizardProvider.notifier)
                .removeLocalEntry(widget.stepIndex, index),
            itemBuilder: (context, index, entry) {
              final debt = entry as OnboardingDebtEntry;
              return Text(
                '${debt.pemberiUtang} • ${debt.saldoAwal.toStringAsFixed(0)}',
              );
            },
          ),
        ],
      ),
    );
  }
}
