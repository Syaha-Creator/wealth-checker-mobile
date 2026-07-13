import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/api_exception.dart';
import '../../data/models/account.dart';
import '../providers/accounts_list_provider.dart';

class AccountFormPage extends ConsumerStatefulWidget {
  const AccountFormPage({super.key, this.account});

  final Account? account;

  bool get isEditMode => account != null;

  @override
  ConsumerState<AccountFormPage> createState() => _AccountFormPageState();
}

class _AccountFormPageState extends ConsumerState<AccountFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final nama = (values['nama'] as String).trim();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (widget.isEditMode) {
        await ref.read(accountsListProvider.notifier).updateAccount(
              id: widget.account!.id,
              nama: nama,
              isActive: values['isActive'] as bool? ?? true,
            );
      } else {
        final saldoAwal = double.parse(values['saldoAwal'] as String);
        await ref.read(accountsListProvider.notifier).addAccount(
              nama: nama,
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
                ? 'Rekening berhasil diperbarui'
                : 'Rekening berhasil ditambahkan',
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
    final account = widget.account;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditMode ? 'Edit Rekening' : 'Tambah Rekening'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: FormBuilder(
            key: _formKey,
            initialValue: {
              'nama': account?.nama ?? '',
              'saldoAwal': account == null ? '' : account.saldoCache.toString(),
              'isActive': account?.isActive ?? true,
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormBuilderTextField(
                  name: 'nama',
                  decoration: const InputDecoration(
                    labelText: 'Nama rekening',
                    hintText: 'BCA Tabungan',
                  ),
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                if (!widget.isEditMode) ...[
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'saldoAwal',
                    decoration: const InputDecoration(
                      labelText: 'Saldo awal',
                      hintText: '0',
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.min(0),
                    ]),
                  ),
                ],
                if (widget.isEditMode) ...[
                  const SizedBox(height: 16),
                  FormBuilderSwitch(
                    name: 'isActive',
                    title: const Text('Rekening aktif'),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
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
