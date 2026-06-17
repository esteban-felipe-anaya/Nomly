import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../../core/storage/preferences.dart';

part 'settings_controller.g.dart';

/// Supported app locales.
const supportedLocales = <Locale>[Locale('en'), Locale('es')];

@immutable
class AppSettings {
  const AppSettings({this.themeMode = ThemeMode.system, this.locale});

  final ThemeMode themeMode;
  final Locale? locale;

  AppSettings copyWith({ThemeMode? themeMode, Locale? locale, bool clearLocale = false}) =>
      AppSettings(
        themeMode: themeMode ?? this.themeMode,
        locale: clearLocale ? null : (locale ?? this.locale),
      );
}

/// Persists theme mode and locale across launches.
@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  late final Preferences _prefs;

  @override
  AppSettings build() {
    _prefs = ref.watch(preferencesProvider);
    final mode = _prefs.getString(Preferences.kThemeMode);
    final lang = _prefs.getString(Preferences.kLocale);
    return AppSettings(
      themeMode: ThemeMode.values.firstWhere(
        (m) => m.name == mode,
        orElse: () => ThemeMode.system,
      ),
      locale: lang == null ? null : Locale(lang),
    );
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _prefs.setString(Preferences.kThemeMode, mode.name);
  }

  void setLocale(Locale? locale) {
    state = state.copyWith(locale: locale, clearLocale: locale == null);
    if (locale == null) {
      _prefs.remove(Preferences.kLocale);
    } else {
      _prefs.setString(Preferences.kLocale, locale.languageCode);
    }
  }
}
