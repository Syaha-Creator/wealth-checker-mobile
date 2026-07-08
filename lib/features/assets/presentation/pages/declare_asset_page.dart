import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/widgets/auth_page_widgets.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/fixed_asset_holdings_provider.dart';
import '../providers/liquid_asset_holdings_provider.dart';

enum DeclareAssetKind { liquid, fixed }

class DeclareAssetPage extends ConsumerStatefulWidget {
  const DeclareAssetPage({super.key, required this.kind});

  final DeclareAssetKind kind;

  @override
  ConsumerState<DeclareAssetPage> createState() => _DeclareAssetPageState();
}

class _DeclareAssetPageState extends ConsumerState<DeclareAssetPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _jumlahController = TextEditingController();
  final _hargaController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  String get _title => widget.kind == DeclareAssetKind.liquid
      ? 'Sudah Dimiliki (Investasi)'
      : 'Sudah Dimiliki (Aset Tetap)';

  String get _subtitle =>
      'Catat aset yang sudah Anda miliki tanpa mengubah saldo rekening.';

  @override
  void dispose() {
    _namaController.dispose();
    _jumlahController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final namaAset = _namaController.text.trim();
    final jumlah = double.parse(_jumlahController.text.trim());
    final hargaBeliRataRata = double.parse(_hargaController.text.trim());

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (widget.kind == DeclareAssetKind.liquid) {
        await ref.read(liquidAssetHoldingsProvider.notifier).declareAsset(
              namaAset: namaAset,
              jumlah: jumlah,
              hargaBeliRataRata: hargaBeliRataRata,
            );
      } else {
        await ref.read(fixedAssetHoldingsProvider.notifier).declareAsset(
              namaAset: namaAset,
              jumlah: jumlah,
              hargaBeliRataRata: hargaBeliRataRata,
            );
      }

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aset berhasil dicatat')),
      );

      if (context.canPop()) {
        context.pop();
      } else {
        context.go('/home');
      }
    } on ApiException catch (error) {
      setState(() => _errorMessage = error.message);
    } catch (error) {
      setState(
        () => _errorMessage = 'Terjadi kesalahan. Silakan coba lagi.',
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String? _required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Wajib diisi';
    }
    return null;
  }

  String? _positiveNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Wajib diisi';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Harus berupa angka';
    }
    if (parsed <= 0) {
      return 'Harus lebih dari 0';
    }
    return null;
  }

  String? _nonNegativeNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Wajib diisi';
    }
    final parsed = double.tryParse(value.trim());
    if (parsed == null) {
      return 'Harus berupa angka';
    }
    if (parsed < 0) {
      return 'Tidak boleh negatif';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _subtitle,
                style: AppTextStyles.bodyMedium(
                  context.semanticColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Nama aset',
                      style: AppTextStyles.labelMedium(
                        context.semanticColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    TextFormField(
                      key: const Key('declare_nama_aset_field'),
                      controller: _namaController,
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(
                        context,
                        hintText: widget.kind == DeclareAssetKind.liquid
                            ? 'Reksa Dana, Emas, dll.'
                            : 'Laptop, Motor, dll.',
                      ),
                      validator: _required,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Jumlah',
                      style: AppTextStyles.labelMedium(
                        context.semanticColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    TextFormField(
                      key: const Key('declare_jumlah_field'),
                      controller: _jumlahController,
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(context),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      validator: _positiveNumber,
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Harga beli rata-rata',
                      style: AppTextStyles.labelMedium(
                        context.semanticColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    TextFormField(
                      key: const Key('declare_harga_field'),
                      controller: _hargaController,
                      style: authFieldTextStyle(context),
                      decoration: authInputDecoration(
                        context,
                        hintText: 'Per unit (Rp)',
                      ),
                      keyboardType: TextInputType.number,
                      validator: _nonNegativeNumber,
                    ),
                  ],
                ),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: AppSpacing.lg),
                AuthErrorBanner(message: _errorMessage!),
              ],
              const SizedBox(height: AppSpacing.xl),
              AuthPrimaryButton(
                key: const Key('declare_asset_submit_btn'),
                label: 'Simpan',
                isLoading: _isLoading,
                onPressed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
