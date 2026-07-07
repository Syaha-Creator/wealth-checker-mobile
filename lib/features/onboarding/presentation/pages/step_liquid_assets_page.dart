import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_local_entries_list.dart';

class StepLiquidAssetsPage extends ConsumerStatefulWidget {
  const StepLiquidAssetsPage({super.key});

  @override
  ConsumerState<StepLiquidAssetsPage> createState() =>
      _StepLiquidAssetsPageState();
}

class _StepLiquidAssetsPageState extends ConsumerState<StepLiquidAssetsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _addEntry() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    ref.read(onboardingWizardProvider.notifier).addLocalEntry(
          1,
          OnboardingAssetEntry(
            namaAset: (values['namaAset'] as String).trim(),
            jumlah: double.parse(values['jumlah'] as String),
            hargaBeliRataRata: double.parse(values['hargaBeliRataRata'] as String),
          ),
        );
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(
      onboardingWizardProvider.select((state) => state.liquidAssetEntries),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Catat aset setara kas atau investasi likuid.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                FormBuilderTextField(
                  name: 'namaAset',
                  decoration: const InputDecoration(labelText: 'Nama aset'),
                  validator: FormBuilderValidators.required(),
                ),
                const SizedBox(height: 12),
                FormBuilderTextField(
                  name: 'jumlah',
                  decoration: const InputDecoration(labelText: 'Jumlah'),
                  keyboardType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric(),
                    FormBuilderValidators.min(0.0001),
                  ]),
                ),
                const SizedBox(height: 12),
                FormBuilderTextField(
                  name: 'hargaBeliRataRata',
                  decoration: const InputDecoration(labelText: 'Harga beli rata-rata'),
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
                ref.read(onboardingWizardProvider.notifier).removeLocalEntry(1, index),
            itemBuilder: (context, index, entry) {
              final asset = entry as OnboardingAssetEntry;
              return Text(
                '${asset.namaAset} • ${asset.jumlah} x ${asset.hargaBeliRataRata.toStringAsFixed(0)}',
              );
            },
          ),
        ],
      ),
    );
  }
}
