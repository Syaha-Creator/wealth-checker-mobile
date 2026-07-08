import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_exception.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._dio);

  final Dio _dio;

  Future<String> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/sign-up/email',
        data: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      return _extractToken(response.data);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/api/auth/sign-in/email',
        data: {
          'email': email,
          'password': password,
        },
      );
      return _extractToken(response.data);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  Future<void> signOut() async {
    try {
      await _dio.post<void>('/api/auth/sign-out');
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  static const passwordResetRedirectTo =
      'https://wealth.velrox.cloud/reset-password';

  Future<void> requestPasswordReset(String email) async {
    try {
      await _dio.post<void>(
        '/api/auth/request-password-reset',
        data: {
          'email': email.trim(),
          'redirectTo': passwordResetRedirectTo,
        },
      );
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  /// Returns `true` when the current session has a valid user.
  Future<bool> hasValidSession() async {
    try {
      final response = await _dio.get<dynamic>('/api/auth/session');
      return _isSessionValid(response.data);
    } on DioException catch (error) {
      throw ApiException.fromDioError(error);
    }
  }

  String _extractToken(Map<String, dynamic>? data) {
    if (data == null) {
      throw const ApiException(message: 'Respons autentikasi tidak valid.');
    }

    final topLevelToken = data['token'];
    if (topLevelToken is String && topLevelToken.isNotEmpty) {
      return topLevelToken;
    }

    final session = data['session'];
    if (session is Map) {
      final sessionToken = session['token'];
      if (sessionToken is String && sessionToken.isNotEmpty) {
        return sessionToken;
      }
    }

    throw const ApiException(message: 'Token tidak ditemukan dalam respons.');
  }

  bool _isSessionValid(dynamic data) {
    if (data == null) {
      return false;
    }

    if (data is! Map) {
      return false;
    }

    final user = data['user'];
    return user != null && user is Map && user.isNotEmpty;
  }
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepository(ref.watch(apiClientProvider));
}
