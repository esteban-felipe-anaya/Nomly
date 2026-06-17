import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../env/env.dart';
import '../storage/token_storage.dart';

/// Attaches the bearer token (when present) to every outgoing request.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokens);
  final TokenStorage _tokens;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = _tokens.cached ?? await _tokens.read();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

/// Lightweight request/response logger (debug builds only).
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('→ ${options.method} ${options.uri}');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
          '← ${response.statusCode} ${response.requestOptions.uri}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
          '✗ ${err.response?.statusCode ?? ''} ${err.requestOptions.uri} — ${err.message}');
    }
    handler.next(err);
  }
}

/// Simulates real-world network conditions for the demo: 300–800ms latency and
/// an occasional transient error on idempotent GETs, so loading and error
/// states are genuinely exercised. Disabled for non-GET requests to avoid
/// breaking writes (place order, etc.).
class SimulatedNetworkInterceptor extends Interceptor {
  SimulatedNetworkInterceptor({Random? random}) : _random = random ?? Random();
  final Random _random;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (Env.simulateLatency) {
      final span = Env.maxLatencyMs - Env.minLatencyMs;
      final ms = Env.minLatencyMs + _random.nextInt(span <= 0 ? 1 : span);
      await Future<void>.delayed(Duration(milliseconds: ms));
    }

    final isGet = options.method.toUpperCase() == 'GET';
    if (isGet && _random.nextDouble() < Env.simulatedErrorRate) {
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: 'Simulated transient network error',
        ),
      );
    }
    handler.next(options);
  }
}
