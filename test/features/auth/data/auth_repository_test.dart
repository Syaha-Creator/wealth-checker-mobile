import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/features/auth/data/auth_repository.dart';

class _FakeDio implements Dio {
  _FakeDio(this._postHandler);

  final Future<Response<dynamic>> Function(
    String path, {
    Object? data,
  }) _postHandler;

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
    final response = await _postHandler(path, data: data);
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

void main() {
  test('signIn returns token from top-level response field', () async {
    final dio = _FakeDio((path, {data}) async {
      expect(path, '/api/auth/sign-in/email');
      expect(data, {
        'email': 'user@example.com',
        'password': 'password123',
      });
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {
          'token': 'session-token-abc',
          'user': {
            'id': 'user-1',
            'email': 'user@example.com',
            'name': 'Test User',
          },
        },
      );
    });

    final repository = AuthRepository(dio);

    final token = await repository.signIn(
      email: 'user@example.com',
      password: 'password123',
    );

    expect(token, 'session-token-abc');
  });

  test('signIn falls back to session.token when top-level token is absent',
      () async {
    final dio = _FakeDio((path, {data}) async {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {
          'user': {
            'id': 'user-1',
            'email': 'user@example.com',
            'name': 'Test User',
          },
          'session': {'token': 'nested-session-token'},
        },
      );
    });

    final repository = AuthRepository(dio);

    final token = await repository.signIn(
      email: 'user@example.com',
      password: 'password123',
    );

    expect(token, 'nested-session-token');
  });
}
