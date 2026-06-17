import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../data/models/restaurant.dart';
import 'app_network_image.dart';
import 'badges.dart';
import 'favorite_button.dart';
import 'shimmer_box.dart';

/// The primary restaurant card used across home rails, the restaurants feed and
/// favorites. Adapts to a fixed [width] for horizontal rails or fills its slot.
class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
    this.width,
  });

  final Restaurant restaurant;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SizedBox(
      width: width,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AppNetworkImage(
                    url: restaurant.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                  Positioned(
                    top: AppSpacing.xs,
                    right: AppSpacing.xs,
                    child: FavoriteRestaurantButton(
                        restaurantId: restaurant.id, filled: true),
                  ),
                  if (restaurant.freeDelivery)
                    const Positioned(
                        bottom: AppSpacing.sm,
                        left: AppSpacing.sm,
                        child: FreeDeliveryChip()),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(restaurant.name,
                              style: t.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        RatingBadge(
                            rating: restaurant.rating,
                            count: restaurant.ratingCount,
                            dense: true),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(restaurant.cuisine,
                        style: t.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: AppSpacing.sm),
                    MetaRow(
                      parts: restaurantMeta(
                        minutes: restaurant.deliveryMinutes,
                        deliveryFee: restaurant.deliveryFee,
                        priceLevel: restaurant.priceLevel,
                        distanceKm: restaurant.distanceKm,
                      ),
                    ),
                    if (restaurant.hasOffers) ...[
                      const SizedBox(height: AppSpacing.sm),
                      OfferChip(label: restaurant.offers.first),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Skeleton placeholder matching [RestaurantCard]'s shape.
class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({super.key, this.width});
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ShimmerBox(height: 150, radius: 0),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerBox(width: 160, height: 16),
                  SizedBox(height: AppSpacing.sm),
                  ShimmerBox(width: 100, height: 12),
                  SizedBox(height: AppSpacing.sm),
                  ShimmerBox(width: 180, height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
