import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/restaurant.dart';
import '../../../data/models/restaurant_filter.dart';
import '../../../data/repositories/restaurant_repository.dart';

part 'restaurants_providers.g.dart';

/// Holds the active restaurant filter/sort. Driven by the filter sheet and the
/// home cuisine chips.
@Riverpod(keepAlive: true)
class RestaurantFilterController extends _$RestaurantFilterController {
  @override
  RestaurantFilter build() => const RestaurantFilter();

  void apply(RestaurantFilter filter) => state = filter;
  void reset() => state = const RestaurantFilter();

  void setCuisine(String? id) =>
      state = state.copyWith(cuisineId: () => id);
  void setQuery(String? q) => state = state.copyWith(query: () => q);
  void setSort(RestaurantSort sort) => state = state.copyWith(sort: sort);
  void setMinRating(double? r) => state = state.copyWith(minRating: () => r);
  void setPriceLevel(int? p) => state = state.copyWith(priceLevel: () => p);
  void toggleFreeDelivery() =>
      state = state.copyWith(freeDelivery: !state.freeDelivery);
  void toggleOffersOnly() =>
      state = state.copyWith(offersOnly: !state.offersOnly);
}

/// The restaurant feed, recomputed whenever the filter changes.
@riverpod
Future<List<Restaurant>> restaurantsList(Ref ref) {
  final filter = ref.watch(restaurantFilterControllerProvider);
  return ref.watch(restaurantRepositoryProvider).list(filter);
}
