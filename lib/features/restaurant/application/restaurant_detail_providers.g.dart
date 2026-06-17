// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Full restaurant (including grouped menu) for the detail screen.

@ProviderFor(restaurantDetail)
final restaurantDetailProvider = RestaurantDetailFamily._();

/// Full restaurant (including grouped menu) for the detail screen.

final class RestaurantDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<Restaurant>,
          Restaurant,
          FutureOr<Restaurant>
        >
    with $FutureModifier<Restaurant>, $FutureProvider<Restaurant> {
  /// Full restaurant (including grouped menu) for the detail screen.
  RestaurantDetailProvider._({
    required RestaurantDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'restaurantDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$restaurantDetailHash();

  @override
  String toString() {
    return r'restaurantDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Restaurant> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Restaurant> create(Ref ref) {
    final argument = this.argument as String;
    return restaurantDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RestaurantDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$restaurantDetailHash() => r'f046d4619442c2d753934c12f2b1d7c8684e2311';

/// Full restaurant (including grouped menu) for the detail screen.

final class RestaurantDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Restaurant>, String> {
  RestaurantDetailFamily._()
    : super(
        retry: null,
        name: r'restaurantDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Full restaurant (including grouped menu) for the detail screen.

  RestaurantDetailProvider call(String id) =>
      RestaurantDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'restaurantDetailProvider';
}

/// A single dish with its customization groups (used by the sheet when opened
/// from a context that only has the dish id).

@ProviderFor(dishDetail)
final dishDetailProvider = DishDetailFamily._();

/// A single dish with its customization groups (used by the sheet when opened
/// from a context that only has the dish id).

final class DishDetailProvider
    extends $FunctionalProvider<AsyncValue<Dish>, Dish, FutureOr<Dish>>
    with $FutureModifier<Dish>, $FutureProvider<Dish> {
  /// A single dish with its customization groups (used by the sheet when opened
  /// from a context that only has the dish id).
  DishDetailProvider._({
    required DishDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'dishDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$dishDetailHash();

  @override
  String toString() {
    return r'dishDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Dish> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Dish> create(Ref ref) {
    final argument = this.argument as String;
    return dishDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DishDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$dishDetailHash() => r'22c0b216aace0eb83d6ef297fae5f21e6e037aaa';

/// A single dish with its customization groups (used by the sheet when opened
/// from a context that only has the dish id).

final class DishDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Dish>, String> {
  DishDetailFamily._()
    : super(
        retry: null,
        name: r'dishDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A single dish with its customization groups (used by the sheet when opened
  /// from a context that only has the dish id).

  DishDetailProvider call(String id) =>
      DishDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'dishDetailProvider';
}
