// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  dishId: json['dishId'] as String,
  restaurantId: json['restaurantId'] as String,
  name: json['name'] as String,
  image: json['image'] as String? ?? '',
  unitPrice: (json['unitPrice'] as num).toDouble(),
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  selectedOptions:
      (json['selectedOptions'] as List<dynamic>?)
          ?.map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CustomizationOption>[],
  lineTotal: (json['lineTotal'] as num).toDouble(),
  instructions: json['instructions'] as String? ?? '',
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'dishId': instance.dishId,
      'restaurantId': instance.restaurantId,
      'name': instance.name,
      'image': instance.image,
      'unitPrice': instance.unitPrice,
      'quantity': instance.quantity,
      'selectedOptions': instance.selectedOptions,
      'lineTotal': instance.lineTotal,
      'instructions': instance.instructions,
    };

_OrderTotals _$OrderTotalsFromJson(Map<String, dynamic> json) => _OrderTotals(
  subtotal: (json['subtotal'] as num?)?.toDouble() ?? 0,
  discount: (json['discount'] as num?)?.toDouble() ?? 0,
  deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
  serviceFee: (json['serviceFee'] as num?)?.toDouble() ?? 0,
  tax: (json['tax'] as num?)?.toDouble() ?? 0,
  tip: (json['tip'] as num?)?.toDouble() ?? 0,
  total: (json['total'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$OrderTotalsToJson(_OrderTotals instance) =>
    <String, dynamic>{
      'subtotal': instance.subtotal,
      'discount': instance.discount,
      'deliveryFee': instance.deliveryFee,
      'serviceFee': instance.serviceFee,
      'tax': instance.tax,
      'tip': instance.tip,
      'total': instance.total,
    };

_Courier _$CourierFromJson(Map<String, dynamic> json) => _Courier(
  name: json['name'] as String,
  avatar: json['avatar'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  lat: (json['lat'] as num?)?.toDouble() ?? 0,
  lng: (json['lng'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$CourierToJson(_Courier instance) => <String, dynamic>{
  'name': instance.name,
  'avatar': instance.avatar,
  'phone': instance.phone,
  'lat': instance.lat,
  'lng': instance.lng,
};

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  userId: json['userId'] as String? ?? 'usr_01',
  restaurantId: json['restaurantId'] as String,
  restaurantName: json['restaurantName'] as String? ?? '',
  restaurantCover: json['restaurantCover'] as String? ?? '',
  addressId: json['addressId'] as String,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <OrderItem>[],
  totals: OrderTotals.fromJson(json['totals'] as Map<String, dynamic>),
  promoCode: json['promoCode'] as String?,
  paymentMethod: json['paymentMethod'] as String? ?? 'Card',
  scheduledFor: json['scheduledFor'] as String?,
  status: json['status'] as String? ?? 'confirmed',
  placedAt: json['placedAt'] as String,
  etaMinutes: (json['etaMinutes'] as num?)?.toInt() ?? 0,
  courier: json['courier'] == null
      ? null
      : Courier.fromJson(json['courier'] as Map<String, dynamic>),
  route:
      (json['route'] as List<dynamic>?)
          ?.map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList() ??
      const <List<double>>[],
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'restaurantId': instance.restaurantId,
  'restaurantName': instance.restaurantName,
  'restaurantCover': instance.restaurantCover,
  'addressId': instance.addressId,
  'items': instance.items,
  'totals': instance.totals,
  'promoCode': instance.promoCode,
  'paymentMethod': instance.paymentMethod,
  'scheduledFor': instance.scheduledFor,
  'status': instance.status,
  'placedAt': instance.placedAt,
  'etaMinutes': instance.etaMinutes,
  'courier': instance.courier,
  'route': instance.route,
};
