import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../../../data/repositories/restaurant_repository.dart';

part 'restaurant_detail_providers.g.dart';

/// Full restaurant (including grouped menu) for the detail screen.
@riverpod
Future<Restaurant> restaurantDetail(Ref ref, String id) =>
    ref.watch(restaurantRepositoryProvider).detail(id);

/// A single dish with its customization groups (used by the sheet when opened
/// from a context that only has the dish id).
@riverpod
Future<Dish> dishDetail(Ref ref, String id) =>
    ref.watch(restaurantRepositoryProvider).dish(id);
