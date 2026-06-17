import 'package:flutter_test/flutter_test.dart';
import 'package:nomly/data/models/cart_item.dart';
import 'package:nomly/data/models/dish.dart';
import 'package:nomly/data/models/promo.dart';
import 'package:nomly/features/cart/application/cart_math.dart';

void main() {
  // Pizza $12.50 + Large(+$4.00) x2  => unit $16.50, line $33.00
  final pizza = CartItem(
    id: '1',
    dishId: 'd1',
    restaurantId: 'r1',
    name: 'Margherita',
    unitPrice: 12.5,
    quantity: 2,
    selectedOptions: const [CustomizationOption(name: 'Large', priceDelta: 4)],
  );
  // Garlic bread $5.50 x1, no add-ons
  const bread = CartItem(
    id: '2',
    dishId: 'd2',
    restaurantId: 'r1',
    name: 'Garlic Bread',
    unitPrice: 5.5,
    quantity: 1,
  );

  test('line totals include add-ons and quantity', () {
    expect(pizza.unitTotal, 16.5);
    expect(pizza.lineTotal, 33.0);
    expect(bread.lineTotal, 5.5);
  });

  test('totals without promo: subtotal, fees, tax and tip', () {
    final totals = CartMath.compute(
      [pizza, bread],
      baseDeliveryFee: 2.49,
      tip: 3.0,
    );
    // subtotal = 33.00 + 5.50 = 38.50
    expect(totals.subtotal, 38.50);
    expect(totals.discount, 0);
    expect(totals.deliveryFee, 2.49);
    // service = 5% of 38.50 = 1.925 -> 1.93 (rounded)
    expect(totals.serviceFee, closeTo(1.93, 0.001));
    // tax = 8% of 38.50 = 3.08
    expect(totals.tax, closeTo(3.08, 0.001));
    expect(totals.tip, 3.0);
    // total = 38.50 + 2.49 + 1.93 + 3.08 + 3.00 = 49.00
    expect(totals.total, closeTo(49.00, 0.001));
  });

  test('applies a percentage promo to subtotal and recomputes tax', () {
    const promo = PromoResult(code: 'NOMLY20', valid: true, discountPct: 20);
    final totals = CartMath.compute(
      [pizza, bread],
      baseDeliveryFee: 2.49,
      tip: 0,
      promo: promo,
    );
    // discount = 20% of 38.50 = 7.70
    expect(totals.discount, closeTo(7.70, 0.001));
    // tax = 8% of (38.50 - 7.70 = 30.80) = 2.464 -> 2.46
    expect(totals.tax, closeTo(2.46, 0.001));
    // total = 38.50 - 7.70 + 2.49 + 1.93 + 2.46 + 0 = 37.68
    expect(totals.total, closeTo(37.68, 0.001));
  });

  test('free-delivery promo zeroes the delivery fee', () {
    const promo = PromoResult(
        code: 'FREESHIP', valid: true, discountPct: 0, freeDelivery: true);
    final totals = CartMath.compute([bread],
        baseDeliveryFee: 4.99, tip: 0, promo: promo);
    expect(totals.deliveryFee, 0);
  });

  test('an invalid promo is ignored', () {
    const promo = PromoResult(code: 'NOPE', valid: false, discountPct: 50);
    final totals =
        CartMath.compute([bread], baseDeliveryFee: 1.0, tip: 0, promo: promo);
    expect(totals.discount, 0);
  });
}
