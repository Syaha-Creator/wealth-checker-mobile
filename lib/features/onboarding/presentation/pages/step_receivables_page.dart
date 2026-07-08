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

class StepReceivablesPage extends ConsumerStatefulWidget {
  const StepReceivablesPage({super.key});

  @override
  ConsumerState<StepReceivablesPage> createState() =>
      _StepReceivablesPageState();
}

class _StepReceivablesPageState extends ConsumerState<StepReceivablesPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _addEntry() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    ref.read(onboardingWizardProvider.notifier).addLocalEntry(
          4,
          OnboardingReceivableEntry(
            peminjam: (values['peminjam'] as String).trim(),
            saldoAwal: double.parse(values['saldoAwal'] as String),
          ),
        );
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(
      onboardingWizardProvider.select((state) => state.receivableEntries),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const OnboardingStepIntro(
            text: 'Catat piutang yang belum diterima kembali.',
          ),
          const SizedBox(height: AppSpacing.lg),
          OnboardingFormCard(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AuthLabeledField(
                    label: 'Nama peminjam',
                    field: FormBuilderTextField(
                      name: 'peminjam',
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
            entries: entries,
            onRemove: (index) =>
                ref.read(onboardingWizardProvider.notifier).removeLocalEntry(4, index),
            itemBuilder: (context, index, entry) {
              final receivable = entry as OnboardingReceivableEntry;
              return Text(
                '${receivable.peminjam} • ${receivable.saldoAwal.toStringAsFixed(0)}',
              );
            },
          ),
        ],
      ),
    );
  }
}
