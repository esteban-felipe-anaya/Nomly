import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/notification.dart';
import 'guard.dart';

part 'favorites_repository.g.dart';

class FavoritesRepository {
  FavoritesRepository(this._api);
  final NomlyApi _api;

  Future<FavoritesData> get() => guard(() async {
        final all = await _api.getFavorites();
        return all.isNotEmpty ? all.first : const FavoritesData();
      });

  Future<FavoritesData> _save(FavoritesData data) =>
      guard(() => _api.updateFavorites(data.id, data));

  Future<FavoritesData> toggleRestaurant(String restaurantId) async {
    final current = await get();
    final list = [...current.restaurants];
    list.contains(restaurantId)
        ? list.remove(restaurantId)
        : list.add(restaurantId);
    return _save(current.copyWith(restaurants: list));
  }

  Future<FavoritesData> toggleDish(String dishId) async {
    final current = await get();
    final list = [...current.dishes];
    list.contains(dishId) ? list.remove(dishId) : list.add(dishId);
    return _save(current.copyWith(dishes: list));
  }
}

@Riverpod(keepAlive: true)
FavoritesRepository favoritesRepository(Ref ref) =>
    FavoritesRepository(ref.watch(nomlyApiProvider));
