import 'package:dio/dio.dart';

import '../env/env.dart';
import '../storage/token_storage.dart';
import 'interceptors.dart';

/// Builds the configured [Dio] instance shared by all Retrofit API clients.
Dio buildDio(TokenStorage tokens) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: 'application/json',
      headers: {'Accept': 'application/json'},
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(tokens),
    SimulatedNetworkInterceptor(),
    LoggingInterceptor(),
  ]);

  return dio;
}
