import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../../core/storage/preferences.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../../../data/models/restaurant_filter.dart';
import '../../../data/repositories/restaurant_repository.dart';

part 'search_providers.g.dart';

/// Restaurant matches for a query.
@riverpod
Future<List<Restaurant>> searchRestaurants(Ref ref, String query) {
  if (query.trim().isEmpty) return Future.value(const []);
  return ref
      .watch(restaurantRepositoryProvider)
      .list(RestaurantFilter(query: query));
}

/// Dish matches for a query (full-text via the mock API).
@riverpod
Future<List<Dish>> searchDishesResults(Ref ref, String query) {
  if (query.trim().isEmpty) return Future.value(const []);
  return ref.watch(restaurantRepositoryProvider).searchDishes(query);
}

/// Recent search terms, persisted across launches (most-recent first, max 8).
@Riverpod(keepAlive: true)
class RecentSearches extends _$RecentSearches {
  Preferences get _prefs => ref.read(preferencesProvider);
  static const _max = 8;

  @override
  List<String> build() => _prefs.getStringList(Preferences.kRecentSearches);

  void add(String term) {
    final t = term.trim();
    if (t.isEmpty) return;
    final next = [t, ...state.where((e) => e.toLowerCase() != t.toLowerCase())]
        .take(_max)
        .toList();
    state = next;
    _prefs.setStringList(Preferences.kRecentSearches, next);
  }

  void clear() {
    state = const [];
    _prefs.setStringList(Preferences.kRecentSearches, const []);
  }
}
