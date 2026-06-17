import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish.freezed.dart';
part 'dish.g.dart';

@freezed
abstract class CustomizationOption with _$CustomizationOption {
  const factory CustomizationOption({
    required String name,
    @Default(0) double priceDelta,
  }) = _CustomizationOption;

  factory CustomizationOption.fromJson(Map<String, dynamic> json) =>
      _$CustomizationOptionFromJson(json);
}

@freezed
abstract class CustomizationGroup with _$CustomizationGroup {
  const CustomizationGroup._();

  const factory CustomizationGroup({
    required String group,
    // 'single' (radio) or 'multi' (checkbox)
    @Default('single') String type,
    @JsonKey(name: 'required') @Default(false) bool isRequired,
    @Default(<CustomizationOption>[]) List<CustomizationOption> options,
  }) = _CustomizationGroup;

  factory CustomizationGroup.fromJson(Map<String, dynamic> json) =>
      _$CustomizationGroupFromJson(json);

  bool get isSingle => type == 'single';
}

@freezed
abstract class Dish with _$Dish {
  const factory Dish({
    required String id,
    required String restaurantId,
    required String name,
    @Default('') String category,
    @Default('') String description,
    required double price,
    @Default('USD') String currency,
    @Default('') String image,
    @Default(false) bool popular,
    @Default(<CustomizationGroup>[]) List<CustomizationGroup> customization,
  }) = _Dish;

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);
}
