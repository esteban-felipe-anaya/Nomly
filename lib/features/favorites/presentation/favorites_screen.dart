import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/notification.dart';
import '../../../data/models/restaurant.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/dish_tile.dart';
import '../../../shared/widgets/restaurant_card.dart';
import '../../../shared/widgets/shimmer_box.dart';
import '../../../shared/widgets/state_views.dart';
import '../../restaurant/application/restaurant_detail_providers.dart';
import '../application/favorites_controller.dart';

/// Favorites: a tabbed view of the user's saved restaurants and dishes. Each
/// item loads independently via its detail provider so it has its own
/// loading/error state.
class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesControllerProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Restaurants'),
              Tab(text: 'Dishes'),
            ],
          ),
        ),
        body: SafeArea(
          top: false,
          child: AsyncView<FavoritesData>(
            value: favorites,
            onRetry: () => ref.invalidate(favoritesControllerProvider),
            data: (data) => TabBarView(
              children: [
                _RestaurantsTab(ids: data.restaurants),
                _DishesTab(ids: data.dishes),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RestaurantsTab extends StatelessWidget {
  const _RestaurantsTab({required this.ids});

  final List<String> ids;

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty) {
      return const _FavoritesEmpty();
    }
    return CenteredConstrained(
      child: ResponsiveBuilder(
        builder: (context, layout) {
          final columns = gridColumnsForWidth(MediaQuery.sizeOf(context).width);
          if (columns <= 1) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.md),
              itemCount: ids.length,
              separatorBuilder: (_, _) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, i) =>
                  _FavoriteRestaurantCard(id: ids[i]),
            );
          }
          return GridView.builder(
            padding: AppSpacing.pageVertical,
            itemCount: ids.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisSpacing: AppSpacing.md,
              crossAxisSpacing: AppSpacing.md,
              childAspectRatio: 0.78,
            ),
            itemBuilder: (context, i) => _FavoriteRestaurantCard(id: ids[i]),
          );
        },
      ),
    );
  }
}

/// Loads a single favorite restaurant via its detail provider so it shows its
/// own skeleton / error independently of siblings.
class _FavoriteRestaurantCard extends ConsumerWidget {
  const _FavoriteRestaurantCard({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(restaurantDetailProvider(id));
    return AsyncView<Restaurant>(
      value: value,
      onRetry: () => ref.invalidate(restaurantDetailProvider(id)),
      loading: () => const RestaurantCardSkeleton(),
      data: (restaurant) => RestaurantCard(
        restaurant: restaurant,
        onTap: () => context.push(Routes.restaurantPath(restaurant.id)),
      ),
    );
  }
}

class _DishesTab extends StatelessWidget {
  const _DishesTab({required this.ids});

  final List<String> ids;

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty) {
      return const _FavoritesEmpty();
    }
    return CenteredConstrained(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        itemCount: ids.length,
        itemBuilder: (context, i) => _FavoriteDishTile(id: ids[i]),
      ),
    );
  }
}

/// Loads a single favorite dish via its detail provider; taps navigate to the
/// owning restaurant.
class _FavoriteDishTile extends ConsumerWidget {
  const _FavoriteDishTile({required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(dishDetailProvider(id));
    return AsyncView<Dish>(
      value: value,
      onRetry: () => ref.invalidate(dishDetailProvider(id)),
      loading: () => const _DishTileSkeleton(),
      data: (dish) => DishTile(
        dish: dish,
        onTap: () => context.push(Routes.restaurantPath(dish.restaurantId)),
      ),
    );
  }
}

class _FavoritesEmpty extends StatelessWidget {
  const _FavoritesEmpty();

  @override
  Widget build(BuildContext context) {
    return const EmptyView(
      icon: Icons.favorite_border_rounded,
      title: 'No favorites yet',
      message: 'Tap the heart on any restaurant or dish to save it here',
    );
  }
}

class _DishTileSkeleton extends StatelessWidget {
  const _DishTileSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(width: 140, height: 16),
                SizedBox(height: AppSpacing.sm),
                ShimmerBox(width: 200, height: 12),
                SizedBox(height: AppSpacing.sm),
                ShimmerBox(width: 60, height: 14),
              ],
            ),
          ),
          SizedBox(width: AppSpacing.md),
          ShimmerBox(width: 104, height: 104, radius: AppRadius.md),
        ],
      ),
    );
  }
}
