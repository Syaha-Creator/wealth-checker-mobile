import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/network/api_exception.dart';
import '../../core/storage/secure_storage_service.dart';
import '../../features/auth/data/auth_repository.dart';

part 'auth_state_provider.g.dart';

enum AuthStatus {
  authenticated,
  unauthenticated,
}

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  Future<AuthStatus> build() async {
    final storage = ref.read(secureStorageProvider);
    final token = await storage.readToken();

    if (token == null || token.isEmpty) {
      return AuthStatus.unauthenticated;
    }

    try {
      final isValid = await ref.read(authRepositoryProvider).hasValidSession();
      if (isValid) {
        return AuthStatus.authenticated;
      }

      await storage.deleteToken();
      return AuthStatus.unauthenticated;
    } on ApiException catch (error) {
      if (error.statusCode == 401) {
        await storage.deleteToken();
      }
      return AuthStatus.unauthenticated;
    } catch (_) {
      await storage.deleteToken();
      return AuthStatus.unauthenticated;
    }
  }

  Future<void> setAuthenticated(String token) async {
    await ref.read(secureStorageProvider).saveToken(token);
    state = const AsyncValue.data(AuthStatus.authenticated);
  }

  Future<void> setUnauthenticated() async {
    await ref.read(secureStorageProvider).deleteToken();
    state = const AsyncValue.data(AuthStatus.unauthenticated);
  }
}
