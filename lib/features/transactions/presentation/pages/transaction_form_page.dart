import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';
import '../../../assets/data/models/fixed_asset_holding.dart';
import '../../../assets/data/models/liquid_asset_holding.dart';
import '../../../assets/presentation/providers/fixed_asset_holdings_provider.dart';
import '../../../assets/presentation/providers/liquid_asset_holdings_provider.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../debts_receivables/data/models/debt.dart';
import '../../../debts_receivables/data/models/receivable.dart';
import '../../../debts_receivables/presentation/providers/debts_list_provider.dart';
import '../../../debts_receivables/presentation/providers/receivables_list_provider.dart';
import '../../data/models/transaction.dart';
import '../../data/transactions_repository.dart';
import '../providers/transactions_list_provider.dart';

class TransactionFormPage extends ConsumerStatefulWidget {
  const TransactionFormPage({
    super.key,
    this.type = TransactionType.pengeluaran,
    this.transactionId,
    this.transaction,
    this.relatedDebtId,
    this.relatedReceivableId,
    this.prefilledNamaAset,
  });

  final TransactionType type;
  final String? transactionId;
  final Transaction? transaction;
  final String? relatedDebtId;
  final String? relatedReceivableId;
  final String? prefilledNamaAset;

  bool get isEditMode => transactionId != null || transaction != null;

  @override
  ConsumerState<TransactionFormPage> createState() =>
      _TransactionFormPageState();
}

