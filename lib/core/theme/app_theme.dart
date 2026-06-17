import 'package:flutter/material.dart';

import 'app_spacing.dart';

/// Brand seed color — warm appetizing orange.
const Color kNomlySeed = Color(0xFFE0531F);

/// Fresh green used for "free delivery" / success states. Exposed through a
/// [ThemeExtension] so widgets never hardcode the color.
@immutable
class NomlyColors extends ThemeExtension<NomlyColors> {
  const NomlyColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.rating,
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;
  final Color rating;

  static const NomlyColors light = NomlyColors(
    success: Color(0xFF1E7B34),
    onSuccess: Colors.white,
    successContainer: Color(0xFFB6F2BE),
    onSuccessContainer: Color(0xFF00210A),
    rating: Color(0xFFF2A600),
  );

  static const NomlyColors dark = NomlyColors(
    success: Color(0xFF7CDB8A),
    onSuccess: Color(0xFF003915),
    successContainer: Color(0xFF015321),
    onSuccessContainer: Color(0xFFB6F2BE),
    rating: Color(0xFFFFC233),
  );

  @override
  NomlyColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? rating,
  }) {
    return NomlyColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      rating: rating ?? this.rating,
    );
  }

  @override
  NomlyColors lerp(ThemeExtension<NomlyColors>? other, double t) {
    if (other is! NomlyColors) return this;
    return NomlyColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      rating: Color.lerp(rating, other.rating, t)!,
    );
  }
}

/// Builds the application [ThemeData] for a given [ColorScheme]. Used for both
/// the seed-based schemes and platform dynamic-color schemes.
abstract final class AppTheme {
  static ThemeData light([ColorScheme? scheme]) => _build(
        scheme ?? ColorScheme.fromSeed(seedColor: kNomlySeed),
        Brightness.light,
      );

  static ThemeData dark([ColorScheme? scheme]) => _build(
        scheme ??
            ColorScheme.fromSeed(
              seedColor: kNomlySeed,
              brightness: Brightness.dark,
            ),
        Brightness.dark,
      );

  static ThemeData _build(ColorScheme scheme, Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      brightness: brightness,
      scaffoldBackgroundColor: scheme.surface,
      extensions: <ThemeExtension<dynamic>>[
        isDark ? NomlyColors.dark : NomlyColors.light,
      ],
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: AppElevation.medium,
        centerTitle: false,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: AppElevation.none,
        clipBehavior: Clip.antiAlias,
        color: scheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: EdgeInsets.zero,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(0, 52),
          shape: const StadiumBorder(),
          textStyle: base.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(0, 52),
          shape: const StadiumBorder(),
        ),
      ),
      chipTheme: ChipThemeData(
        shape: const StadiumBorder(),
        side: BorderSide(color: scheme.outlineVariant),
        showCheckmark: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: AppElevation.medium,
        backgroundColor: scheme.surfaceContainer,
        indicatorColor: scheme.secondaryContainer,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.secondaryContainer,
        selectedIconTheme: IconThemeData(color: scheme.onSecondaryContainer),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheet),
      ),
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant.withValues(alpha: 0.5),
        space: 1,
      ),
    );
  }
}

/// Convenience accessor for [NomlyColors] from a [BuildContext].
extension NomlyColorsX on BuildContext {
  NomlyColors get nomly => Theme.of(this).extension<NomlyColors>()!;
  ColorScheme get scheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
