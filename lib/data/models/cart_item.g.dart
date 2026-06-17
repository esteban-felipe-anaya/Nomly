// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  id: json['id'] as String,
  dishId: json['dishId'] as String,
  restaurantId: json['restaurantId'] as String,
  restaurantName: json['restaurantName'] as String? ?? '',
  name: json['name'] as String,
  image: json['image'] as String? ?? '',
  unitPrice: (json['unitPrice'] as num).toDouble(),
  currency: json['currency'] as String? ?? 'USD',
  quantity: (json['quantity'] as num?)?.toInt() ?? 1,
  selectedOptions:
      (json['selectedOptions'] as List<dynamic>?)
          ?.map((e) => CustomizationOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CustomizationOption>[],
  instructions: json['instructions'] as String? ?? '',
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'id': instance.id,
  'dishId': instance.dishId,
  'restaurantId': instance.restaurantId,
  'restaurantName': instance.restaurantName,
  'name': instance.name,
  'image': instance.image,
  'unitPrice': instance.unitPrice,
  'currency': instance.currency,
  'quantity': instance.quantity,
  'selectedOptions': instance.selectedOptions,
  'instructions': instance.instructions,
};
