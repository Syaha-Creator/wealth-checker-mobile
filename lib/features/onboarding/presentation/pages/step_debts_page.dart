import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_local_entries_list.dart';

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isCreditCard
                ? 'Catat kartu kredit yang masih aktif.'
                : 'Catat utang yang masih harus dibayar.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'pemberiUtang',
                  decoration: InputDecoration(
                    labelText: isCreditCard ? 'Nama bank/kartu' : 'Pemberi utang',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 12),
                FormBuilderTextField(
                  name: 'saldoAwal',
                  decoration: const InputDecoration(labelText: 'Saldo awal'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(0),
                  ]),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _addEntry,
            icon: const Icon(Icons.add),
            label: const Text('Tambah ke daftar'),
          ),
          const SizedBox(height: 16),
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
