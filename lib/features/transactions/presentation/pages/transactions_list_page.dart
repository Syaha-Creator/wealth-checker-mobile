import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../shared/utils/currency_formatter.dart';
import '../../../../shared/widgets/async_value_widget.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../accounts/data/models/account.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../data/models/transaction.dart';
import '../../data/transactions_repository.dart';
import '../providers/transactions_list_provider.dart';

class TransactionsListPage extends ConsumerStatefulWidget {
  const TransactionsListPage({super.key});

  @override
  ConsumerState<TransactionsListPage> createState() =>
      _TransactionsListPageState();
}

class _TransactionsListPageState extends ConsumerState<TransactionsListPage> {
  final _scrollController = ScrollController();
  TransactionsFilter _filter = const TransactionsFilter();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients || _isLoadingMore) {
      return;
    }
    final threshold = _scrollController.position.maxScrollExtent - 200;
    if (_scrollController.position.pixels >= threshold) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    final notifier = ref.read(transactionsListProvider(_filter).notifier);
    if (!notifier.hasMore || _isLoadingMore) {
      return;
    }
    setState(() => _isLoadingMore = true);
    await notifier.loadMore();
    if (mounted) {
      setState(() => _isLoadingMore = false);
    }
  }

  Future<void> _refresh() async {
    ref.invalidate(transactionsListProvider(_filter));
    await ref.read(transactionsListProvider(_filter).future);
  }

  void _updateFilter(TransactionsFilter filter) {
    setState(() => _filter = filter);
    ref.invalidate(transactionsListProvider(_filter));
  }

  Future<void> _confirmDelete(Transaction transaction) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus transaksi?'),
        content: Text(
          'Transaksi ${transaction.type.label} '
          '${formatRupiah(transaction.nominal)} akan dihapus permanen.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) {
      return;
    }

    try {
      await ref.read(transactionsRepositoryProvider).deleteTransaction(
            transaction.id,
          );
      ref.invalidate(transactionsListProvider);
      ref.invalidate(wealthSummaryProvider);
      ref.invalidate(emergencyFundProvider);
      ref.invalidate(monthlyCashFlowProvider);
      ref.invalidate(accountsListProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Transaksi berhasil dihapus')),
        );
      }
    } on ApiException catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message)),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Terjadi kesalahan. Silakan coba lagi.'),
          ),
        );
      }
    }
  }

  Future<void> _pickDateRange() async {
    final now = DateTime.now();
    final range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 1),
      initialDateRange: _filter.from != null && _filter.to != null
          ? DateTimeRange(start: _filter.from!, end: _filter.to!)
          : null,
      locale: const Locale('id'),
    );

    if (range == null) {
      return;
    }

    _updateFilter(
      _filter.copyWith(from: range.start, to: range.end),
    );
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsListProvider(_filter));
    final accountsAsync = ref.watch(accountsListProvider);
    final categoriesAsync = ref.watch(transactionCategoriesProvider);
    final hasMore =
        ref.read(transactionsListProvider(_filter).notifier).hasMore;

    return Scaffold(
      backgroundColor: context.semanticColors.background,
      appBar: AppBar(
        title: const Text('Transaksi'),
        backgroundColor: context.semanticColors.background,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.sm),
            child: Material(
              color: context.semanticColors.accentBlueSoft,
              borderRadius: AppRadius.circular,
              child: InkWell(
                onTap: () => context.push('/transactions/new?type=pengeluaran'),
                borderRadius: AppRadius.circular,
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.sm),
                  child: Icon(
                    Icons.add,
                    color: context.semanticColors.accentBlue,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Reset filter',
            onPressed: () => _updateFilter(const TransactionsFilter()),
            icon: const Icon(Icons.filter_alt_off_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          _FilterBar(
            filter: _filter,
            accounts: accountsAsync.value ?? const [],
            categories: categoriesAsync.maybeWhen(
              data: (value) {
                final merged = <String>{
                  ...value.pendapatan,
                  ...value.pengeluaran,
                }.toList();
                merged.sort();
                return merged;
              },
              orElse: () => const <String>[],
            ),
            onDateRangeTap: _pickDateRange,
            onKategoriChanged: (kategori) =>
                _updateFilter(_filter.copyWith(kategori: kategori)),
            onAccountChanged: (accountId) =>
                _updateFilter(_filter.copyWith(accountId: accountId)),
            onClearDateRange: () =>
                _updateFilter(_filter.copyWith(from: null, to: null)),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: AsyncValueWidget<List<Transaction>>(
                value: transactionsAsync,
                onRetry: () => ref.invalidate(transactionsListProvider(_filter)),
                data: (transactions) {
                  if (transactions.isEmpty) {
                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        SizedBox(height: 80),
                        EmptyStateWidget(
                          title: 'Belum ada transaksi',
                          message:
                              'Catat pendapatan, pengeluaran, atau transfer pertama untuk melihat riwayat di sini.',
                          icon: Icons.receipt_long_outlined,
                        ),
                      ],
                    );
                  }

                  return ListView.separated(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    itemCount: transactions.length +
                        ((_isLoadingMore ||
                                (hasMore &&
                                    transactions.length >=
                                        TransactionsList.pageSize))
                            ? 1
                            : 0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (context, index) {
                      if (index >= transactions.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSpacing.lg),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }

                      final transaction = transactions[index];
                      return _TransactionTile(
                        transaction: transaction,
                        accounts: accountsAsync.value ?? const [],
                        onTap: () => context.push(
                          '/transactions/${transaction.id}/edit',
                        ),
                        onDelete: () => _confirmDelete(transaction),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.filter,
    required this.accounts,
    required this.categories,
    required this.onDateRangeTap,
    required this.onKategoriChanged,
    required this.onAccountChanged,
    required this.onClearDateRange,
  });

  final TransactionsFilter filter;
  final List<Account> accounts;
  final List<String> categories;
  final VoidCallback onDateRangeTap;
  final ValueChanged<String?> onKategoriChanged;
  final ValueChanged<String?> onAccountChanged;
  final VoidCallback onClearDateRange;

  String _dateRangeLabel() {
    if (filter.from == null && filter.to == null) {
      return 'Semua tanggal';
    }
    final formatter = DateFormat('dd MMM yyyy', 'id_ID');
    if (filter.from != null && filter.to != null) {
      return '${formatter.format(filter.from!)} – ${formatter.format(filter.to!)}';
    }
    if (filter.from != null) {
      return 'Dari ${formatter.format(filter.from!)}';
    }
    return 'Sampai ${formatter.format(filter.to!)}';
  }

  @override
  Widget build(BuildContext context) {
    return AppCard.subtle(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onDateRangeTap,
                  icon: const Icon(Icons.date_range_outlined, size: 18),
                  label: Text(
                    _dateRangeLabel(),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (filter.from != null || filter.to != null) ...[
                const SizedBox(width: AppSpacing.sm),
                IconButton(
                  tooltip: 'Hapus filter tanggal',
                  onPressed: onClearDateRange,
                  icon: const Icon(Icons.close, size: 18),
                ),
              ],
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String?>(
                  key: ValueKey('kategori-${filter.kategori}'),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Kategori',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                  ),
                  initialValue: filter.kategori,
                  items: [
                    const DropdownMenuItem<String?>(
                      value: null,
                      child: Text('Semua kategori'),
                    ),
                    ...categories.map(
                      (category) => DropdownMenuItem<String?>(
                        value: category,
                        child: Text(category),
                      ),
                    ),
                  ],
                  onChanged: onKategoriChanged,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: DropdownButtonFormField<String?>(
                  key: ValueKey('account-${filter.accountId}'),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    labelText: 'Rekening',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: AppSpacing.sm,
                    ),
                  ),
                  initialValue: filter.accountId,
                  items: [
                    const DropdownMenuItem<String?>(
                      value: null,
                      child: Text('Semua rekening'),
                    ),
                    ...accounts.map(
                      (account) => DropdownMenuItem<String?>(
                        value: account.id,
                        child: Text(account.nama),
                      ),
                    ),
                  ],
                  onChanged: onAccountChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.transaction,
    required this.accounts,
    required this.onTap,
    required this.onDelete,
  });

  final Transaction transaction;
  final List<Account> accounts;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  (Color soft, Color accent) _avatarColors(AppSemanticColors colors) {
    return switch (transaction.type) {
      TransactionType.pendapatan => (
          colors.brandSoft,
          colors.brand,
        ),
      TransactionType.pengeluaran => (
          colors.backgroundSubtle,
          colors.textSecondary,
        ),
      TransactionType.transfer => (
          colors.accentBlueSoft,
          colors.accentBlue,
        ),
      _ => (colors.backgroundSubtle, colors.textMuted),
    };
  }

  String _monogram() {
    final label = transaction.kategori?.trim().isNotEmpty == true
        ? transaction.kategori!.trim()
        : transaction.type.label;
    return label[0].toUpperCase();
  }

  String _accountLabel() {
    final source = accounts
        .where((account) => account.id == transaction.accountId)
        .map((account) => account.nama)
        .firstOrNull;
    if (transaction.type == TransactionType.transfer) {
      final destination = accounts
          .where(
            (account) => account.id == transaction.destinationAccountId,
          )
          .map((account) => account.nama)
          .firstOrNull;
      return '${source ?? 'Rekening'} → ${destination ?? 'Rekening'}';
    }
    return source ?? 'Rekening';
  }

  String _formatTanggal() {
    final date = DateTime.tryParse(transaction.tanggal);
    if (date == null) {
      return transaction.tanggal;
    }
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  String _amountLabel() {
    final amount = formatRupiah(transaction.nominal);
    return switch (transaction.type) {
      TransactionType.pendapatan => '▲ +$amount',
      TransactionType.pengeluaran => '▼ -$amount',
      TransactionType.transfer => '-$amount',
      _ => amount,
    };
  }

  Color _amountColor(AppSemanticColors colors) {
    return switch (transaction.type) {
      TransactionType.pendapatan => colors.brand,
      TransactionType.pengeluaran => colors.textSecondary,
      TransactionType.transfer => colors.textSecondary,
      _ => colors.textPrimary,
    };
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.semanticColors;
    final (softColor, accentColor) = _avatarColors(colors);
    final title = transaction.kategori?.isNotEmpty == true
        ? transaction.kategori!
        : transaction.type.label;

    return Dismissible(
      key: ValueKey(transaction.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        onDelete();
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppSpacing.xl),
        decoration: BoxDecoration(
          color: context.semanticColors.dangerSoft,
          borderRadius: AppRadius.circular,
        ),
        child: Icon(
          Icons.delete_outline,
          color: context.semanticColors.danger,
        ),
      ),
      child: AppCard.subtle(
        onTap: onTap,
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: softColor,
                borderRadius: AppRadius.circular,
              ),
              child: SizedBox(
                width: 44,
                height: 44,
                child: Center(
                  child: Text(
                    _monogram(),
                    style: AppTextStyles.headingSmall(accentColor),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.headingSmall(context.semanticColors.textPrimary),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    [
                      _formatTanggal(),
                      _accountLabel(),
                      if (transaction.rincian?.isNotEmpty == true)
                        transaction.rincian!,
                    ].join(' · '),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bodySmall(context.semanticColors.textMuted),
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              _amountLabel(),
              style: AppTextStyles.money(_amountColor(colors)),
            ),
          ],
        ),
      ),
    );
  }
}
