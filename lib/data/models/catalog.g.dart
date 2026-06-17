// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cuisine _$CuisineFromJson(Map<String, dynamic> json) => _Cuisine(
  id: json['id'] as String,
  name: json['name'] as String,
  icon: json['icon'] as String? ?? 'restaurant',
);

Map<String, dynamic> _$CuisineToJson(_Cuisine instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
};

_PromoBanner _$PromoBannerFromJson(Map<String, dynamic> json) => _PromoBanner(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String? ?? '',
  image: json['image'] as String,
  restaurantId: json['restaurantId'] as String?,
);

Map<String, dynamic> _$PromoBannerToJson(_PromoBanner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'image': instance.image,
      'restaurantId': instance.restaurantId,
    };
