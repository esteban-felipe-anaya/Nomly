import 'package:freezed_annotation/freezed_annotation.dart';

import 'dish.dart';

part 'cart_item.freezed.dart';
part 'cart_item.g.dart';

/// A client-side cart line. Captures a snapshot of the dish plus the chosen
/// customization so totals are stable even if the menu changes. Persisted to
/// shared_preferences so the cart survives relaunch.
@freezed
abstract class CartItem with _$CartItem {
  const CartItem._();

  const factory CartItem({
    required String id, // unique line id (uuid)
    required String dishId,
    required String restaurantId,
    @Default('') String restaurantName,
    required String name,
    @Default('') String image,
    required double unitPrice,
    @Default('USD') String currency,
    @Default(1) int quantity,
    @Default(<CustomizationOption>[]) List<CustomizationOption> selectedOptions,
    @Default('') String instructions,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  double get optionsDelta =>
      selectedOptions.fold(0, (s, o) => s + o.priceDelta);

  /// Price of a single unit including selected add-ons.
  double get unitTotal => unitPrice + optionsDelta;

  double get lineTotal => unitTotal * quantity;

  String get optionsLabel => selectedOptions.map((o) => o.name).join(', ');
}