class _TransactionFormPageState extends ConsumerState<TransactionFormPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;
  String? _errorMessage;
  late TransactionType _type;
  double? _matchedHpp;
  double? _matchedHoldingJumlah;
  double? _estimatedPl;

  @override
  void initState() {
    super.initState();
    _type = widget.transaction?.type ?? widget.type;
    if (widget.prefilledNamaAset != null && widget.prefilledNamaAset!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _onAssetFieldChanged();
      });
    }
  }

  void _onAssetFieldChanged() {
    if (!_type.needsAssetEntity) {
      return;
    }

    final formState = _formKey.currentState;
    if (formState == null) {
      return;
    }

    final namaAset = (formState.fields['namaAset']?.value as String?)?.trim();
    final jumlahStr = formState.fields['jumlah']?.value as String?;
    final hargaStr = formState.fields['hargaSatuan']?.value as String?;

    double? hpp;
    double? maxJumlah;
    if (namaAset != null && namaAset.isNotEmpty) {
      if (_type.isLiquidAssetType) {
        final holdings =
            ref.read(liquidAssetHoldingsProvider).value ?? const [];
        final allHoldings =
            ref.read(allLiquidAssetHoldingsProvider).value ?? const [];
        hpp = _lookupHpp(namaAset, holdings, allHoldings);
        maxJumlah = _lookupJumlah(namaAset, holdings);
      } else if (_type.isFixedAssetType) {
        final holdings =
            ref.read(fixedAssetHoldingsProvider).value ?? const [];
        final allHoldings =
            ref.read(allFixedAssetHoldingsProvider).value ?? const [];
        hpp = _lookupHppFixed(namaAset, holdings, allHoldings);
        maxJumlah = _lookupJumlahFixed(namaAset, holdings);
      }
    }

    double? estimatedPl;
    if (_type.isAssetSellType && hpp != null) {
      final jumlah = double.tryParse(jumlahStr ?? '');
      final hargaSatuan = double.tryParse(hargaStr ?? '');
      if (jumlah != null && hargaSatuan != null) {
        estimatedPl = (hargaSatuan - hpp) * jumlah;
      }
    }

    setState(() {
      _matchedHpp = hpp;
      _matchedHoldingJumlah = maxJumlah;
      _estimatedPl = estimatedPl;
    });
  }

  double? _lookupHpp(
    String namaAset,
    List<LiquidAssetHolding> active,
    List<LiquidAssetHolding> all,
  ) {
    final normalized = namaAset.toLowerCase();
    for (final holding in active) {
      if (holding.namaAset.toLowerCase() == normalized) {
        return holding.hargaBeliRataRata;
      }
    }
    for (final holding in all) {
      if (holding.namaAset.toLowerCase() == normalized && holding.jumlah > 0) {
        return holding.hargaBeliRataRata;
      }
    }
    return null;
  }

  double? _lookupJumlah(String namaAset, List<LiquidAssetHolding> active) {
    final normalized = namaAset.toLowerCase();
    for (final holding in active) {
      if (holding.namaAset.toLowerCase() == normalized) {
        return holding.jumlah;
      }
    }
    return null;
  }

  double? _lookupHppFixed(
    String namaAset,
    List<FixedAssetHolding> active,
    List<FixedAssetHolding> all,
  ) {
    final normalized = namaAset.toLowerCase();
    for (final holding in active) {
      if (holding.namaAset.toLowerCase() == normalized) {
        return holding.hargaBeliRataRata;
      }
    }
    for (final holding in all) {
      if (holding.namaAset.toLowerCase() == normalized && holding.jumlah > 0) {
        return holding.hargaBeliRataRata;
      }
    }
    return null;
  }

  double? _lookupJumlahFixed(String namaAset, List<FixedAssetHolding> active) {
    final normalized = namaAset.toLowerCase();
    for (final holding in active) {
      if (holding.namaAset.toLowerCase() == normalized) {
        return holding.jumlah;
      }
    }
    return null;
  }

  String get _pageTitle {
    if (widget.isEditMode) {
      return 'Edit ${_type.label}';
    }
    return 'Tambah ${_type.label}';
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    final values = _formKey.currentState!.value;
    final tanggal = values['tanggal'] as DateTime;
    final accountId = values['accountId'] as String;
    final kategori = (values['kategori'] as String?)?.trim();
    final rincian = (values['rincian'] as String?)?.trim();
    final toAccountId = values['toAccountId'] as String?;
    final pemberiUtang = (values['pemberiUtang'] as String?)?.trim();
    final debtTipe = values['debtTipe'] as String?;
    final peminjam = (values['peminjam'] as String?)?.trim();
    final relatedDebtId = values['relatedDebtId'] as String?;
    final relatedReceivableId = values['relatedReceivableId'] as String?;
    final namaAset = (values['namaAset'] as String?)?.trim();
    final jumlah = double.tryParse(values['jumlah'] as String? ?? '');
    final hargaSatuan =
        double.tryParse(values['hargaSatuan'] as String? ?? '');
    final nominal = int.tryParse(values['nominal'] as String? ?? '');

    if (_type == TransactionType.transfer && toAccountId == accountId) {
      setState(
        () => _errorMessage =
            'Rekening tujuan harus berbeda dari rekening asal.',
      );
      return;
    }

    if (_type.isAssetSellType &&
        _matchedHoldingJumlah != null &&
        jumlah != null &&
        jumlah > _matchedHoldingJumlah!) {
      setState(
        () => _errorMessage =
            'Jumlah melebihi holding (${_formatJumlah(_matchedHoldingJumlah!)} tersedia).',
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final repository = ref.read(transactionsRepositoryProvider);
      if (widget.isEditMode) {
        final id = widget.transactionId ?? widget.transaction!.id;
        await repository.updateTransaction(
          id: id,
          tanggal: tanggal,
          nominal: nominal,
          accountId: accountId,
          kategori: kategori?.isEmpty ?? true ? '' : kategori,
          rincian: rincian?.isEmpty ?? true ? '' : rincian,
          toAccountId:
              _type == TransactionType.transfer ? toAccountId : null,
        );
      } else {
        await repository.createTransaction(
          tanggal: tanggal,
          type: _type,
          nominal: _type.needsAssetEntity ? null : nominal,
          accountId: accountId,
          kategori: kategori?.isEmpty ?? true ? null : kategori,
          rincian: rincian?.isEmpty ?? true ? null : rincian,
          toAccountId:
              _type == TransactionType.transfer ? toAccountId : null,
          pemberiUtang: pemberiUtang,
          debtTipe: debtTipe,
          peminjam: peminjam,
          relatedDebtId: relatedDebtId,
          relatedReceivableId: relatedReceivableId,
          namaAset: namaAset,
          jumlah: jumlah,
          hargaSatuan: hargaSatuan,
        );
      }

      ref.invalidate(transactionsListProvider);
      ref.invalidate(wealthSummaryProvider);
      ref.invalidate(emergencyFundProvider);
      ref.invalidate(monthlyCashFlowProvider);
      ref.invalidate(accountsListProvider);
      if (_type.isDebtOrReceivableType) {
        ref.invalidate(debtsListProvider);
        ref.invalidate(receivablesListProvider);
        ref.invalidate(allActiveDebtsProvider);
      }
      if (_type.needsAssetEntity) {
        ref.invalidate(liquidAssetHoldingsProvider);
        ref.invalidate(fixedAssetHoldingsProvider);
        ref.invalidate(allLiquidAssetHoldingsProvider);
        ref.invalidate(allFixedAssetHoldingsProvider);
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
                ? 'Transaksi berhasil diperbarui'
                : 'Transaksi berhasil dicatat',
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

  String _formatJumlah(double jumlah) {
    if (jumlah == jumlah.roundToDouble()) {
      return jumlah.round().toString();
    }
    return jumlah.toString();
  }

  Map<String, dynamic> _initialValues(Transaction? transaction) {
    final tanggal = transaction != null
        ? DateTime.tryParse(transaction.tanggal) ?? DateTime.now()
        : DateTime.now();

    String? relatedDebtId;
    String? relatedReceivableId;
    if (transaction != null) {
      if (transaction.type == TransactionType.bayarUtang) {
        relatedDebtId = transaction.relatedEntityId;
      } else if (transaction.type == TransactionType.penerimaanPiutang) {
        relatedReceivableId = transaction.relatedEntityId;
      }
    } else {
      relatedDebtId = widget.relatedDebtId;
      relatedReceivableId = widget.relatedReceivableId;
    }

    return {
      'tanggal': tanggal,
      'kategori': transaction?.kategori ?? '',
      'rincian': transaction?.rincian ?? '',
      'accountId': transaction?.accountId,
      'toAccountId': transaction?.destinationAccountId,
      'pemberiUtang': '',
      'debtTipe': 'utang_biasa',
      'peminjam': '',
      'relatedDebtId': relatedDebtId,
      'relatedReceivableId': relatedReceivableId,
      'namaAset': widget.prefilledNamaAset ?? '',
      'jumlah': '',
      'hargaSatuan': '',
      'nominal': transaction == null ? '' : transaction.nominal.toString(),
    };
  }

  @override
  Widget build(BuildContext context) {
    if (widget.transactionId != null && widget.transaction == null) {
      final detailAsync = ref.watch(
        transactionDetailProvider(widget.transactionId!),
      );
      return Scaffold(
        appBar: AppBar(title: Text(_pageTitle)),
        body: AsyncValueWidget<Transaction>(
          value: detailAsync,
          onRetry: () => ref.invalidate(
            transactionDetailProvider(widget.transactionId!),
          ),
          data: (transaction) {
            if (_type != transaction.type) {
              _type = transaction.type;
            }
            return _buildForm(transaction);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(_pageTitle)),
      body: _buildForm(widget.transaction),
    );
  }

  Widget _buildForm(Transaction? transaction) {
    final accountsAsync = ref.watch(accountsListProvider);
    final categoriesAsync = ref.watch(transactionCategoriesProvider);

    final debtsAsync = _type.needsRelatedDebtDropdown
        ? ref.watch(allActiveDebtsProvider)
        : const AsyncValue<List<Debt>>.data([]);

    final receivablesAsync = _type.needsRelatedReceivableDropdown
        ? ref.watch(receivablesListProvider)
        : const AsyncValue<List<Receivable>>.data([]);

    final AsyncValue<List<LiquidAssetHolding>> liquidHoldingsAsync;
    final AsyncValue<List<FixedAssetHolding>> fixedHoldingsAsync;
    if (_type.isLiquidAssetType) {
      liquidHoldingsAsync = ref.watch(allLiquidAssetHoldingsProvider);
      fixedHoldingsAsync = const AsyncValue.data([]);
      ref.watch(liquidAssetHoldingsProvider);
    } else if (_type.isFixedAssetType) {
      liquidHoldingsAsync = const AsyncValue.data([]);
      fixedHoldingsAsync = ref.watch(allFixedAssetHoldingsProvider);
      ref.watch(fixedAssetHoldingsProvider);
    } else {
      liquidHoldingsAsync = const AsyncValue.data([]);
      fixedHoldingsAsync = const AsyncValue.data([]);
    }

    return SafeArea(
      child: AsyncValueWidget<List<Account>>(
        value: accountsAsync,
        onRetry: () => ref.invalidate(accountsListProvider),
        data: (accounts) {
          if (accounts.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'Tambahkan rekening terlebih dahulu sebelum mencatat transaksi.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (_type.needsRelatedDebtDropdown && debtsAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_type.needsRelatedReceivableDropdown &&
              receivablesAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_type.needsRelatedDebtDropdown && debtsAsync.hasError) {
            return Center(child: Text(debtsAsync.error.toString()));
          }
          if (_type.needsRelatedReceivableDropdown && receivablesAsync.hasError) {
            return Center(child: Text(receivablesAsync.error.toString()));
          }

          final debts = debtsAsync.value ?? [];
          final receivables = receivablesAsync.value ?? [];

          if (_type.needsRelatedDebtDropdown && debts.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'Tambahkan utang terlebih dahulu sebelum mencatat pembayaran.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          if (_type.needsRelatedReceivableDropdown && receivables.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'Tambahkan piutang terlebih dahulu sebelum mencatat penerimaan.',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          if (_type.isLiquidAssetType && liquidHoldingsAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_type.isFixedAssetType && fixedHoldingsAsync.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_type.isLiquidAssetType && liquidHoldingsAsync.hasError) {
            return Center(child: Text(liquidHoldingsAsync.error.toString()));
          }
          if (_type.isFixedAssetType && fixedHoldingsAsync.hasError) {
            return Center(child: Text(fixedHoldingsAsync.error.toString()));
          }

          final liquidHoldings = liquidHoldingsAsync.value ?? const [];
          final fixedHoldings = fixedHoldingsAsync.value ?? const [];
          final assetNameSuggestions = _type.isLiquidAssetType
              ? liquidHoldings.map((h) => h.namaAset).toSet().toList()
              : _type.isFixedAssetType
                  ? fixedHoldings.map((h) => h.namaAset).toSet().toList()
                  : const <String>[];

          final categorySuggestions = categoriesAsync.maybeWhen(
            data: (categories) => categories.forType(_type),
            orElse: () => const <String>[],
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: FormBuilder(
              key: _formKey,
              initialValue: _initialValues(transaction),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FormBuilderDateTimePicker(
                    name: 'tanggal',
                    inputType: InputType.date,
                    format: DateFormat('dd MMM yyyy', 'id_ID'),
                    decoration: const InputDecoration(
                      labelText: 'Tanggal',
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  if (_type.needsPemberiUtangField) ...[
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'pemberiUtang',
                      decoration: const InputDecoration(
                        labelText: 'Pemberi utang',
                        hintText: 'Bank BRI, Teman, dll.',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderDropdown<String>(
                      name: 'debtTipe',
                      decoration: const InputDecoration(
                        labelText: 'Tipe utang (opsional)',
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'utang_biasa',
                          child: Text('Utang biasa'),
                        ),
                        DropdownMenuItem(
                          value: 'kartu_kredit',
                          child: Text('Kartu kredit'),
                        ),
                      ],
                    ),
                  ],
                  if (_type.needsPeminjamField) ...[
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'peminjam',
                      decoration: const InputDecoration(
                        labelText: 'Peminjam',
                        hintText: 'Nama peminjam',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                  ],
                  if (_type.needsRelatedDebtDropdown) ...[
                    const SizedBox(height: 16),
                    FormBuilderDropdown<String>(
                      name: 'relatedDebtId',
                      decoration: const InputDecoration(
                        labelText: 'Utang yang dibayar',
                      ),
                      validator: FormBuilderValidators.required(),
                      items: debts
                          .map(
                            (debt) => DropdownMenuItem(
                              value: debt.id,
                              child: Text(
                                '${debt.pemberiUtang} — sisa ${formatRupiah(debt.sisaSaldo)}',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  if (_type.needsRelatedReceivableDropdown) ...[
                    const SizedBox(height: 16),
                    FormBuilderDropdown<String>(
                      name: 'relatedReceivableId',
                      decoration: const InputDecoration(
                        labelText: 'Piutang yang ditagih',
                      ),
                      validator: FormBuilderValidators.required(),
                      items: receivables
                          .map(
                            (receivable) => DropdownMenuItem(
                              value: receivable.id,
                              child: Text(
                                '${receivable.peminjam} — sisa ${formatRupiah(receivable.sisaSaldo)}',
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  if (!_type.isDebtOrReceivableType &&
                      !_type.needsAssetEntity &&
                      _type != TransactionType.transfer) ...[
                    const SizedBox(height: 16),
                    FormBuilderField<String>(
                      name: 'kategori',
                      builder: (field) {
                        final selectedValue = field.value ?? '';

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              key: ValueKey('kategori-${field.value}'),
                              initialValue: selectedValue,
                              decoration: const InputDecoration(
                                labelText: 'Kategori',
                                hintText: 'Makanan, Gaji, dll.',
                              ),
                              textInputAction: TextInputAction.next,
                              onChanged: field.didChange,
                            ),
                            if (categorySuggestions.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              RepaintBoundary(
                                key: const Key('category_suggestion_chips_capture'),
                                child: Wrap(
                                  key: const Key('category_suggestion_chips'),
                                  spacing: 8,
                                  runSpacing: 8,
                                  children:
                                      categorySuggestions.take(8).map((category) {
                                    final selected = selectedValue == category;
                                    return _CategorySuggestionChip(
                                      label: category,
                                      selected: selected,
                                      onTap: () => field.didChange(category),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ],
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'rincian',
                    decoration: const InputDecoration(
                      labelText: 'Rincian (opsional)',
                      hintText: 'Catatan tambahan',
                    ),
                    textInputAction: TextInputAction.next,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  FormBuilderDropdown<String>(
                    name: 'accountId',
                    decoration: InputDecoration(
                      labelText: _type == TransactionType.transfer
                          ? 'Rekening asal'
                          : 'Rekening',
                    ),
                    validator: FormBuilderValidators.required(),
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
                  ),
                  if (_type == TransactionType.transfer) ...[
                    const SizedBox(height: 16),
                    FormBuilderDropdown<String>(
                      name: 'toAccountId',
                      decoration: const InputDecoration(
                        labelText: 'Rekening tujuan',
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        (value) {
                          final fromId =
                              _formKey.currentState?.fields['accountId']?.value
                                  as String?;
                          if (value != null && value == fromId) {
                            return 'Rekening tujuan harus berbeda';
                          }
                          return null;
                        },
                      ]),
                      items: accounts
                          .map(
                            (account) => DropdownMenuItem(
                              value: account.id,
                              child: Text(account.nama),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                  if (_type.needsAssetEntity) ...[
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'namaAset',
                      decoration: const InputDecoration(
                        labelText: 'Nama aset',
                        hintText: 'Reksa Dana, Emas, Laptop, dll.',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => _onAssetFieldChanged(),
                      validator: FormBuilderValidators.required(),
                    ),
                    if (assetNameSuggestions.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: assetNameSuggestions.take(12).map((name) {
                          return ActionChip(
                            label: Text(name),
                            onPressed: () {
                              _formKey.currentState?.fields['namaAset']
                                  ?.didChange(name);
                              _onAssetFieldChanged();
                            },
                          );
                        }).toList(),
                      ),
                    ],
                    if (_matchedHpp != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        'HPP rata-rata saat ini: ${formatRupiah(_matchedHpp!.round())}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'jumlah',
                      decoration: InputDecoration(
                        labelText: 'Jumlah',
                        hintText: '0',
                        helperText: _type.isAssetSellType &&
                                _matchedHoldingJumlah != null
                            ? 'Tersedia: ${_formatJumlah(_matchedHoldingJumlah!)}'
                            : null,
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (_) => _onAssetFieldChanged(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0.000001),
                        (value) {
                          if (!_type.isAssetSellType ||
                              _matchedHoldingJumlah == null) {
                            return null;
                          }
                          final parsed = double.tryParse(value ?? '');
                          if (parsed == null) {
                            return null;
                          }
                          if (parsed > _matchedHoldingJumlah!) {
                            return 'Maksimal ${_formatJumlah(_matchedHoldingJumlah!)}';
                          }
                          return null;
                        },
                      ]),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: 'hargaSatuan',
                      style: AppTextStyles.money(
                        Theme.of(context).colorScheme.onSurface,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Harga satuan',
                        hintText: '0',
                        prefixText: 'Rp ',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        prefixStyle: AppTextStyles.money(
                          Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      textInputAction: TextInputAction.done,
                      onChanged: (_) => _onAssetFieldChanged(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                        FormBuilderValidators.min(0),
                      ]),
                    ),
                    if (_type.isAssetSellType && _estimatedPl != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: (_estimatedPl! >= 0
                                  ? Colors.green
                                  : Colors.red)
                              .withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Estimasi ${_estimatedPl! >= 0 ? 'untung' : 'rugi'}: '
                          '${formatRupiah(_estimatedPl!.abs().round())}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: _estimatedPl! >= 0
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ],
                  if (!_type.needsAssetEntity) ...[
                    const SizedBox(height: 16),
                    RepaintBoundary(
                      key: const Key('transaction_nominal_capture'),
                      child: FormBuilderTextField(
                        key: const Key('transaction_nominal_field'),
                        name: 'nominal',
                        style: AppTextStyles.money(
                          Theme.of(context).colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          labelText: 'Nominal',
                          hintText: '0',
                          prefixText: 'Rp ',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixStyle: AppTextStyles.money(
                            Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.integer(),
                          FormBuilderValidators.min(1),
                        ]),
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
                        : Text(widget.isEditMode ? 'Simpan' : 'Catat'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategorySuggestionChip extends StatelessWidget {
  const _CategorySuggestionChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.circular,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: context.semanticColors.brandSoft,
            borderRadius: AppRadius.circular,
            border: Border.all(
              color: selected
                  ? context.semanticColors.brand
                  : context.semanticColors.brand.withValues(alpha: 0.35),
            ),
          ),
          child: Text(
            label,
            style: AppTextStyles.bodySmall(
              selected ? context.semanticColors.brand : context.semanticColors.textPrimary,
            ).copyWith(
              fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
