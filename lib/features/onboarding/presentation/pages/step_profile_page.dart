import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../auth/presentation/widgets/auth_page_widgets.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/onboarding_entries.dart';
import '../providers/onboarding_wizard_provider.dart';
import '../widgets/onboarding_page_widgets.dart';

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
      padding: const EdgeInsets.all(AppSpacing.lg),
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
            const OnboardingStepIntro(
              text:
                  'Lengkapi rencana sisa uang bulanan dan perencanaan pensiun/warisan.',
            ),
            const SizedBox(height: AppSpacing.lg),
            OnboardingFormCard(
              child: Column(
                children: [
                  OnboardingLabeledField(
                    label: 'Tanggal lahir',
                    field: FormBuilderDateTimePicker(
                      name: 'tanggalLahir',
                      inputType: InputType.date,
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
                      validator: FormBuilderValidators.required(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Rencana usia pensiun',
                    field: FormBuilderTextField(
                      name: 'rencanaUsiaPensiun',
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(30),
                        FormBuilderValidators.max(99),
                      ]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Rencana usia warisan',
                    field: FormBuilderTextField(
                      name: 'rencanaUsiaWarisan',
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(30),
                        FormBuilderValidators.max(120),
                      ]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Anggota keluarga ditanggung',
                    field: FormBuilderTextField(
                      name: 'anggotaKeluargaDitanggung',
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(1),
                        FormBuilderValidators.max(20),
                      ]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Pemasukan bulanan rata-rata',
                    field: FormBuilderTextField(
                      name: 'pemasukanBulananRataRata',
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
                      keyboardType: TextInputType.number,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ]),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AuthLabeledField(
                    label: 'Pengeluaran bulanan rata-rata',
                    field: FormBuilderTextField(
                      name: 'pengeluaranBulananRataRata',
                      style: authFieldTextStyle,
                      decoration: authInputDecoration(),
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
          ],
        ),
      ),
    );
  }
}
