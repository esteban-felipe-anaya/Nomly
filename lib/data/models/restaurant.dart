import 'package:freezed_annotation/freezed_annotation.dart';

import 'dish.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
abstract class MenuCategory with _$MenuCategory {
  const factory MenuCategory({
    required String category,
    @Default(<Dish>[]) List<Dish> items,
  }) = _MenuCategory;

  factory MenuCategory.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryFromJson(json);
}

@freezed
abstract class Restaurant with _$Restaurant {
  const Restaurant._();

  const factory Restaurant({
    required String id,
    required String name,
    @Default('') String cuisineId,
    @Default('') String cuisine,
    @Default('') String description,
    @Default('') String cover,
    @Default('') String logo,
    @Default(0) double rating,
    @Default(0) int ratingCount,
    @Default(30) int deliveryMinutes,
    @Default(0) double deliveryFee,
    @Default(1) int priceLevel,
    @Default(false) bool freeDelivery,
    @Default(<String>[]) List<String> offers,
    @Default(0) double distanceKm,
    double? lat,
    double? lng,
    @Default('') String address,
    // Present only on the detail endpoint.
    @Default(<MenuCategory>[]) List<MenuCategory> menu,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  bool get hasOffers => offers.isNotEmpty;
}
