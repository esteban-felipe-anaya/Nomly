import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';

/// Environment / configuration. The mock-API base URL is configurable at build
/// time via `--dart-define=NOMLY_API_BASE_URL=...`. When not provided we pick a
/// sensible per-platform default so the app "just runs" against a local
/// json-server:
///   * Android emulator reaches the host machine on 10.0.2.2
///   * everything else uses localhost
abstract final class Env {
  static const String _override = String.fromEnvironment(
    'NOMLY_API_BASE_URL',
    defaultValue: '',
  );

  static String get baseUrl {
    if (_override.isNotEmpty) return _override;
    if (!kIsWeb && Platform.isAndroid) return 'http://192.168.6.124:3000';
    return 'http://localhost:3000';
  }

  /// Simulated network behaviour (only applied in debug-style demos).
  static const bool simulateLatency = true;
  static const int minLatencyMs = 300;
  static const int maxLatencyMs = 800;

  /// Probability (0..1) that a GET request fails with a simulated error.
  /// Kept low so the happy path dominates but error states are reachable.
  static const double simulatedErrorRate = 0.04;
}
