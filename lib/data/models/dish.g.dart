// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomizationOption _$CustomizationOptionFromJson(Map<String, dynamic> json) =>
    _CustomizationOption(
      name: json['name'] as String,
      priceDelta: (json['priceDelta'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CustomizationOptionToJson(
  _CustomizationOption instance,
) => <String, dynamic>{
  'name': instance.name,
  'priceDelta': instance.priceDelta,
};

_CustomizationGroup _$CustomizationGroupFromJson(Map<String, dynamic> json) =>
    _CustomizationGroup(
      group: json['group'] as String,
      type: json['type'] as String? ?? 'single',
      isRequired: json['required'] as bool? ?? false,
      options:
          (json['options'] as List<dynamic>?)
              ?.map(
                (e) => CustomizationOption.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <CustomizationOption>[],
    );

Map<String, dynamic> _$CustomizationGroupToJson(_CustomizationGroup instance) =>
    <String, dynamic>{
      'group': instance.group,
      'type': instance.type,
      'required': instance.isRequired,
      'options': instance.options,
    };

_Dish _$DishFromJson(Map<String, dynamic> json) => _Dish(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String,
  name: json['name'] as String,
  category: json['category'] as String? ?? '',
  description: json['description'] as String? ?? '',
  price: (json['price'] as num).toDouble(),
  currency: json['currency'] as String? ?? 'USD',
  image: json['image'] as String? ?? '',
  popular: json['popular'] as bool? ?? false,
  customization:
      (json['customization'] as List<dynamic>?)
          ?.map((e) => CustomizationGroup.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CustomizationGroup>[],
);

Map<String, dynamic> _$DishToJson(_Dish instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'name': instance.name,
  'category': instance.category,
  'description': instance.description,
  'price': instance.price,
  'currency': instance.currency,
  'image': instance.image,
  'popular': instance.popular,
  'customization': instance.customization,
};
