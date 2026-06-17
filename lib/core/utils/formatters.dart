import 'package:intl/intl.dart';

/// Currency / date / duration formatting. All money and dates in the UI must go
/// through these helpers (never raw string interpolation) per the spec.
abstract final class Formatters {
  static final Map<String, NumberFormat> _currencyCache = {};

  static NumberFormat _currency(String code) {
    return _currencyCache.putIfAbsent(
      code,
      () => NumberFormat.simpleCurrency(name: code),
    );
  }

  /// e.g. `$12.50`
  static String money(num amount, {String currency = 'USD'}) =>
      _currency(currency).format(amount);

  /// e.g. `$1.49` or `Free` when zero.
  static String fee(num amount, {String currency = 'USD'}) =>
      amount <= 0 ? 'Free' : money(amount, currency: currency);

  /// e.g. `Jun 17, 7:24 PM`
  static String dateTime(DateTime dt) =>
      DateFormat('MMM d, h:mm a').format(dt.toLocal());

  /// e.g. `Jun 17, 2026`
  static String date(DateTime dt) =>
      DateFormat('MMM d, yyyy').format(dt.toLocal());

  /// e.g. `7:24 PM`
  static String time(DateTime dt) => DateFormat('h:mm a').format(dt.toLocal());

  /// e.g. `25 min` / `1 hr 5 min`
  static String minutes(int min) {
    if (min < 60) return '$min min';
    final h = min ~/ 60;
    final m = min % 60;
    return m == 0 ? '$h hr' : '$h hr $m min';
  }

  /// Price level as `$`, `$$`, `$$$`.
  static String priceLevel(int level) => '\$' * level.clamp(1, 4);

  /// e.g. `1.2 km`
  static String distance(double km) => '${km.toStringAsFixed(1)} km';
}
