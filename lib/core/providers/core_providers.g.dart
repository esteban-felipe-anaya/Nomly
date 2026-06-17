// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Secure token storage (kept alive for the app lifetime).

@ProviderFor(tokenStorage)
final tokenStorageProvider = TokenStorageProvider._();

/// Secure token storage (kept alive for the app lifetime).

final class TokenStorageProvider
    extends $FunctionalProvider<TokenStorage, TokenStorage, TokenStorage>
    with $Provider<TokenStorage> {
  /// Secure token storage (kept alive for the app lifetime).
  TokenStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tokenStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tokenStorageHash();

  @$internal
  @override
  $ProviderElement<TokenStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TokenStorage create(Ref ref) {
    return tokenStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TokenStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TokenStorage>(value),
    );
  }
}

String _$tokenStorageHash() => r'a42816fb1cf5af728e44ff5c48bfcaf5dc6b12aa';

/// SharedPreferences wrapper. Created asynchronously in `main()` and injected
/// via an override, so this default should never actually run.

@ProviderFor(preferences)
final preferencesProvider = PreferencesProvider._();

/// SharedPreferences wrapper. Created asynchronously in `main()` and injected
/// via an override, so this default should never actually run.

final class PreferencesProvider
    extends $FunctionalProvider<Preferences, Preferences, Preferences>
    with $Provider<Preferences> {
  /// SharedPreferences wrapper. Created asynchronously in `main()` and injected
  /// via an override, so this default should never actually run.
  PreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'preferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$preferencesHash();

  @$internal
  @override
  $ProviderElement<Preferences> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Preferences create(Ref ref) {
    return preferences(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Preferences value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Preferences>(value),
    );
  }
}

String _$preferencesHash() => r'43f906c50ace859540dc588a7d4d2404de3da8c2';

/// Configured Dio instance (auth + latency-sim + logging interceptors).

@ProviderFor(dio)
final dioProvider = DioProvider._();

/// Configured Dio instance (auth + latency-sim + logging interceptors).

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  /// Configured Dio instance (auth + latency-sim + logging interceptors).
  DioProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'7b8d87ad377ddffb035b8eebcde73be088d965ab';

/// Retrofit API client.

@ProviderFor(nomlyApi)
final nomlyApiProvider = NomlyApiProvider._();

/// Retrofit API client.

final class NomlyApiProvider
    extends $FunctionalProvider<NomlyApi, NomlyApi, NomlyApi>
    with $Provider<NomlyApi> {
  /// Retrofit API client.
  NomlyApiProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nomlyApiProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nomlyApiHash();

  @$internal
  @override
  $ProviderElement<NomlyApi> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NomlyApi create(Ref ref) {
    return nomlyApi(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NomlyApi value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NomlyApi>(value),
    );
  }
}

String _$nomlyApiHash() => r'bab02bda12e913976ec636c91909b3919e7990c4';
