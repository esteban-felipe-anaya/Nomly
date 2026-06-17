import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/dish.dart';
import '../models/restaurant.dart';
import '../models/restaurant_filter.dart';
import 'guard.dart';

part 'restaurant_repository.g.dart';

class RestaurantRepository {
  RestaurantRepository(this._api);
  final NomlyApi _api;

  Future<List<Restaurant>> list(RestaurantFilter filter) => guard(() async {
        var results = await _api.getRestaurants(filter.toQuery());
        // `offersOnly` has no server param; apply client-side.
        if (filter.offersOnly) {
          results = results.where((r) => r.hasOffers).toList();
        }
        return results;
      });

  Future<Restaurant> detail(String id) => guard(() => _api.getRestaurant(id));

  Future<List<MenuCategory>> menu(String id) => guard(() => _api.getMenu(id));

  Future<Dish> dish(String id) => guard(() => _api.getDish(id));

  Future<List<Dish>> searchDishes(String query) =>
      guard(() => _api.searchDishes({'q': query}));
}

@Riverpod(keepAlive: true)
RestaurantRepository restaurantRepository(Ref ref) =>
    RestaurantRepository(ref.watch(nomlyApiProvider));
