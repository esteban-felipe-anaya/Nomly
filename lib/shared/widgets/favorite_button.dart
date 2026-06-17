import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/favorites/application/favorites_controller.dart';

/// Heart toggle for a restaurant. Reads & writes the favorites controller, so
/// state stays consistent everywhere the restaurant appears.
class FavoriteRestaurantButton extends ConsumerWidget {
  const FavoriteRestaurantButton({super.key, required this.restaurantId, this.filled = false});
  final String restaurantId;
  final bool filled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favoritesControllerProvider);
    final isFav = favs.value?.restaurants.contains(restaurantId) ?? false;
    return _HeartButton(
      isFav: isFav,
      filled: filled,
      onTap: () =>
          ref.read(favoritesControllerProvider.notifier).toggleRestaurant(restaurantId),
    );
  }
}

/// Heart toggle for a dish.
class FavoriteDishButton extends ConsumerWidget {
  const FavoriteDishButton({super.key, required this.dishId, this.filled = false});
  final String dishId;
  final bool filled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favs = ref.watch(favoritesControllerProvider);
    final isFav = favs.value?.dishes.contains(dishId) ?? false;
    return _HeartButton(
      isFav: isFav,
      filled: filled,
      onTap: () => ref.read(favoritesControllerProvider.notifier).toggleDish(dishId),
    );
  }
}

class _HeartButton extends StatelessWidget {
  const _HeartButton({required this.isFav, required this.onTap, this.filled = false});
  final bool isFav;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final icon = Icon(
      isFav ? Icons.favorite_rounded : Icons.favorite_border_rounded,
      color: isFav ? scheme.error : (filled ? scheme.onSurface : scheme.onSurfaceVariant),
      size: 22,
    );
    if (filled) {
      return Material(
        color: scheme.surface.withValues(alpha: 0.9),
        shape: const CircleBorder(),
        child: IconButton(onPressed: onTap, icon: icon, tooltip: 'Favorite'),
      );
    }
    return IconButton(onPressed: onTap, icon: icon, tooltip: 'Favorite');
  }
}
