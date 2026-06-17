import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/api/nomly_api.dart';
import '../network/dio_client.dart';
import '../storage/preferences.dart';
import '../storage/token_storage.dart';

part 'core_providers.g.dart';

/// Secure token storage (kept alive for the app lifetime).
@Riverpod(keepAlive: true)
TokenStorage tokenStorage(Ref ref) => TokenStorage();

/// SharedPreferences wrapper. Created asynchronously in `main()` and injected
/// via an override, so this default should never actually run.
@Riverpod(keepAlive: true)
Preferences preferences(Ref ref) =>
    throw UnimplementedError('preferencesProvider must be overridden in main()');

/// Configured Dio instance (auth + latency-sim + logging interceptors).
@Riverpod(keepAlive: true)
Dio dio(Ref ref) => buildDio(ref.watch(tokenStorageProvider));

/// Retrofit API client.
@Riverpod(keepAlive: true)
NomlyApi nomlyApi(Ref ref) => NomlyApi(ref.watch(dioProvider));
