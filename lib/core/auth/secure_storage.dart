import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Thin wrapper around [FlutterSecureStorage] that exposes a limited API.
class SecureStorage {
  SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<String?> read(String key) => _storage.read(key: key);

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> clear() => _storage.deleteAll();

  /// Get authentication token
  Future<String?> getToken() => read('auth_token');

  /// Save authentication token
  Future<void> saveToken(String token) => write('auth_token', token);

  /// Delete authentication token
  Future<void> deleteToken() => delete('auth_token');

  /// Get access token
  Future<String?> getAccessToken() => read('access_token');

  /// Save access token
  Future<void> saveAccessToken(String token) => write('access_token', token);

  /// Delete access token
  Future<void> deleteAccessToken() => delete('access_token');

  /// Get refresh token
  Future<String?> getRefreshToken() => read('refresh_token');

  /// Save refresh token
  Future<void> saveRefreshToken(String token) => write('refresh_token', token);

  /// Delete refresh token
  Future<void> deleteRefreshToken() => delete('refresh_token');
}
