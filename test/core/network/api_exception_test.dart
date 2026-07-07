import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wealth_checker_mobile/core/network/api_exception.dart';

void main() {
  group('ApiException.fromDioError', () {
    test('uses error and code from Map response', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 422,
          path: '/api/transactions',
          data: {
            'error': 'Saldo rekening tidak cukup.',
            'code': 'INSUFFICIENT_BALANCE',
          },
        ),
      );

      expect(exception.message, 'Saldo rekening tidak cukup.');
      expect(exception.code, 'INSUFFICIENT_BALANCE');
      expect(exception.statusCode, 422);
      expect(exception.message, isNot(contains('RequestOptions')));
    });

    test('maps Better Auth invalid credentials code to Indonesian message', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 401,
          path: '/api/auth/sign-in/email',
          data: {
            'code': 'INVALID_EMAIL_OR_PASSWORD',
            'message': 'Invalid email or password',
          },
        ),
      );

      expect(exception.message, 'Email atau password salah.');
      expect(exception.code, 'INVALID_EMAIL_OR_PASSWORD');
      expect(exception.message, isNot(contains('validateStatus')));
    });

    test('returns friendly 401 sign-in message when response.data is null', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 401,
          path: '/api/auth/sign-in/email',
          data: null,
        ),
      );

      expect(exception.message, 'Email atau password salah.');
      expect(exception.message, isNot(contains('RequestOptions')));
    });

    test('returns friendly 401 sign-in message when response.data is String', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 401,
          path: '/api/auth/sign-in/email',
          data: 'Unauthorized',
        ),
      );

      expect(exception.message, 'Email atau password salah.');
      expect(exception.message, isNot(contains('validateStatus')));
    });

    test('returns session expired message for non sign-in 401', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 401,
          path: '/api/accounts',
          data: 'Unauthorized',
        ),
      );

      expect(exception.message, 'Sesi berakhir, silakan masuk kembali.');
    });

    test('returns connection message for timeout without response', () {
      final exception = ApiException.fromDioError(
        DioException(
          requestOptions: RequestOptions(path: '/api/auth/sign-in/email'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(
        exception.message,
        'Tidak dapat terhubung ke server. Periksa koneksi internet kamu.',
      );
      expect(exception.statusCode, isNull);
    });

    test('returns connection message for connection error without response', () {
      final exception = ApiException.fromDioError(
        DioException(
          requestOptions: RequestOptions(path: '/api/dashboard'),
          type: DioExceptionType.connectionError,
        ),
      );

      expect(
        exception.message,
        'Tidak dapat terhubung ke server. Periksa koneksi internet kamu.',
      );
    });

    test('returns server error message for 500 responses', () {
      final exception = ApiException.fromDioError(
        _badResponse(
          statusCode: 500,
          path: '/api/analytics',
          data: '<html>Internal Server Error</html>',
        ),
      );

      expect(
        exception.message,
        'Terjadi kesalahan pada server. Coba lagi nanti.',
      );
    });

    test('never surfaces internal Dio exception text from error.message', () {
      final exception = ApiException.fromDioError(
        DioException(
          requestOptions: RequestOptions(path: '/api/auth/sign-in/email'),
          response: Response<dynamic>(
            requestOptions: RequestOptions(path: '/api/auth/sign-in/email'),
            statusCode: 401,
            data: null,
          ),
          type: DioExceptionType.badResponse,
          message:
              'This exception was thrown because the response has a status code of 401 and RequestOptions.validateStatus was configured to throw for this status code.',
        ),
      );

      expect(exception.message, 'Email atau password salah.');
      expect(exception.message, isNot(contains('RequestOptions')));
      expect(exception.message, isNot(contains('validateStatus')));
    });
  });
}

DioException _badResponse({
  required int statusCode,
  required String path,
  required dynamic data,
}) {
  return DioException(
    requestOptions: RequestOptions(path: path),
    response: Response<dynamic>(
      requestOptions: RequestOptions(path: path),
      statusCode: statusCode,
      data: data,
    ),
    type: DioExceptionType.badResponse,
    message:
        'This exception was thrown because the response has a status code of $statusCode and RequestOptions.validateStatus was configured to throw for this status code.',
  );
}
