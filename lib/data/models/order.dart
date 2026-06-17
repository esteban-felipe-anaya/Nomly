import 'package:freezed_annotation/freezed_annotation.dart';

import 'dish.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String dishId,
    required String restaurantId,
    required String name,
    @Default('') String image,
    required double unitPrice,
    @Default(1) int quantity,
    @Default(<CustomizationOption>[]) List<CustomizationOption> selectedOptions,
    required double lineTotal,
    @Default('') String instructions,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class OrderTotals with _$OrderTotals {
  const factory OrderTotals({
    @Default(0) double subtotal,
    @Default(0) double discount,
    @Default(0) double deliveryFee,
    @Default(0) double serviceFee,
    @Default(0) double tax,
    @Default(0) double tip,
    @Default(0) double total,
  }) = _OrderTotals;

  factory OrderTotals.fromJson(Map<String, dynamic> json) =>
      _$OrderTotalsFromJson(json);
}

@freezed
abstract class Courier with _$Courier {
  const factory Courier({
    required String name,
    @Default('') String avatar,
    @Default('') String phone,
    @Default(0) double lat,
    @Default(0) double lng,
  }) = _Courier;

  factory Courier.fromJson(Map<String, dynamic> json) =>
      _$CourierFromJson(json);
}

@freezed
abstract class Order with _$Order {
  const Order._();

  const factory Order({
    required String id,
    @Default('usr_01') String userId,
    required String restaurantId,
    @Default('') String restaurantName,
    @Default('') String restaurantCover,
    required String addressId,
    @Default(<OrderItem>[]) List<OrderItem> items,
    required OrderTotals totals,
    String? promoCode,
    @Default('Card') String paymentMethod,
    String? scheduledFor,
    @Default('confirmed') String status,
    required String placedAt,
    @Default(0) int etaMinutes,
    Courier? courier,
    @Default(<List<double>>[]) List<List<double>> route,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  DateTime get placedAtDate =>
      DateTime.tryParse(placedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
  bool get isActive => status != 'delivered' && status != 'cancelled';
  int get itemCount => items.fold(0, (s, i) => s + i.quantity);
}
