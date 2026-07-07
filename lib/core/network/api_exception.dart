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
    final data = response?.data;

    if (data is Map<String, dynamic>) {
      return ApiException(
        statusCode: statusCode,
        message: data['error'] as String? ??
            error.message ??
            'Terjadi kesalahan pada permintaan.',
        code: data['code'] as String?,
      );
    }

    if (data is Map) {
      final map = Map<String, dynamic>.from(data);
      return ApiException(
        statusCode: statusCode,
        message: map['error']?.toString() ??
            error.message ??
            'Terjadi kesalahan pada permintaan.',
        code: map['code']?.toString(),
      );
    }

    return ApiException(
      statusCode: statusCode,
      message: error.message ?? 'Terjadi kesalahan pada permintaan.',
    );
  }

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message, code: $code)';
}
