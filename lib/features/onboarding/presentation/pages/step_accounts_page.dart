import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_local_entries_list.dart';

class StepAccountsPage extends ConsumerStatefulWidget {
  const StepAccountsPage({super.key});

  @override
  ConsumerState<StepAccountsPage> createState() => _StepAccountsPageState();
}

class _StepAccountsPageState extends ConsumerState<StepAccountsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _addEntry() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    ref.read(onboardingWizardProvider.notifier).addLocalEntry(
          0,
          OnboardingAccountEntry(
            nama: (values['nama'] as String).trim(),
            saldoAwal: double.parse(values['saldoAwal'] as String),
          ),
        );
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(
      onboardingWizardProvider.select((state) => state.accountEntries),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Tambahkan rekening kas dan tabunganmu. Kamu bisa menambah lebih dari satu.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'nama',
                  decoration: const InputDecoration(labelText: 'Nama rekening'),
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
            entries: entries,
            onRemove: (index) =>
                ref.read(onboardingWizardProvider.notifier).removeLocalEntry(0, index),
            itemBuilder: (context, index, entry) {
              final account = entry as OnboardingAccountEntry;
              return Text('${account.nama} • ${account.saldoAwal.toStringAsFixed(0)}');
            },
          ),
        ],
      ),
    );
  }
}
