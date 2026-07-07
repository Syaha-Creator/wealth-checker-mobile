import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/debts_receivables/data/debts_repository.dart';
import 'package:wealth_checker_mobile/features/debts_receivables/data/models/debt.dart';

class _FakeDio implements Dio {
  _FakeDio({
    Future<Response<dynamic>> Function(
      String path, {
      Map<String, dynamic>? queryParameters,
    })? onGet,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
      Map<String, dynamic>? queryParameters,
    })? onPost,
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
    })? onPatch,
    Future<Response<dynamic>> Function(String path)? onDelete,
  })  : _onGet = onGet,
        _onPost = onPost,
        _onPatch = onPatch,
        _onDelete = onDelete;

  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  })? _onPost;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
  })? _onPatch;
  final Future<Response<dynamic>> Function(String path)? _onDelete;

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
  Future<Response<T>> post<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onPost!(path, data: data);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<Response<T>> patch<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final response = await _onPatch!(path, data: data);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    final response = await _onDelete!(path);
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _debtJson = {
  'id': 'debt-1',
  'userId': 'user-1',
  'pemberiUtang': 'Bank BRI',
  'tipe': 'utang_biasa',
  'saldoAwal': '10000000',
  'sisaSaldo': '8000000',
  'createdAt': '2026-07-01T00:00:00.000Z',
};

const _receivableJson = {
  'id': 'recv-1',
  'userId': 'user-1',
  'peminjam': 'Budi',
  'saldoAwal': '500000',
  'sisaSaldo': '500000',
  'createdAt': '2026-07-01T00:00:00.000Z',
};

void main() {
  group('DebtsRepository debts', () {
    test('getDebts returns parsed list', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/debts');
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [_debtJson],
          );
        },
      );

      final repository = DebtsRepository(dio);
      final debts = await repository.getDebts();

      expect(debts, hasLength(1));
      expect(debts.first.pemberiUtang, 'Bank BRI');
      expect(debts.first.sisaSaldo, 8000000);
    });

    test('createDebt posts utang_biasa body', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          expect(path, '/api/debts');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _debtJson,
          );
        },
      );

      final repository = DebtsRepository(dio);
      final debt = await repository.createDebt(
        pemberiUtang: 'Bank BRI',
        tipe: 'utang_biasa',
        saldoAwal: 10000000,
      );

      expect(capturedBody, {
        'pemberiUtang': 'Bank BRI',
        'tipe': 'utang_biasa',
        'saldoAwal': 10000000,
      });
      expect(debt.id, 'debt-1');
    });

    test('updateDebt patches creditor name', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPatch: (path, {data}) async {
          expect(path, '/api/debts/debt-1');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {..._debtJson, 'pemberiUtang': 'Bank BCA'},
          );
        },
      );

      final repository = DebtsRepository(dio);
      final debt = await repository.updateDebt(
        id: 'debt-1',
        pemberiUtang: 'Bank BCA',
      );

      expect(capturedBody, {'pemberiUtang': 'Bank BCA'});
      expect(debt.pemberiUtang, 'Bank BCA');
    });

    test('deleteDebt calls DELETE endpoint', () async {
      String? deletedPath;
      final dio = _FakeDio(
        onDelete: (path) async {
          deletedPath = path;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 204,
          );
        },
      );

      final repository = DebtsRepository(dio);
      await repository.deleteDebt('debt-1');

      expect(deletedPath, '/api/debts/debt-1');
    });
  });

  group('DebtsRepository receivables', () {
    test('getReceivables returns parsed list', () async {
      final dio = _FakeDio(
        onGet: (path, {queryParameters}) async {
          expect(path, '/api/debts/receivables');
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: [_receivableJson],
          );
        },
      );

      final repository = DebtsRepository(dio);
      final receivables = await repository.getReceivables();

      expect(receivables, hasLength(1));
      expect(receivables.first.peminjam, 'Budi');
    });

    test('createReceivable posts body', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPost: (path, {data, queryParameters}) async {
          expect(path, '/api/debts/receivables');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 201,
            data: _receivableJson,
          );
        },
      );

      final repository = DebtsRepository(dio);
      final receivable = await repository.createReceivable(
        peminjam: 'Budi',
        saldoAwal: 500000,
      );

      expect(capturedBody, {
        'peminjam': 'Budi',
        'saldoAwal': 500000,
      });
      expect(receivable.id, 'recv-1');
    });

    test('updateReceivable patches borrower name', () async {
      Map<String, dynamic>? capturedBody;
      final dio = _FakeDio(
        onPatch: (path, {data}) async {
          expect(path, '/api/debts/receivables/recv-1');
          capturedBody = Map<String, dynamic>.from(data! as Map);
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 200,
            data: {..._receivableJson, 'peminjam': 'Andi'},
          );
        },
      );

      final repository = DebtsRepository(dio);
      final receivable = await repository.updateReceivable(
        id: 'recv-1',
        peminjam: 'Andi',
      );

      expect(capturedBody, {'peminjam': 'Andi'});
      expect(receivable.peminjam, 'Andi');
    });

    test('deleteReceivable calls DELETE endpoint', () async {
      String? deletedPath;
      final dio = _FakeDio(
        onDelete: (path) async {
          deletedPath = path;
          return Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 204,
          );
        },
      );

      final repository = DebtsRepository(dio);
      await repository.deleteReceivable('recv-1');

      expect(deletedPath, '/api/debts/receivables/recv-1');
    });
  });

  group('Debt model', () {
    test('repaymentProgress calculates correctly', () {
      const debt = Debt(
        id: 'debt-1',
        userId: 'user-1',
        pemberiUtang: 'Bank BRI',
        tipe: DebtType.utangBiasa,
        saldoAwal: 10000000,
        sisaSaldo: 8000000,
        createdAt: '2026-07-01T00:00:00.000Z',
      );

      expect(debt.repaymentProgress, closeTo(0.2, 0.001));
    });
  });
}
