// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Holds the active restaurant filter/sort. Driven by the filter sheet and the
/// home cuisine chips.

@ProviderFor(RestaurantFilterController)
final restaurantFilterControllerProvider =
    RestaurantFilterControllerProvider._();

/// Holds the active restaurant filter/sort. Driven by the filter sheet and the
/// home cuisine chips.
final class RestaurantFilterControllerProvider
    extends $NotifierProvider<RestaurantFilterController, RestaurantFilter> {
  /// Holds the active restaurant filter/sort. Driven by the filter sheet and the
  /// home cuisine chips.
  RestaurantFilterControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restaurantFilterControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restaurantFilterControllerHash();

  @$internal
  @override
  RestaurantFilterController create() => RestaurantFilterController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RestaurantFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RestaurantFilter>(value),
    );
  }
}

String _$restaurantFilterControllerHash() =>
    r'7f87fc7437dd2604ce2c4ff4555eae7663bd6b44';

/// Holds the active restaurant filter/sort. Driven by the filter sheet and the
/// home cuisine chips.

abstract class _$RestaurantFilterController
    extends $Notifier<RestaurantFilter> {
  RestaurantFilter build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RestaurantFilter, RestaurantFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RestaurantFilter, RestaurantFilter>,
              RestaurantFilter,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The restaurant feed, recomputed whenever the filter changes.

@ProviderFor(restaurantsList)
final restaurantsListProvider = RestaurantsListProvider._();

/// The restaurant feed, recomputed whenever the filter changes.

final class RestaurantsListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Restaurant>>,
          List<Restaurant>,
          FutureOr<List<Restaurant>>
        >
    with $FutureModifier<List<Restaurant>>, $FutureProvider<List<Restaurant>> {
  /// The restaurant feed, recomputed whenever the filter changes.
  RestaurantsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'restaurantsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$restaurantsListHash();

  @$internal
  @override
  $FutureProviderElement<List<Restaurant>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Restaurant>> create(Ref ref) {
    return restaurantsList(ref);
  }
}

String _$restaurantsListHash() => r'964fef1906d2d33d5b7de05f655ee22df3bcfba8';
