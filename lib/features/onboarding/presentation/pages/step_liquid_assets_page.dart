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
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const OnboardingStepIntro(
            text: 'Catat aset setara kas atau investasi likuid.',
          ),
          const SizedBox(height: AppSpacing.lg),
          OnboardingFormCard(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  AuthLabeledField(
                    label: 'Nama aset',
                    field: FormBuilderTextField(
                      name: 'namaAset',
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(context),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Jumlah',
                    field: FormBuilderTextField(
                      name: 'jumlah',
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(context),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0.0001),
                      ]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Harga beli rata-rata',
                    field: FormBuilderTextField(
                      name: 'hargaBeliRataRata',
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
