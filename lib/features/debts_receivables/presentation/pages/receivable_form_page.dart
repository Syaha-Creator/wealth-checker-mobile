import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../data/models/receivable.dart';
import '../providers/receivables_list_provider.dart';

class ReceivableFormPage extends ConsumerStatefulWidget {
  const ReceivableFormPage({super.key, this.receivable});

  final Receivable? receivable;

  bool get isEditMode => receivable != null;

  @override
  ConsumerState<ReceivableFormPage> createState() =>
      _ReceivableFormPageState();
}

class _ReceivableFormPageState extends ConsumerState<ReceivableFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final peminjam = (values['peminjam'] as String).trim();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (widget.isEditMode) {
        await ref.read(receivablesListProvider.notifier).updateReceivable(
              id: widget.receivable!.id,
              peminjam: peminjam,
            );
      } else {
        final saldoAwal = double.parse(values['saldoAwal'] as String);
        await ref.read(receivablesListProvider.notifier).addReceivable(
              peminjam: peminjam,
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
                ? 'Piutang berhasil diperbarui'
                : 'Piutang berhasil ditambahkan',
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
    final receivable = widget.receivable;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditMode ? 'Edit Piutang' : 'Tambah Piutang'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'peminjam': receivable?.peminjam ?? '',
              'saldoAwal':
                  receivable == null ? '' : receivable.saldoAwal.toString(),
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: 'peminjam',
                  decoration: const InputDecoration(
                    labelText: 'Peminjam',
                    hintText: 'Nama peminjam',
                  ),
                  validator: FormBuilderValidators.required(),
                ),
                if (!widget.isEditMode) ...[
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'saldoAwal',
                    decoration: const InputDecoration(
                      labelText: 'Saldo awal piutang',
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
                    'Sisa saldo diperbarui lewat transaksi penerimaan, '
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
