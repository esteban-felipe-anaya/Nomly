import '../../core/network/app_exception.dart';

/// Runs an API call and rethrows any failure as a typed [AppException], so
/// repositories never leak Dio specifics to the presentation layer.
Future<T> guard<T>(Future<T> Function() call) async {
  try {
    return await call();
  } catch (e) {
    throw AppException.from(e);
  }
}
