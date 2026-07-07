import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/transaction.dart';
import '../../data/models/transaction_categories.dart';
import '../../data/transactions_repository.dart';
import '../../../analytics/presentation/providers/analytics_providers.dart';
import '../../../dashboard/presentation/providers/dashboard_providers.dart';
import '../../../accounts/presentation/providers/accounts_list_provider.dart';

part 'transactions_list_provider.freezed.dart';
part 'transactions_list_provider.g.dart';

@freezed
abstract class TransactionsFilter with _$TransactionsFilter {
  const factory TransactionsFilter({
    DateTime? from,
    DateTime? to,
    String? kategori,
    String? accountId,
  }) = _TransactionsFilter;
}

@riverpod
class TransactionsList extends _$TransactionsList {
  static const pageSize = 50;

  int _offset = 0;
  bool _hasMore = true;
  final List<Transaction> _items = [];
  late TransactionsFilter _filter;

  bool get hasMore => _hasMore;

  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async {
    _filter = filter;
    _offset = 0;
    _hasMore = true;
    _items.clear();
    return _loadNextPage();
  }

  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) {
      return;
    }
    await _loadNextPage();
  }

  Future<void> refreshAfterMutation() async {
    ref.invalidateSelf();
    ref.invalidate(wealthSummaryProvider);
    ref.invalidate(emergencyFundProvider);
    ref.invalidate(monthlyCashFlowProvider);
    ref.invalidate(accountsListProvider);
  }

  Future<List<Transaction>> _loadNextPage() async {
    final page = await ref.read(transactionsRepositoryProvider).getTransactions(
          from: _filter.from,
          to: _filter.to,
          kategori: _filter.kategori,
          accountId: _filter.accountId,
          limit: pageSize,
          offset: _offset,
        );
    _items.addAll(page);
    _offset += page.length;
    _hasMore = page.length >= pageSize;
    state = AsyncData([..._items]);
    return state.value!;
  }
}

@riverpod
Future<TransactionCategories> transactionCategories(Ref ref) {
  return ref.watch(transactionsRepositoryProvider).getCategories();
}

@riverpod
Future<Transaction> transactionDetail(Ref ref, String id) {
  return ref.watch(transactionsRepositoryProvider).getTransaction(id);
}
