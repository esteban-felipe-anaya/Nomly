import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';
part 'catalog.g.dart';

@freezed
abstract class Cuisine with _$Cuisine {
  const factory Cuisine({
    required String id,
    required String name,
    @Default('restaurant') String icon,
  }) = _Cuisine;

  factory Cuisine.fromJson(Map<String, dynamic> json) =>
      _$CuisineFromJson(json);
}

@freezed
abstract class PromoBanner with _$PromoBanner {
  const factory PromoBanner({
    required String id,
    required String title,
    @Default('') String subtitle,
    required String image,
    String? restaurantId,
  }) = _PromoBanner;

  factory PromoBanner.fromJson(Map<String, dynamic> json) =>
      _$PromoBannerFromJson(json);
}
