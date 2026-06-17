import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/catalog.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../../../data/models/restaurant_filter.dart';
import '../../../data/repositories/catalog_repository.dart';
import '../../../data/repositories/restaurant_repository.dart';

part 'home_providers.g.dart';

@riverpod
Future<List<Cuisine>> cuisines(Ref ref) =>
    ref.watch(catalogRepositoryProvider).cuisines();

@riverpod
Future<List<PromoBanner>> banners(Ref ref) =>
    ref.watch(catalogRepositoryProvider).banners();

@riverpod
Future<List<Restaurant>> popularRestaurants(Ref ref) =>
    ref.watch(restaurantRepositoryProvider).list(
          const RestaurantFilter(sort: RestaurantSort.rating),
        );

/// One popular dish per top restaurant, for the "featured dishes" rail.
@riverpod
Future<List<Dish>> featuredDishes(Ref ref) async {
  final repo = ref.watch(restaurantRepositoryProvider);
  final tops = await ref.watch(popularRestaurantsProvider.future);
  final picks = tops.take(6).toList();
  final menus = await Future.wait(picks.map((r) => repo.menu(r.id)));
  final dishes = <Dish>[];
  for (final menu in menus) {
    final all = menu.expand((c) => c.items).toList();
    if (all.isEmpty) continue;
    dishes.add(all.firstWhere((d) => d.popular, orElse: () => all.first));
  }
  return dishes;
}
