import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../../core/storage/preferences.dart';
import '../../../data/models/user.dart';
import '../../../data/repositories/auth_repository.dart';

part 'auth_controller.g.dart';

enum AuthStatus { unknown, authenticated, guest, unauthenticated }

@immutable
class AuthState {
  const AuthState({this.status = AuthStatus.unknown, this.user});
  final AuthStatus status;
  final User? user;

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isGuest => status == AuthStatus.guest;
  bool get isKnown => status != AuthStatus.unknown;

  AuthState copyWith({AuthStatus? status, User? user}) =>
      AuthState(status: status ?? this.status, user: user ?? this.user);
}

/// Holds the session. Browsing is allowed as a guest; checkout is gated on
/// [isAuthenticated] (enforced by the router redirect).
@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  AuthRepository get _repo => ref.read(authRepositoryProvider);
  Preferences get _prefs => ref.read(preferencesProvider);

  @override
  AuthState build() {
    // Kick off async session restore; initial state is `unknown`.
    _restore();
    return const AuthState();
  }

  Future<void> _restore() async {
    try {
      final user = await _repo.currentUser();
      if (user != null) {
        state = AuthState(status: AuthStatus.authenticated, user: user);
        return;
      }
    } catch (_) {
      // fall through to guest/unauthenticated
    }
    final guest = _prefs.getBool(Preferences.kGuest);
    state = AuthState(
        status: guest ? AuthStatus.guest : AuthStatus.unauthenticated);
  }

  Future<void> login(String email, String password) async {
    final user = await _repo.login(email, password);
    await _prefs.setBool(Preferences.kGuest, false);
    state = AuthState(status: AuthStatus.authenticated, user: user);
  }

  Future<void> register(String name, String email, String password) async {
    final user = await _repo.register(name, email, password);
    await _prefs.setBool(Preferences.kGuest, false);
    state = AuthState(status: AuthStatus.authenticated, user: user);
  }

  void continueAsGuest() {
    _prefs.setBool(Preferences.kGuest, true);
    state = const AuthState(status: AuthStatus.guest);
  }

  Future<void> logout() async {
    await _repo.logout();
    await _prefs.setBool(Preferences.kGuest, false);
    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}
