import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/data/transactions_repository.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/providers/transactions_list_provider.dart';

void main() {
  group('TransactionsList', () {
    test('forwards filter to repository on initial load', () async {
      final repository = _RecordingTransactionsRepository();
      final container = ProviderContainer(
        overrides: [
          transactionsRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      addTearDown(container.dispose);

      const filter = TransactionsFilter(
        from: null,
        to: null,
        kategori: 'Makanan',
        accountId: 'acc-1',
      );

      await container.read(transactionsListProvider(filter).future);

      expect(repository.calls, hasLength(1));
      expect(repository.calls.single.offset, 0);
      expect(repository.calls.single.kategori, 'Makanan');
      expect(repository.calls.single.accountId, 'acc-1');
    });

    test('loadMore requests next offset against server-filtered results', () async {
      final repository = _RecordingTransactionsRepository();
      final container = ProviderContainer(
        overrides: [
          transactionsRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      addTearDown(container.dispose);

      final filter = TransactionsFilter(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
        kategori: 'Makanan',
      );

      final notifier = container.read(transactionsListProvider(filter).notifier);
      final firstPage = await container.read(transactionsListProvider(filter).future);

      expect(firstPage, hasLength(TransactionsList.pageSize));
      expect(repository.calls.single.offset, 0);
      expect(repository.calls.single.from, DateTime(2026, 7, 1));
      expect(repository.calls.single.to, DateTime(2026, 7, 31));
      expect(repository.calls.single.kategori, 'Makanan');
      expect(notifier.hasMore, isTrue);

      await notifier.loadMore();

      expect(repository.calls, hasLength(2));
      expect(repository.calls.last.offset, TransactionsList.pageSize);
      expect(repository.calls.last.kategori, 'Makanan');
      expect(
        container.read(transactionsListProvider(filter)).value,
        hasLength(TransactionsList.pageSize + 10),
      );
      expect(notifier.hasMore, isFalse);
    });
  });
}

class _GetTransactionsCall {
  const _GetTransactionsCall({
    required this.from,
    required this.to,
    required this.kategori,
    required this.accountId,
    required this.limit,
    required this.offset,
  });

  final DateTime? from;
  final DateTime? to;
  final String? kategori;
  final String? accountId;
  final int limit;
  final int offset;
}

class _RecordingTransactionsRepository extends TransactionsRepository {
  _RecordingTransactionsRepository() : super(_UnusedDio());

  final calls = <_GetTransactionsCall>[];

  @override
  Future<List<Transaction>> getTransactions({
    DateTime? from,
    DateTime? to,
    String? kategori,
    String? accountId,
    int limit = 50,
    int offset = 0,
  }) async {
    calls.add(
      _GetTransactionsCall(
        from: from,
        to: to,
        kategori: kategori,
        accountId: accountId,
        limit: limit,
        offset: offset,
      ),
    );

    if (offset == 0) {
      return List.generate(
        limit,
        (index) => _transaction(id: 'tx-$index'),
      );
    }
    if (offset == TransactionsList.pageSize) {
      return List.generate(10, (index) => _transaction(id: 'tx-more-$index'));
    }
    return [];
  }
}

Transaction _transaction({required String id}) {
  return Transaction(
    id: id,
    userId: 'user-1',
    tanggal: '2026-07-01',
    type: TransactionType.pengeluaran,
    kategori: 'Makanan',
    accountId: 'acc-1',
    nominal: 50000,
    createdAt: '2026-07-01T00:00:00.000Z',
  );
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
