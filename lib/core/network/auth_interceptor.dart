import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/providers/active_household_provider.dart';
import '../../shared/providers/auth_state_provider.dart';
import '../storage/secure_storage_service.dart';

/// Required Origin header registered in the backend's trustedOrigins.
const kApiOrigin = 'app://wealth-checker-mobile';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._ref);

  final Ref _ref;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final storage = _ref.read(secureStorageProvider);
    final token = await storage.readToken();

    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Origin'] = kApiOrigin;

    final householdId = _ref.read(activeHouseholdIdProvider);
    if (householdId != null) {
      options.headers['X-Household-Id'] = householdId;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _ref.read(authStateProvider.notifier).setUnauthenticated();
    }
    handler.next(err);
  }
}
