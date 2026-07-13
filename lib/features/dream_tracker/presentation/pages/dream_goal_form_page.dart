import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';
import '../../data/models/dream_goal.dart';
import '../../data/models/dream_goal_input.dart';
import '../providers/dream_goals_list_provider.dart';

enum _TrackingMode { account, manual }

class DreamGoalFormPage extends ConsumerStatefulWidget {
  const DreamGoalFormPage({super.key, this.goal});

  final DreamGoal? goal;

  bool get isEditMode => goal != null;

  @override
  ConsumerState<DreamGoalFormPage> createState() => _DreamGoalFormPageState();
}

class _DreamGoalFormPageState extends ConsumerState<DreamGoalFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;
  late _TrackingMode _trackingMode;

  @override
  void initState() {
    super.initState();
    _trackingMode = widget.goal?.isLinkedToAccount == true
        ? _TrackingMode.account
        : _TrackingMode.manual;
  }

  Map<String, dynamic> get _initialValues {
    final goal = widget.goal;
    if (goal == null) {
      return {};
    }
    return {
      'namaGoal': goal.namaGoal,
      'targetNominal': goal.targetNominal.toString(),
      'accountId': goal.accountId,
      'saldoManual': goal.isLinkedToAccount ? null : goal.saldoSaatIni.toString(),
    };
  }

  DreamGoalInput _buildInput() {
    final values = _formKey.currentState!.value;
    final namaGoal = (values['namaGoal'] as String).trim();
    final targetNominal = int.parse(values['targetNominal'] as String);

    if (_trackingMode == _TrackingMode.account) {
      return DreamGoalInput(
        namaGoal: namaGoal,
        targetNominal: targetNominal,
        accountId: values['accountId'] as String?,
      );
    }

    final saldoManual = double.parse(values['saldoManual'] as String);
    return DreamGoalInput(
      namaGoal: namaGoal,
      targetNominal: targetNominal,
      saldoManual: saldoManual,
      unlinkAccount: widget.isEditMode && widget.goal!.isLinkedToAccount,
    );
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final input = _buildInput();

      if (widget.isEditMode) {
        await ref.read(dreamGoalsListProvider.notifier).updateGoal(
              id: widget.goal!.id,
              input: input,
            );
      } else {
        await ref.read(dreamGoalsListProvider.notifier).addGoal(input);
      }

      if (!mounted) {
        return;
      }

      final messenger = ScaffoldMessenger.of(context);
      context.pop();
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            widget.isEditMode
                ? 'Goal berhasil diperbarui'
                : 'Goal berhasil ditambahkan',
          ),
        ),
      );
    } on DreamGoalInputException catch (error) {
      setState(() => _errorMessage = error.message);
    } on ApiException catch (error) {
      setState(() => _errorMessage = error.message);
    } catch (_) {
      setState(
        () => _errorMessage = 'Terjadi kesalahan. Silakan coba lagi.',
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(accountsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditMode ? 'Edit Goal' : 'Tambah Goal'),
      ),
      body: FormBuilder(
        key: _formKey,
        initialValue: _initialValues,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FormBuilderTextField(
              name: 'namaGoal',
              decoration: const InputDecoration(
                labelText: 'Nama Goal',
                border: OutlineInputBorder(),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(1),
              ]),
            ),
            const SizedBox(height: 16),
            FormBuilderTextField(
              name: 'targetNominal',
              decoration: const InputDecoration(
                labelText: 'Target Nominal',
                prefixText: 'Rp ',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.numeric(),
                (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Masukkan angka valid';
                  }
                  if (int.parse(value) <= 0) {
                    return 'Target harus lebih dari 0';
                  }
                  return null;
                },
              ]),
            ),
            const SizedBox(height: 24),
            Text(
              'Cara Lacak Progres',
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            SegmentedButton<_TrackingMode>(
              segments: const [
                ButtonSegment(
                  value: _TrackingMode.account,
                  label: Text('Link ke Rekening'),
                  icon: Icon(Icons.account_balance_wallet_outlined),
                ),
                ButtonSegment(
                  value: _TrackingMode.manual,
                  label: Text('Saldo Manual'),
                  icon: Icon(Icons.edit_outlined),
                ),
              ],
              selected: {_trackingMode},
              onSelectionChanged: (selection) {
                setState(() => _trackingMode = selection.first);
              },
            ),
            const SizedBox(height: 16),
            if (_trackingMode == _TrackingMode.account)
              AsyncValueWidget<List<Account>>(
                value: accountsAsync,
                onRetry: () => ref.invalidate(accountsListProvider),
                data: (accounts) {
                  if (accounts.isEmpty) {
                    return const Text(
                      'Belum ada rekening aktif. Buat rekening terlebih '
                      'dahulu atau gunakan saldo manual.',
                    );
                  }

                  return FormBuilderDropdown<String>(
                    name: 'accountId',
                    decoration: const InputDecoration(
                      labelText: 'Rekening',
                      border: OutlineInputBorder(),
                    ),
                    items: accounts
                        .map(
                          (account) => DropdownMenuItem(
                            value: account.id,
                            child: Text(
                              '${account.nama} (${formatRupiah(account.saldoCache)})',
                            ),
                          ),
                        )
                        .toList(),
                    validator: FormBuilderValidators.required(),
                  );
                },
              )
            else
              FormBuilderTextField(
                name: 'saldoManual',
                decoration: const InputDecoration(
                  labelText: 'Saldo Saat Ini',
                  prefixText: 'Rp ',
                  border: OutlineInputBorder(),
                  helperText: 'Saldo manual yang sudah terkumpul untuk goal ini',
                ),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
            if (_errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                _errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isLoading ? null : _submit,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(widget.isEditMode ? 'Simpan' : 'Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
