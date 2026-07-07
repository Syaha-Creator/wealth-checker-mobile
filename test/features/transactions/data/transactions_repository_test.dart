import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/features/transactions/data/models/transaction.dart';
import 'package:wealth_checker_mobile/features/transactions/data/transactions_repository.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
    })? onPost,
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
  })  : _onPost = onPost,
        _onGet = onGet;

  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  })? _onPost;
  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;

  @override
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onPost!(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<Response<T>> get<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onGet!(
      path,
      queryParameters: queryParameters?.cast<String, dynamic>(),
    );
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Map<String, dynamic> _transactionResponse({
  required String type,
  String? toAccountId,
}) {
  return {
    'id': 'tx-1',
    'userId': 'user-1',
    'tanggal': '2026-07-01',
    'type': type,
    'kategori': 'Makanan',
    'rincian': 'Catatan',
    'accountId': 'acc-1',
    'relatedEntityId': toAccountId,
    'toAccountId': ?toAccountId,
    'nominal': '50000',
    'createdAt': '2026-07-01T00:00:00.000Z',
  };
}

void main() {
  group('TransactionsRepository.getTransactions', () {
    test('sends from, to, kategori, and accountId as query params', () async {
      Map<String, dynamic>? capturedQuery;
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/transactions');
          capturedQuery = Map<String, dynamic>.from(queryParameters!);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [],
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.getTransactions(
        from: DateTime(2026, 7, 1),
        to: DateTime(2026, 7, 31),
        kategori: 'Makanan',
        accountId: 'acc-1',
        limit: 25,
        offset: 50,
      );

      expect(capturedQuery, {
        'limit': 25,
        'offset': 50,
        'from': '2026-07-01',
        'to': '2026-07-31',
        'kategori': 'Makanan',
        'accountId': 'acc-1',
      });
    });
  });

  group('TransactionsRepository.createTransaction', () {
    test('pendapatan sends single accountId without toAccountId', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          expect(path, '/api/transactions');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'pendapatan'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.pendapatan,
        nominal: 50000,
        accountId: 'acc-1',
        kategori: 'Gaji',
        rincian: 'Gaji bulan Juli',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'pendapatan',
        'nominal': 50000,
        'accountId': 'acc-1',
        'kategori': 'Gaji',
        'rincian': 'Gaji bulan Juli',
      });
      expect(capturedBody!.containsKey('toAccountId'), isFalse);
    });

    test('pengeluaran sends single accountId without toAccountId', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'pengeluaran'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.pengeluaran,
        nominal: 25000,
        accountId: 'acc-1',
        kategori: 'Makanan',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'pengeluaran',
        'nominal': 25000,
        'accountId': 'acc-1',
        'kategori': 'Makanan',
      });
      expect(capturedBody!.containsKey('toAccountId'), isFalse);
    });

    test('transfer includes toAccountId in request body', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'transfer', toAccountId: 'acc-2'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      final transaction = await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.transfer,
        nominal: 100000,
        accountId: 'acc-1',
        toAccountId: 'acc-2',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'transfer',
        'nominal': 100000,
        'accountId': 'acc-1',
        'toAccountId': 'acc-2',
      });
      expect(transaction.type, TransactionType.transfer);
      expect(transaction.destinationAccountId, 'acc-2');
    });

    test('pinjaman_utang sends pemberiUtang and optional debtTipe', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'pinjaman_utang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.pinjamanUtang,
        nominal: 5000000,
        accountId: 'acc-1',
        pemberiUtang: 'Bank BRI',
        debtTipe: 'utang_biasa',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'pinjaman_utang',
        'nominal': 5000000,
        'accountId': 'acc-1',
        'pemberiUtang': 'Bank BRI',
        'debtTipe': 'utang_biasa',
      });
      expect(capturedBody!.containsKey('relatedEntityId'), isFalse);
      expect(capturedBody!.containsKey('relatedDebtId'), isFalse);
    });

    test('pemberian_piutang sends peminjam', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'pemberian_piutang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.pemberianPiutang,
        nominal: 500000,
        accountId: 'acc-1',
        peminjam: 'Budi',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'pemberian_piutang',
        'nominal': 500000,
        'accountId': 'acc-1',
        'peminjam': 'Budi',
      });
      expect(capturedBody!.containsKey('relatedEntityId'), isFalse);
    });

    test('bayar_utang sends relatedDebtId', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'bayar_utang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.bayarUtang,
        nominal: 1000000,
        accountId: 'acc-1',
        relatedDebtId: 'debt-1',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'bayar_utang',
        'nominal': 1000000,
        'accountId': 'acc-1',
        'relatedDebtId': 'debt-1',
      });
      expect(capturedBody!.containsKey('relatedEntityId'), isFalse);
    });

    test('penerimaan_piutang sends relatedReceivableId', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'penerimaan_piutang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.penerimaanPiutang,
        nominal: 200000,
        accountId: 'acc-1',
        relatedReceivableId: 'recv-1',
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'penerimaan_piutang',
        'nominal': 200000,
        'accountId': 'acc-1',
        'relatedReceivableId': 'recv-1',
      });
      expect(capturedBody!.containsKey('relatedEntityId'), isFalse);
    });

    test('beli_investasi sends namaAset, jumlah, hargaSatuan without nominal',
        () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'beli_investasi'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.beliInvestasi,
        accountId: 'acc-1',
        namaAset: 'Reksa Dana',
        jumlah: 10,
        hargaSatuan: 15000,
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'beli_investasi',
        'accountId': 'acc-1',
        'namaAset': 'Reksa Dana',
        'jumlah': 10,
        'hargaSatuan': 15000,
      });
      expect(capturedBody!.containsKey('nominal'), isFalse);
    });

    test('jual_investasi sends namaAset, jumlah, hargaSatuan without nominal',
        () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'jual_investasi'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.jualInvestasi,
        accountId: 'acc-1',
        namaAset: 'Reksa Dana',
        jumlah: 5,
        hargaSatuan: 20000,
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'jual_investasi',
        'accountId': 'acc-1',
        'namaAset': 'Reksa Dana',
        'jumlah': 5,
        'hargaSatuan': 20000,
      });
      expect(capturedBody!.containsKey('nominal'), isFalse);
    });

    test('beli_barang sends namaAset, jumlah, hargaSatuan without nominal',
        () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'beli_barang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.beliBarang,
        accountId: 'acc-1',
        namaAset: 'Laptop',
        jumlah: 1,
        hargaSatuan: 12000000,
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'beli_barang',
        'accountId': 'acc-1',
        'namaAset': 'Laptop',
        'jumlah': 1,
        'hargaSatuan': 12000000,
      });
      expect(capturedBody!.containsKey('nominal'), isFalse);
    });

    test('jual_barang sends namaAset, jumlah, hargaSatuan without nominal',
        () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _transactionResponse(type: 'jual_barang'),
          );
        },
      );

      final repository = TransactionsRepository(dio);
      await repository.createTransaction(
        tanggal: DateTime(2026, 7, 1),
        type: TransactionType.jualBarang,
        accountId: 'acc-1',
        namaAset: 'Laptop',
        jumlah: 1,
        hargaSatuan: 13000000,
      );

      expect(capturedBody, {
        'tanggal': '2026-07-01',
        'type': 'jual_barang',
        'accountId': 'acc-1',
        'namaAset': 'Laptop',
        'jumlah': 1,
        'hargaSatuan': 13000000,
      });
      expect(capturedBody!.containsKey('nominal'), isFalse);
    });

    test('throws ApiException on insufficient balance (422)', () async {
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          throw DioException(
            requestOptions: RequestOptions(path: path),
            response: Response<dynamic>(
              requestOptions: RequestOptions(path: path),
              statusCode: 422,
              data: {
                'error':
                    'Saldo tidak mencukupi. Saldo tersedia: Rp 500.000, dibutuhkan: Rp 1.000.000',
                'code': 'INSUFFICIENT_BALANCE',
              },
            ),
            type: DioExceptionType.badResponse,
          );
        },
      );

      final repository = TransactionsRepository(dio);

      expect(
        () => repository.createTransaction(
          tanggal: DateTime(2026, 7, 1),
          type: TransactionType.pengeluaran,
          nominal: 1000000,
          accountId: 'acc-1',
        ),
        throwsA(
          isA<ApiException>()
              .having((error) => error.statusCode, 'statusCode', 422)
              .having((error) => error.code, 'code', 'INSUFFICIENT_BALANCE')
              .having(
                (error) => error.message,
                'message',
                contains('Saldo tidak mencukupi'),
              ),
        ),
      );
    });
  });
}
