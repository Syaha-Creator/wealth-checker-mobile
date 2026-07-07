import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/network/api_exception.dart';
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
      appBar: AppBar(
        title: const Text('Transaksi'),
        actions: [
          IconButton(
            tooltip: 'Reset filter',
            onPressed: () => _updateFilter(const TransactionsFilter()),
            icon: const Icon(Icons.filter_alt_off_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/transactions/new?type=pengeluaran'),
        child: const Icon(Icons.add),
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
                    padding: const EdgeInsets.all(16),
                    itemCount: transactions.length +
                        ((_isLoadingMore ||
                                (hasMore &&
                                    transactions.length >=
                                        TransactionsList.pageSize))
                            ? 1
                            : 0),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      if (index >= transactions.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
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
    return Material(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
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
                  const SizedBox(width: 8),
                  IconButton(
                    tooltip: 'Hapus filter tanggal',
                    onPressed: onClearDateRange,
                    icon: const Icon(Icons.close, size: 18),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
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
                        horizontal: 12,
                        vertical: 8,
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
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String?>(
                    key: ValueKey('account-${filter.accountId}'),
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: 'Rekening',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
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

  Color _typeColor(BuildContext context) {
    return switch (transaction.type) {
      TransactionType.pendapatan => Theme.of(context).colorScheme.primary,
      TransactionType.pengeluaran => Theme.of(context).colorScheme.error,
      TransactionType.transfer => Theme.of(context).colorScheme.tertiary,
      _ => Theme.of(context).colorScheme.onSurfaceVariant,
    };
  }

  IconData _typeIcon() {
    return switch (transaction.type) {
      TransactionType.pendapatan => Icons.arrow_downward_rounded,
      TransactionType.pengeluaran => Icons.arrow_upward_rounded,
      TransactionType.transfer => Icons.swap_horiz_rounded,
      _ => Icons.receipt_long_outlined,
    };
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

  @override
  Widget build(BuildContext context) {
    final color = _typeColor(context);

    return Dismissible(
      key: ValueKey(transaction.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        onDelete();
        return false;
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          Icons.delete_outline,
          color: Theme.of(context).colorScheme.onErrorContainer,
        ),
      ),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(_typeIcon(), color: color, size: 20),
          ),
          title: Text(
            transaction.kategori?.isNotEmpty == true
                ? transaction.kategori!
                : transaction.type.label,
          ),
          subtitle: Text(
            [
              _formatTanggal(),
              _accountLabel(),
              if (transaction.rincian?.isNotEmpty == true) transaction.rincian!,
            ].join(' · '),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Text(
            formatRupiah(transaction.nominal),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
          ),
        ),
      ),
    );
  }
}
