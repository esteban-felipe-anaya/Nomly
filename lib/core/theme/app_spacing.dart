import 'package:flutter/widgets.dart';

/// Centralized design tokens: spacing, radii, durations, elevations and
/// responsive breakpoints. No screen should hardcode raw numbers for these —
/// always reference [AppSpacing], [AppRadius], etc.
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  /// Default page horizontal padding.
  static const EdgeInsets page = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets pageVertical =
      EdgeInsets.symmetric(horizontal: lg, vertical: lg);
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;

  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius sheet =
      BorderRadius.vertical(top: Radius.circular(xl));
  static const BorderRadius image = BorderRadius.all(Radius.circular(md));
}

abstract final class AppDurations {
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);

  /// Demo order-tracking auto-advance interval.
  static const Duration trackingTick = Duration(seconds: 6);
  static const Duration courierTick = Duration(milliseconds: 1200);
}

/// Material 3 / adaptive-scaffold breakpoints.
abstract final class AppBreakpoints {
  static const double compact = 600; // < mobile
  static const double medium = 840; // tablet
  // >= medium -> expanded (desktop / web)

  static bool isCompact(double width) => width < compact;
  static bool isMedium(double width) => width >= compact && width < medium;
  static bool isExpanded(double width) => width >= medium;
}

abstract final class AppElevation {
  static const double none = 0;
  static const double low = 1;
  static const double medium = 3;
  static const double high = 6;
}
