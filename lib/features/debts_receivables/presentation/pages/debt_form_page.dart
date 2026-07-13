import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../data/models/debt.dart';
import '../providers/debts_list_provider.dart';

class DebtFormPage extends ConsumerStatefulWidget {
  const DebtFormPage({super.key, this.debt});

  final Debt? debt;

  bool get isEditMode => debt != null;

  @override
  ConsumerState<DebtFormPage> createState() => _DebtFormPageState();
}

class _DebtFormPageState extends ConsumerState<DebtFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final pemberiUtang = (values['pemberiUtang'] as String).trim();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (widget.isEditMode) {
        await ref.read(debtsListProvider.notifier).updateDebt(
              id: widget.debt!.id,
              pemberiUtang: pemberiUtang,
            );
      } else {
        final saldoAwal = double.parse(values['saldoAwal'] as String);
        await ref.read(debtsListProvider.notifier).addDebt(
              pemberiUtang: pemberiUtang,
              saldoAwal: saldoAwal,
            );
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
                ? 'Utang berhasil diperbarui'
                : 'Utang berhasil ditambahkan',
          ),
        ),
      );
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
    final debt = widget.debt;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditMode ? 'Edit Utang' : 'Tambah Utang'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'pemberiUtang': debt?.pemberiUtang ?? '',
              'saldoAwal': debt == null ? '' : debt.saldoAwal.toString(),
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: 'pemberiUtang',
                  decoration: const InputDecoration(
                    labelText: 'Pemberi utang',
                    hintText: 'Bank BRI, Teman, dll.',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                if (!widget.isEditMode) ...[
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'saldoAwal',
                    decoration: const InputDecoration(
                      labelText: 'Saldo awal utang',
                      hintText: '0',
                      prefixText: 'Rp ',
                    ),
                    keyboardType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.min(0),
                    ]),
                  ),
                ],
                if (widget.isEditMode) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Sisa saldo diperbarui lewat transaksi pembayaran, '
                    'bukan dari form ini.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
                if (_errorMessage != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                ElevatedButton(
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
        ),
      ),
    );
  }
}
