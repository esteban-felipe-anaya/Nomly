import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/cart_item.dart';
import '../../../data/models/order.dart';
import '../../../data/models/promo.dart';
import 'cart_math.dart';

part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

/// The cart is scoped to a single restaurant at a time (like most delivery
/// apps) so the placed order maps cleanly to one restaurant and one delivery
/// fee. Adding a dish from a different restaurant prompts to start a new cart.
@freezed
abstract class CartState with _$CartState {
  const CartState._();

  const factory CartState({
    @Default(<CartItem>[]) List<CartItem> items,
    String? restaurantId,
    @Default('') String restaurantName,
    @Default(0) double baseDeliveryFee,
    @Default('USD') String currency,
    PromoResult? promo,
    @Default(0) double tip,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);

  bool get isEmpty => items.isEmpty;
  bool get isNotEmpty => items.isNotEmpty;
  int get count => items.fold(0, (s, i) => s + i.quantity);

  OrderTotals get totals => CartMath.compute(
        items,
        baseDeliveryFee: baseDeliveryFee,
        tip: tip,
        promo: promo,
      );
}
