import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for the auth token. Uses platform keychains where available
/// and falls back to the encrypted shared-prefs implementation elsewhere.
class TokenStorage {
  TokenStorage([FlutterSecureStorage? storage])
      : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;
  static const _key = 'nomly.auth.token';

  // In-memory cache so interceptors can read synchronously after warm-up.
  String? _cached;
  String? get cached => _cached;

  Future<String?> read() async => _cached ??= await _storage.read(key: _key);

  Future<void> write(String token) async {
    _cached = token;
    await _storage.write(key: _key, value: token);
  }

  Future<void> clear() async {
    _cached = null;
    await _storage.delete(key: _key);
  }
}
