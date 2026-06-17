import 'package:dio/dio.dart';

/// Centralized typed error used across repositories and surfaced by the UI.
class AppException implements Exception {
  const AppException(this.message, {this.kind = AppErrorKind.unknown, this.statusCode});

  final String message;
  final AppErrorKind kind;
  final int? statusCode;

  /// Maps a low-level [DioException] (or any error) into a user-friendly
  /// [AppException]. Keeps presentation logic out of widgets.
  factory AppException.from(Object error) {
    if (error is AppException) return error;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return const AppException(
            'The connection timed out. Please try again.',
            kind: AppErrorKind.timeout,
          );
        case DioExceptionType.connectionError:
          return const AppException(
            "Can't reach the server. Is the mock API running?",
            kind: AppErrorKind.network,
          );
        case DioExceptionType.badResponse:
          final code = error.response?.statusCode;
          if (code == 401) {
            return AppException('Please sign in to continue.',
                kind: AppErrorKind.unauthorized, statusCode: code);
          }
          if (code == 404) {
            return AppException('Not found.',
                kind: AppErrorKind.notFound, statusCode: code);
          }
          return AppException('Something went wrong (HTTP $code).',
              kind: AppErrorKind.server, statusCode: code);
        case DioExceptionType.cancel:
          return const AppException('Request cancelled.',
              kind: AppErrorKind.cancelled);
        default:
          return AppException(
            error.message ?? 'Unexpected network error.',
            kind: AppErrorKind.unknown,
          );
      }
    }
    return AppException(error.toString());
  }

  @override
  String toString() => 'AppException($kind, $statusCode): $message';
}

enum AppErrorKind {
  network,
  timeout,
  server,
  unauthorized,
  notFound,
  cancelled,
  unknown,
}
