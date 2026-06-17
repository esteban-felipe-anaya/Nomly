import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/notification.dart';
import '../../../data/repositories/favorites_repository.dart';

part 'favorites_controller.g.dart';

/// Loads and toggles the user's favorite restaurants and dishes. Favorites are
/// persisted server-side (mock API) so they survive relaunch.
@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  FavoritesRepository get _repo => ref.read(favoritesRepositoryProvider);

  @override
  Future<FavoritesData> build() => _repo.get();

  Future<void> toggleRestaurant(String id) async {
    final updated = await _repo.toggleRestaurant(id);
    state = AsyncData(updated);
  }

  Future<void> toggleDish(String id) async {
    final updated = await _repo.toggleDish(id);
    state = AsyncData(updated);
  }

  bool isRestaurantFavorite(String id) =>
      state.value?.restaurants.contains(id) ?? false;

  bool isDishFavorite(String id) =>
      state.value?.dishes.contains(id) ?? false;
}
