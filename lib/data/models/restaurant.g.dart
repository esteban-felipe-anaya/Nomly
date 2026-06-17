// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuCategory _$MenuCategoryFromJson(Map<String, dynamic> json) =>
    _MenuCategory(
      category: json['category'] as String,
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Dish>[],
    );

Map<String, dynamic> _$MenuCategoryToJson(_MenuCategory instance) =>
    <String, dynamic>{'category': instance.category, 'items': instance.items};

_Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => _Restaurant(
  id: json['id'] as String,
  name: json['name'] as String,
  cuisineId: json['cuisineId'] as String? ?? '',
  cuisine: json['cuisine'] as String? ?? '',
  description: json['description'] as String? ?? '',
  cover: json['cover'] as String? ?? '',
  logo: json['logo'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
  deliveryMinutes: (json['deliveryMinutes'] as num?)?.toInt() ?? 30,
  deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0,
  priceLevel: (json['priceLevel'] as num?)?.toInt() ?? 1,
  freeDelivery: json['freeDelivery'] as bool? ?? false,
  offers:
      (json['offers'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  distanceKm: (json['distanceKm'] as num?)?.toDouble() ?? 0,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  address: json['address'] as String? ?? '',
  menu:
      (json['menu'] as List<dynamic>?)
          ?.map((e) => MenuCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <MenuCategory>[],
);

Map<String, dynamic> _$RestaurantToJson(_Restaurant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cuisineId': instance.cuisineId,
      'cuisine': instance.cuisine,
      'description': instance.description,
      'cover': instance.cover,
      'logo': instance.logo,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'deliveryMinutes': instance.deliveryMinutes,
      'deliveryFee': instance.deliveryFee,
      'priceLevel': instance.priceLevel,
      'freeDelivery': instance.freeDelivery,
      'offers': instance.offers,
      'distanceKm': instance.distanceKm,
      'lat': instance.lat,
      'lng': instance.lng,
      'address': instance.address,
      'menu': instance.menu,
    };
