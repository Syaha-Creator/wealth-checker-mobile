import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_service.g.dart';

const _authTokenKey = 'auth_token';

class SecureStorageService {
  SecureStorageService({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  Future<void> saveToken(String token) =>
      _storage.write(key: _authTokenKey, value: token);

  Future<String?> readToken() => _storage.read(key: _authTokenKey);

  Future<void> deleteToken() => _storage.delete(key: _authTokenKey);
}

@Riverpod(keepAlive: true)
SecureStorageService secureStorage(Ref ref) {
  return SecureStorageService();
}
