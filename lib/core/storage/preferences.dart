import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// Thin typed wrapper over [SharedPreferences] for non-secret persisted state:
/// theme mode, locale, cart cache, favorites, selected address and recent
/// searches. A single instance is provided via Riverpod.
class Preferences {
  Preferences(this._prefs);

  final SharedPreferences _prefs;

  static Future<Preferences> create() async =>
      Preferences(await SharedPreferences.getInstance());

  // keys
  static const kThemeMode = 'nomly.themeMode';
  static const kLocale = 'nomly.locale';
  static const kCart = 'nomly.cart';
  static const kSelectedAddress = 'nomly.selectedAddressId';
  static const kRecentSearches = 'nomly.recentSearches';
  static const kOnboardingDone = 'nomly.onboardingDone';
  static const kGuest = 'nomly.guest';

  String? getString(String key) => _prefs.getString(key);
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  bool getBool(String key, {bool fallback = false}) =>
      _prefs.getBool(key) ?? fallback;
  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  List<String> getStringList(String key) => _prefs.getStringList(key) ?? const [];
  Future<void> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  Map<String, dynamic>? getJson(String key) {
    final raw = _prefs.getString(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> setJson(String key, Map<String, dynamic> value) =>
      _prefs.setString(key, jsonEncode(value));

  Future<void> remove(String key) => _prefs.remove(key);
}
