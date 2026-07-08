import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';
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
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw DioException(
        requestOptions: RequestOptions(path: path),
        response: response,
        type: DioExceptionType.badResponse,
        message:
            'This exception was thrown because the response has a status code of ${response.statusCode} and RequestOptions.validateStatus was configured to throw for this status code.',
      );
    }
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

  test('signIn surfaces friendly message for Better Auth 401 response', () async {
    final dio = _FakeDio((path, {data}) async {
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        statusCode: 401,
        data: {
          'code': 'INVALID_EMAIL_OR_PASSWORD',
          'message': 'Invalid email or password',
        },
      );
    });

    final repository = AuthRepository(dio);

    expect(
      () => repository.signIn(
        email: 'user@example.com',
        password: 'wrongpassword123',
      ),
      throwsA(
        isA<ApiException>()
            .having((error) => error.message, 'message', 'Email atau password salah.')
            .having((error) => error.statusCode, 'statusCode', 401),
      ),
    );
  });

  test('requestPasswordReset posts email and redirectTo', () async {
    final dio = _FakeDio((path, {data}) async {
      expect(path, '/api/auth/request-password-reset');
      expect(data, {
        'email': 'user@example.com',
        'redirectTo': AuthRepository.passwordResetRedirectTo,
      });
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: {'status': true},
      );
    });

    final repository = AuthRepository(dio);

    await repository.requestPasswordReset('user@example.com');
  });

  test('requestPasswordReset trims email before sending', () async {
    final dio = _FakeDio((path, {data}) async {
      expect(data, {
        'email': 'user@example.com',
        'redirectTo': AuthRepository.passwordResetRedirectTo,
      });
      return Response<dynamic>(
        requestOptions: RequestOptions(path: path),
        data: null,
      );
    });

    final repository = AuthRepository(dio);

    await repository.requestPasswordReset('  user@example.com  ');
  });
}
