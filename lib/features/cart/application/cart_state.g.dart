// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartState _$CartStateFromJson(Map<String, dynamic> json) => _CartState(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CartItem>[],
  restaurantId: json['restaurantId'] as String?,
  restaurantName: json['restaurantName'] as String? ?? '',
  baseDeliveryFee: (json['baseDeliveryFee'] as num?)?.toDouble() ?? 0,
  currency: json['currency'] as String? ?? 'USD',
  promo: json['promo'] == null
      ? null
      : PromoResult.fromJson(json['promo'] as Map<String, dynamic>),
  tip: (json['tip'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$CartStateToJson(_CartState instance) =>
    <String, dynamic>{
      'items': instance.items,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'baseDeliveryFee': instance.baseDeliveryFee,
      'currency': instance.currency,
      'promo': instance.promo,
      'tip': instance.tip,
    };
