import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';

class StepProfilePage extends ConsumerStatefulWidget {
  const StepProfilePage({super.key});

  @override
  ConsumerState<StepProfilePage> createState() => StepProfilePageState();
}

class StepProfilePageState extends ConsumerState<StepProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  GlobalKey<FormBuilderState> get formKey => _formKey;

  bool validateAndSaveDraft() {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return false;
    }
    _saveDraft();
    return true;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncProfileDraft());
  }

  void _syncProfileDraft() {
    if (!(_formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false)) {
      return;
    }
    _saveDraft();
  }

  void _saveDraft() {
    final values = _formKey.currentState!.value;
    final birthDate = values['tanggalLahir'] as DateTime?;
    if (birthDate == null) {
      return;
    }

    ref.read(onboardingWizardProvider.notifier).setProfileEntry(
          OnboardingProfileEntry(
            tanggalLahir: birthDate,
            rencanaUsiaPensiun: int.parse(values['rencanaUsiaPensiun'] as String),
            rencanaUsiaWarisan: int.parse(values['rencanaUsiaWarisan'] as String),
            anggotaKeluargaDitanggung:
                int.parse(values['anggotaKeluargaDitanggung'] as String),
            pemasukanBulananRataRata:
                double.parse(values['pemasukanBulananRataRata'] as String),
            pengeluaranBulananRataRata:
                double.parse(values['pengeluaranBulananRataRata'] as String),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(
      onboardingWizardProvider.select((state) => state.profileEntry),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FormBuilder(
        key: _formKey,
        onChanged: () => _saveDraft(),
        initialValue: profile == null
            ? const <String, dynamic>{}
            : <String, dynamic>{
                'tanggalLahir': profile.tanggalLahir,
                'rencanaUsiaPensiun': profile.rencanaUsiaPensiun.toString(),
                'rencanaUsiaWarisan': profile.rencanaUsiaWarisan.toString(),
                'anggotaKeluargaDitanggung':
                    profile.anggotaKeluargaDitanggung.toString(),
                'pemasukanBulananRataRata':
                    profile.pemasukanBulananRataRata.toString(),
                'pengeluaranBulananRataRata':
                    profile.pengeluaranBulananRataRata.toString(),
              },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Lengkapi rencana sisa uang bulanan dan perencanaan pensiun/warisan.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FormBuilderDateTimePicker(
              name: 'tanggalLahir',
              inputType: InputType.date,
              decoration: const InputDecoration(labelText: 'Tanggal lahir'),
              validator: FormBuilderValidators.required(),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'rencanaUsiaPensiun',
              decoration: const InputDecoration(labelText: 'Rencana usia pensiun'),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(30),
                FormBuilderValidators.max(99),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'rencanaUsiaWarisan',
              decoration: const InputDecoration(labelText: 'Rencana usia warisan'),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(30),
                FormBuilderValidators.max(120),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'anggotaKeluargaDitanggung',
              decoration:
                  const InputDecoration(labelText: 'Anggota keluarga ditanggung'),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(1),
                FormBuilderValidators.max(20),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'pemasukanBulananRataRata',
              decoration:
                  const InputDecoration(labelText: 'Pemasukan bulanan rata-rata'),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                FormBuilderValidators.min(0),
              ]),
            ),
            const SizedBox(height: 12),
            FormBuilderTextField(
              name: 'pengeluaranBulananRataRata',
              decoration:
                  const InputDecoration(labelText: 'Pengeluaran bulanan rata-rata'),
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
    );
  }
}
