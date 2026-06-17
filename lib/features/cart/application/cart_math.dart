import '../../../data/models/cart_item.dart';
import '../../../data/models/order.dart';
import '../../../data/models/promo.dart';

/// Pure cart-totals calculation. Kept free of Flutter/Riverpod so it can be
/// unit-tested directly (see test/cart_math_test.dart).
///
/// Fee model:
///   subtotal    = Σ line totals (unit price + add-ons) × qty
///   discount    = subtotal × promo.discountPct (only if promo valid)
///   deliveryFee = 0 if promo.freeDelivery, else the restaurant's base fee
///   serviceFee  = 5% of subtotal
///   tax         = 8% of (subtotal − discount)
///   total       = subtotal − discount + delivery + service + tax + tip
abstract final class CartMath {
  static const double serviceRate = 0.05;
  static const double taxRate = 0.08;

  static double round2(double v) => (v * 100).roundToDouble() / 100;

  static OrderTotals compute(
    List<CartItem> items, {
    required double baseDeliveryFee,
    double tip = 0,
    PromoResult? promo,
  }) {
    final subtotal = round2(items.fold<double>(0, (s, i) => s + i.lineTotal));

    final appliesPromo = promo != null && promo.valid;
    final discount =
        appliesPromo ? round2(subtotal * (promo.discountPct / 100)) : 0.0;
    final freeDelivery = appliesPromo && promo.freeDelivery;
    final deliveryFee = freeDelivery ? 0.0 : baseDeliveryFee;

    final serviceFee = round2(subtotal * serviceRate);
    final tax = round2((subtotal - discount) * taxRate);
    final total =
        round2(subtotal - discount + deliveryFee + serviceFee + tax + tip);

    return OrderTotals(
      subtotal: subtotal,
      discount: discount,
      deliveryFee: deliveryFee,
      serviceFee: serviceFee,
      tax: tax,
      tip: round2(tip),
      total: total,
    );
  }
}
