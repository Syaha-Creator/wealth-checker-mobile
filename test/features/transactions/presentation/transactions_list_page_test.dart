import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction_categories.dart';
import 'package:wealth_checker_mobile/features/transactions/data/transactions_repository.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/pages/transactions_list_page.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/providers/transactions_list_provider.dart';

void main() {
  group('TransactionsListPage', () {
    testWidgets('renders transaction list on success', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          transactionsListOverride: _SuccessTransactionsList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Makanan'), findsOneWidget);
      expect(find.textContaining('Rp 50.000'), findsOneWidget);
      expect(find.text('Gaji'), findsOneWidget);
    });

    testWidgets('renders empty state when there are no transactions',
        (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          transactionsListOverride: _EmptyTransactionsList.new,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Belum ada transaksi'), findsOneWidget);
    });

    testWidgets('changing account filter requests server-side accountId filter',
        (tester) async {
      final repository = _RecordingTransactionsRepository();

      await tester.pumpWidget(
        _buildTestAppWithRepository(repository),
      );
      await tester.pumpAndSettle();

      expect(repository.calls, isNotEmpty);
      expect(repository.calls.last.accountId, isNull);

      await tester.tap(find.byType(DropdownButtonFormField<String?>).last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('BCA Tabungan').last);
      await tester.pumpAndSettle();

      expect(
        repository.calls.any((call) => call.accountId == 'acc-1'),
        isTrue,
      );
    });
  });
}

Widget _buildTestApp({
  required TransactionsList Function() transactionsListOverride,
}) {
  return ProviderScope(
    overrides: [
      accountsListProvider.overrideWith(_SuccessAccountsList.new),
      transactionCategoriesProvider.overrideWith(
        (_) async => const TransactionCategories(
          pengeluaran: ['Makanan', 'Transportasi'],
          pendapatan: ['Gaji'],
        ),
      ),
      transactionsListProvider.overrideWith(transactionsListOverride),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const TransactionsListPage(),
    ),
  );
}

Widget _buildTestAppWithRepository(_RecordingTransactionsRepository repository) {
  return ProviderScope(
    overrides: [
      accountsListProvider.overrideWith(_SuccessAccountsList.new),
      transactionCategoriesProvider.overrideWith(
        (_) async => const TransactionCategories(
          pengeluaran: ['Makanan', 'Transportasi'],
          pendapatan: ['Gaji'],
        ),
      ),
      transactionsRepositoryProvider.overrideWith((_) => repository),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: const TransactionsListPage(),
    ),
  );
}

const _sampleAccount = Account(
  id: 'acc-1',
  userId: 'user-1',
  nama: 'BCA Tabungan',
  saldoCache: 1500000,
  isActive: true,
  createdAt: '2026-07-01T00:00:00.000Z',
);

const _pengeluaran = Transaction(
  id: 'tx-1',
  userId: 'user-1',
  tanggal: '2026-07-01',
  type: TransactionType.pengeluaran,
  kategori: 'Makanan',
  rincian: 'Makan siang',
  accountId: 'acc-1',
  nominal: 50000,
  createdAt: '2026-07-01T00:00:00.000Z',
);

const _pendapatan = Transaction(
  id: 'tx-2',
  userId: 'user-1',
  tanggal: '2026-07-02',
  type: TransactionType.pendapatan,
  kategori: 'Gaji',
  accountId: 'acc-1',
  nominal: 5000000,
  createdAt: '2026-07-02T00:00:00.000Z',
);

class _SuccessAccountsList extends AccountsList {
  @override
  Future<List<Account>> build() async => const [_sampleAccount];
}

class _SuccessTransactionsList extends TransactionsList {
  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async {
    return const [_pengeluaran, _pendapatan];
  }

  @override
  Future<void> loadMore() async {}
}

class _EmptyTransactionsList extends TransactionsList {
  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async => [];

  @override
  Future<void> loadMore() async {}
}

class _GetTransactionsCall {
  const _GetTransactionsCall({
    required this.accountId,
    required this.kategori,
    required this.offset,
  });

  final String? accountId;
  final String? kategori;
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
        accountId: accountId,
        kategori: kategori,
        offset: offset,
      ),
    );

    if (accountId == 'acc-1') {
      return const [_pendapatan];
    }
    return const [_pengeluaran, _pendapatan];
  }
}

class _UnusedDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}
