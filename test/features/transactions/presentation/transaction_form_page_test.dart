import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/core/theme/app_theme.dart';
import 'package:wealth_checker_mobile/features/accounts/data/models/account.dart';
import 'package:wealth_checker_mobile/features/accounts/presentation/providers/accounts_list_provider.dart';
import 'package:wealth_checker_mobile/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/monthly_cash_flow.dart';
import 'package:wealth_checker_mobile/features/dashboard/data/models/wealth_summary.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction_categories.dart';
import 'package:wealth_checker_mobile/features/transactions/data/transactions_repository.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/pages/transaction_form_page.dart';
import 'package:wealth_checker_mobile/features/transactions/presentation/providers/transactions_list_provider.dart';

void main() {
  setUpAll(() async {
    await initializeDateFormatting('id_ID');
  });

  group('TransactionFormPage', () {
    testWidgets('shows validation errors when required fields are empty',
        (tester) async {
      final repository = _RecordingTransactionsRepository();
      await tester.pumpWidget(
        _buildTestApp(
          repository: repository,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Catat'));
      await tester.pumpAndSettle();

      expect(find.text('Catat'), findsOneWidget);
      expect(repository.createCalls, 0);
    });

    testWidgets('submits pengeluaran successfully', (tester) async {
      final repository = _RecordingTransactionsRepository();

      await tester.pumpWidget(
        _buildTestApp(repository: repository),
      );
      await tester.pumpAndSettle();

      final nominalField = find.byWidgetPredicate(
        (widget) =>
            widget is FormBuilderTextField &&
            widget.decoration.labelText == 'Nominal',
      );
      await tester.enterText(nominalField, '50000');
      await tester.pumpAndSettle();

      await tester.tap(
        find.byWidgetPredicate(
          (widget) =>
              widget is DropdownButtonFormField<String> ||
              widget.toString().contains('FormBuilderDropdown'),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('BCA Tabungan (Rp 1.500.000)').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Catat'));
      await tester.pumpAndSettle();

      expect(repository.createCalls, 1);
      expect(repository.lastCreateType, TransactionType.pengeluaran);
    });

    testWidgets('shows insufficient balance error from backend', (tester) async {
      final repository = _RecordingTransactionsRepository(
        onCreate: () {
          throw const ApiException(
            statusCode: 422,
            code: 'INSUFFICIENT_BALANCE',
            message:
                'Saldo tidak mencukupi. Saldo tersedia: Rp 500.000, dibutuhkan: Rp 1.000.000',
          );
        },
      );

      await tester.pumpWidget(
        _buildTestApp(repository: repository),
      );
      await tester.pumpAndSettle();

      final nominalField = find.byWidgetPredicate(
        (widget) =>
            widget is FormBuilderTextField &&
            widget.decoration.labelText == 'Nominal',
      );
      await tester.enterText(nominalField, '1000000');
      await tester.pumpAndSettle();

      await tester.tap(
        find.byWidgetPredicate(
          (widget) =>
              widget is DropdownButtonFormField<String> ||
              widget.toString().contains('FormBuilderDropdown'),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('BCA Tabungan (Rp 1.500.000)').last);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Catat'));
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Saldo tidak mencukupi'),
        findsOneWidget,
      );
      expect(repository.createCalls, 1);
    });
  });
}

Widget _buildTestApp({
  required _RecordingTransactionsRepository repository,
  TransactionType type = TransactionType.pengeluaran,
}) {
  return ProviderScope(
    overrides: [
      transactionsRepositoryProvider.overrideWith((_) => repository),
      accountsListProvider.overrideWith(_SuccessAccountsList.new),
      transactionCategoriesProvider.overrideWith(
        (_) async => const TransactionCategories(
          pengeluaran: ['Makanan', 'Transportasi'],
        ),
      ),
      wealthSummaryProvider.overrideWith((_) async => _sampleSummary),
      monthlyCashFlowProvider.overrideWith((_) async => _sampleCashFlow),
      transactionsListProvider(const TransactionsFilter())
          .overrideWith(_EmptyTransactionsList.new),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('id')],
      home: TransactionFormPage(type: type),
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

class _SuccessAccountsList extends AccountsList {
  @override
  Future<List<Account>> build() async => const [_sampleAccount];
}

class _EmptyTransactionsList extends TransactionsList {
  @override
  Future<List<Transaction>> build(TransactionsFilter filter) async => [];
}

class _RecordingTransactionsRepository extends TransactionsRepository {
  _RecordingTransactionsRepository({this.onCreate}) : super(_ThrowingDio());

  final void Function()? onCreate;
  int createCalls = 0;
  TransactionType? lastCreateType;

  @override
  Future<Transaction> createTransaction({
    required DateTime tanggal,
    required TransactionType type,
    required String accountId,
    int? nominal,
    String? kategori,
    String? rincian,
    String? toAccountId,
    String? pemberiUtang,
    String? debtTipe,
    String? peminjam,
    String? relatedDebtId,
    String? relatedReceivableId,
    String? namaAset,
    double? jumlah,
    double? hargaSatuan,
  }) async {
    createCalls++;
    lastCreateType = type;
    onCreate?.call();
    return Transaction(
      id: 'tx-new',
      userId: 'user-1',
      tanggal: '2026-07-01',
      type: type,
      accountId: accountId,
      toAccountId: toAccountId,
      nominal: nominal ?? 0,
      createdAt: '2026-07-01T00:00:00.000Z',
    );
  }
}

class _ThrowingDio implements Dio {
  @override
  dynamic noSuchMethod(Invocation invocation) => throw UnimplementedError();
}

const _sampleSummary = WealthSummary(
  userName: 'Jane Doe',
  userEmail: 'user@example.com',
  totalKas: 5000000,
  totalLiquidAssets: 15000000,
  totalFixedAssets: 30000000,
  totalReceivables: 500000,
  totalUtang: 8000000,
  totalAset: 50500000,
  kekayaanBersih: 42500000,
  wealthLevel: 2,
  wealthLevelName: 'Terlihat Kaya',
);

const _sampleCashFlow = MonthlyCashFlow(
  bulanIni: MonthSnapshot(
    bulan: '2026-07',
    pemasukan: 10000000,
    pengeluaran: 7500000,
    sisaUangBulanan: 2500000,
  ),
  bulanLalu: MonthSnapshot(
    bulan: '2026-06',
    pemasukan: 9500000,
    pengeluaran: 8000000,
    sisaUangBulanan: 1500000,
  ),
  rataRata3Bulan: RollingAverage(
    pemasukan: 9800000,
    pengeluaran: 7700000,
    sisaUangBulanan: 2100000,
  ),
  hidupTanpaGajiBulan: 6.5,
  usedProfileFallback: false,
);
