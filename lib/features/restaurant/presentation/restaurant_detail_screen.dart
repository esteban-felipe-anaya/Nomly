import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/restaurant.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/badges.dart';
import '../../../shared/widgets/cart_badge_button.dart';
import '../../../shared/widgets/dish_tile.dart';
import '../../../shared/widgets/favorite_button.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/restaurant_detail_providers.dart';
import '../widgets/dish_customization_sheet.dart';
import 'widgets/cart_side_panel.dart';

class RestaurantDetailScreen extends ConsumerWidget {
  const RestaurantDetailScreen({super.key, required this.restaurantId});
  final String restaurantId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detail = ref.watch(restaurantDetailProvider(restaurantId));
    return Scaffold(
      body: AsyncView(
        value: detail,
        onRetry: () => ref.invalidate(restaurantDetailProvider(restaurantId)),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (restaurant) {
          if (context.isExpanded) {
            return Row(
              children: [
                Expanded(flex: 3, child: _DetailBody(restaurant: restaurant)),
                const VerticalDivider(width: 1),
                SizedBox(
                    width: 360,
                    child: CartSidePanel(restaurantId: restaurant.id)),
              ],
            );
          }
          return _DetailBody(restaurant: restaurant);
        },
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  const _DetailBody({required this.restaurant});
  final Restaurant restaurant;

  void _openDish(BuildContext context, dish) =>
      DishCustomizationSheet.show(context, dish: dish, restaurant: restaurant);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          pinned: true,
          expandedHeight: 240,
          actions: [
            FavoriteRestaurantButton(restaurantId: restaurant.id, filled: true),
            const CartBadgeButton(),
            const SizedBox(width: AppSpacing.sm),
          ],
          flexibleSpace: FlexibleSpaceBar(
            title: Text(restaurant.name,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            background: Stack(
              fit: StackFit.expand,
              children: [
                AppNetworkImage(url: restaurant.cover),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.cuisine, style: theme.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: restaurant.rating,
                      itemCount: 5,
                      itemSize: 18,
                      itemBuilder: (_, _) => Icon(Icons.star_rounded,
                          color: context.nomly.rating),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                        '${restaurant.rating.toStringAsFixed(1)} (${restaurant.ratingCount}+)',
                        style: theme.textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                MetaRow(
                  parts: restaurantMeta(
                    minutes: restaurant.deliveryMinutes,
                    deliveryFee: restaurant.deliveryFee,
                    priceLevel: restaurant.priceLevel,
                    distanceKm: restaurant.distanceKm,
                  ),
                ),
                if (restaurant.freeDelivery || restaurant.hasOffers) ...[
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.xs,
                    children: [
                      if (restaurant.freeDelivery) const FreeDeliveryChip(),
                      for (final o in restaurant.offers) OfferChip(label: o),
                    ],
                  ),
                ],
                if (restaurant.description.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(restaurant.description,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant)),
                ],
              ],
            ),
          ),
        ),
        for (final category in restaurant.menu)
          SliverMainAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(AppSpacing.lg,
                      AppSpacing.md, AppSpacing.lg, AppSpacing.xs),
                  child: Text(category.category,
                      style: theme.textTheme.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700)),
                ),
              ),
              SliverList.separated(
                itemCount: category.items.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final dish = category.items[i];
                  return DishTile(
                    dish: dish,
                    onTap: () => _openDish(context, dish),
                    onAdd: () => _openDish(context, dish),
                  );
                },
              ),
            ],
          ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxxl)),
      ],
    );
  }
}
