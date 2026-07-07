import 'package:dio/dio.dart';

class ApiException implements Exception {
  const ApiException({
    required this.message,
    this.statusCode,
    this.code,
  });

  final int? statusCode;
  final String message;
  final String? code;

  factory ApiException.fromDioError(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final path = error.requestOptions.path;

    if (response == null) {
      if (_isConnectionIssue(error.type)) {
        return const ApiException(
          message:
              'Tidak dapat terhubung ke server. Periksa koneksi internet kamu.',
        );
      }

      return ApiException(
        statusCode: statusCode,
        message: _messageForStatusCode(statusCode, path),
      );
    }

    final data = response.data;
    String? code;

    if (data is Map<String, dynamic>) {
      code = data['code'] as String?;
      final apiMessage = _messageFromResponseData(data, statusCode, path);
      if (apiMessage != null) {
        return ApiException(
          statusCode: statusCode,
          message: apiMessage,
          code: code,
        );
      }
    } else if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      code = map['code']?.toString();
      final apiMessage = _messageFromResponseData(map, statusCode, path);
      if (apiMessage != null) {
        return ApiException(
          statusCode: statusCode,
          message: apiMessage,
          code: code,
        );
      }
    }

    return ApiException(
      statusCode: statusCode,
      message: _messageForStatusCode(statusCode, path),
      code: code,
    );
  }

  static bool _isConnectionIssue(DioExceptionType type) {
    return switch (type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.connectionError =>
        true,
      _ => false,
    };
  }

  static bool _isAuthSignInPath(String path) {
    return path.contains('/auth/sign-in');
  }

  static bool _isInternalDioMessage(String message) {
    return message.contains('RequestOptions') ||
        message.contains('validateStatus') ||
        message.contains('status code of');
  }

  static String? _messageFromResponseData(
    Map<String, dynamic> data,
    int? statusCode,
    String path,
  ) {
    final code = data['code']?.toString();
    if (code == 'INVALID_EMAIL_OR_PASSWORD' ||
        code == 'INVALID_CREDENTIALS' ||
        code == 'USER_NOT_FOUND') {
      return 'Email atau password salah.';
    }

    if (statusCode == 401 && _isAuthSignInPath(path)) {
      return 'Email atau password salah.';
    }

    final errorField = data['error'];
    if (errorField is String &&
        errorField.isNotEmpty &&
        !_isInternalDioMessage(errorField)) {
      return errorField;
    }

    final messageField = data['message'];
    if (messageField is String &&
        messageField.isNotEmpty &&
        !_isInternalDioMessage(messageField)) {
      if (statusCode == 401 && _isAuthSignInPath(path)) {
        return 'Email atau password salah.';
      }
      return messageField;
    }

    return null;
  }

  static String _messageForStatusCode(int? statusCode, String path) {
    switch (statusCode) {
      case 401:
        if (_isAuthSignInPath(path)) {
          return 'Email atau password salah.';
        }
        return 'Sesi berakhir, silakan masuk kembali.';
      case 404:
        return 'Data tidak ditemukan.';
      case 422:
        return 'Data yang dikirim tidak valid.';
      default:
        if (statusCode != null && statusCode >= 500) {
          return 'Terjadi kesalahan pada server. Coba lagi nanti.';
        }
        return 'Terjadi kesalahan pada permintaan. Coba lagi.';
    }
  }

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message, code: $code)';
}
