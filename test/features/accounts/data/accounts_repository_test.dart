import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
import 'package:wealth_checker_mobile/features/accounts/data/accounts_repository.dart';

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
    Future<Response<dynamic>> Function(
      String path, {
      Object? data,
    })? onPatch,
    Future<Response<dynamic>> Function(String path)? onDelete,
  })  : _onPost = onPost,
        _onGet = onGet,
        _onPatch = onPatch,
        _onDelete = onDelete;

  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  })? _onPost;
  final Future<Response<dynamic>> Function(
    String path, {
    Map<String, dynamic>? queryParameters,
  })? _onGet;
  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
  })? _onPatch;
  final Future<Response<dynamic>> Function(String path)? _onDelete;

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
    return _castResponse<T>(response);
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
    return _castResponse<T>(response);
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
    return _castResponse<T>(response);
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
    return _castResponse<T>(response);
  }

  Response<T> _castResponse<T>(Response<dynamic> response) {
    return Response<T>(
      requestOptions: response.requestOptions,
      data: response.data as T,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

const _accountJson = {
  'id': 'acc-1',
  'userId': 'user-1',
  'nama': 'BCA Tabungan',
  'saldoCache': '1500000',
  'isActive': true,
  'createdAt': '2026-07-01T00:00:00.000Z',
};

void main() {
  test('createAccount returns parsed account on success', () async {
    final dio = _FakeDio(
      onPost: (path, {data, queryParameters}) async {
        expect(path, '/api/accounts');
        expect(data, {
          'nama': 'BCA Tabungan',
          'saldoAwal': 1500000,
        });
        return Response<dynamic>(
          requestOptions: RequestOptions(path: path),
          statusCode: 201,
          data: _accountJson,
        );
      },
    );

    final repository = AccountsRepository(dio);
    final account = await repository.createAccount(
      nama: 'BCA Tabungan',
      saldoAwal: 1500000,
    );

    expect(account.id, 'acc-1');
    expect(account.nama, 'BCA Tabungan');
    expect(account.saldoCache, 1500000);
  });

  test('deleteAccount throws ApiException when backend responds 409', () async {
    final dio = _FakeDio(
      onDelete: (path) async {
        expect(path, '/api/accounts/acc-1');
        throw DioException(
          requestOptions: RequestOptions(path: path),
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: path),
            statusCode: 409,
            data: {'error': 'Rekening masih memiliki transaksi terkait'},
          ),
          type: DioExceptionType.badResponse,
        );
      },
    );

    final repository = AccountsRepository(dio);

    expect(
      () => repository.deleteAccount('acc-1'),
      throwsA(
        isA<ApiException>().having(
          (error) => error.statusCode,
          'statusCode',
          409,
        ),
      ),
    );
  });
}
