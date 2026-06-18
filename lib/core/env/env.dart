import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment / configuration for the API base URL.
///
/// Resolution order (first match wins):
///   1. `--dart-define=NOMLY_API_BASE_URL=...`  (compile-time override)
///   2. `NOMLY_API_BASE_URL` in the bundled `.env` file (loaded in main())
///   3. a sensible per-platform default:
///        * Android emulator reaches the host machine on 10.0.2.2
///        * everything else uses localhost
abstract final class Env {
  static const String _override = String.fromEnvironment(
    'NOMLY_API_BASE_URL',
    defaultValue: '',
  );

  static String? _fromDotenv() {
    if (!dotenv.isInitialized) return null;
    final value = dotenv.maybeGet('NOMLY_API_BASE_URL');
    return (value != null && value.trim().isNotEmpty) ? value.trim() : null;
  }

  static String get baseUrl {
    if (_override.isNotEmpty) return _override;
    final fromEnv = _fromDotenv();
    if (fromEnv != null) return fromEnv;
    if (!kIsWeb && Platform.isAndroid) return 'http://10.0.2.2:8000';
    return 'http://localhost:8000';
  }

  /// Simulated network behaviour (only applied in debug-style demos).
  static const bool simulateLatency = true;
  static const int minLatencyMs = 300;
  static const int maxLatencyMs = 800;

  /// Probability (0..1) that a GET request fails with a simulated error.
  /// Kept low so the happy path dominates but error states are reachable.
  static const double simulatedErrorRate = 0.04;
}
