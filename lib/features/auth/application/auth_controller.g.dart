// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the session. Browsing is allowed as a guest; checkout is gated on
/// [isAuthenticated] (enforced by the router redirect).

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

/// Holds the session. Browsing is allowed as a guest; checkout is gated on
/// [isAuthenticated] (enforced by the router redirect).
final class AuthControllerProvider
    extends $NotifierProvider<AuthController, AuthState> {
  /// Holds the session. Browsing is allowed as a guest; checkout is gated on
  /// [isAuthenticated] (enforced by the router redirect).
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthState>(value),
    );
  }
}

String _$authControllerHash() => r'96e47439be87d89b585f30391e8b0425618fbe3e';

/// Holds the session. Browsing is allowed as a guest; checkout is gated on
/// [isAuthenticated] (enforced by the router redirect).

abstract class _$AuthController extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
