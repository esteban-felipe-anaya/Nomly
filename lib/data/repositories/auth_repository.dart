import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../../core/storage/token_storage.dart';
import '../api/nomly_api.dart';
import '../models/user.dart';
import 'guard.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._api, this._tokens);

  final NomlyApi _api;
  final TokenStorage _tokens;

  Future<User> login(String email, String password) => guard(() async {
        final res =
            await _api.login({'email': email, 'password': password});
        await _tokens.write(res.token);
        return res.user;
      });

  Future<User> register(String name, String email, String password) =>
      guard(() async {
        final res = await _api.register(
            {'name': name, 'email': email, 'password': password});
        await _tokens.write(res.token);
        return res.user;
      });

  /// Returns the current user if a token is present, else null.
  Future<User?> currentUser() => guard(() async {
        final token = await _tokens.read();
        if (token == null || token.isEmpty) return null;
        final res = await _api.me();
        return res.user;
      });

  Future<void> logout() => _tokens.clear();
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) => AuthRepository(
      ref.watch(nomlyApiProvider),
      ref.watch(tokenStorageProvider),
    );
