// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cuisines)
final cuisinesProvider = CuisinesProvider._();

final class CuisinesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cuisine>>,
          List<Cuisine>,
          FutureOr<List<Cuisine>>
        >
    with $FutureModifier<List<Cuisine>>, $FutureProvider<List<Cuisine>> {
  CuisinesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cuisinesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cuisinesHash();

  @$internal
  @override
  $FutureProviderElement<List<Cuisine>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Cuisine>> create(Ref ref) {
    return cuisines(ref);
  }
}

String _$cuisinesHash() => r'b28e264595ac0893b3a4b2a375427be262b75f44';

@ProviderFor(banners)
final bannersProvider = BannersProvider._();

final class BannersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PromoBanner>>,
          List<PromoBanner>,
          FutureOr<List<PromoBanner>>
        >
    with
        $FutureModifier<List<PromoBanner>>,
        $FutureProvider<List<PromoBanner>> {
  BannersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bannersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bannersHash();

  @$internal
  @override
  $FutureProviderElement<List<PromoBanner>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PromoBanner>> create(Ref ref) {
    return banners(ref);
  }
}

String _$bannersHash() => r'640b4a0908435c056be751c2d1fc3e109b00d4ca';

@ProviderFor(popularRestaurants)
final popularRestaurantsProvider = PopularRestaurantsProvider._();

final class PopularRestaurantsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Restaurant>>,
          List<Restaurant>,
          FutureOr<List<Restaurant>>
        >
    with $FutureModifier<List<Restaurant>>, $FutureProvider<List<Restaurant>> {
  PopularRestaurantsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularRestaurantsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularRestaurantsHash();

  @$internal
  @override
  $FutureProviderElement<List<Restaurant>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Restaurant>> create(Ref ref) {
    return popularRestaurants(ref);
  }
}

String _$popularRestaurantsHash() =>
    r'80efed806e5afe93ed592b306c943a3c3678331e';

/// One popular dish per top restaurant, for the "featured dishes" rail.

@ProviderFor(featuredDishes)
final featuredDishesProvider = FeaturedDishesProvider._();

/// One popular dish per top restaurant, for the "featured dishes" rail.

final class FeaturedDishesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Dish>>,
          List<Dish>,
          FutureOr<List<Dish>>
        >
    with $FutureModifier<List<Dish>>, $FutureProvider<List<Dish>> {
  /// One popular dish per top restaurant, for the "featured dishes" rail.
  FeaturedDishesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'featuredDishesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$featuredDishesHash();

  @$internal
  @override
  $FutureProviderElement<List<Dish>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Dish>> create(Ref ref) {
    return featuredDishes(ref);
  }
}

String _$featuredDishesHash() => r'19a92c2ea7c44315f78c1fd3459a2303552f16a2';
