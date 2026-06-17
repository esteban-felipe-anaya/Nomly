import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/dish.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/cart_badge_button.dart';
import '../../../shared/widgets/restaurant_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/shimmer_box.dart';
import '../../address/application/address_controller.dart';
import '../../notifications/application/notifications_providers.dart';
import '../../orders/application/orders_providers.dart';
import '../application/home_providers.dart';
import 'widgets/active_order_banner.dart';
import 'widgets/cuisine_chips.dart';
import 'widgets/promo_carousel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(selectedAddressProvider);
    final unread = ref.watch(unreadNotificationCountProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CenteredConstrained(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(popularRestaurantsProvider);
              ref.invalidate(featuredDishesProvider);
              ref.invalidate(bannersProvider);
              ref.invalidate(activeOrderProvider);
            },
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg, AppSpacing.sm, AppSpacing.sm, 0),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: _AddressBar(
                            label: address?.label ?? 'Set delivery address',
                            summary: address?.summary ?? 'Tap to choose where to deliver',
                            onTap: () => context.push(Routes.selectAddress),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Notifications',
                          onPressed: () => context.push(Routes.notifications),
                          icon: Badge(
                            isLabelVisible: unread > 0,
                            label: Text('$unread'),
                            child: const Icon(Icons.notifications_outlined),
                          ),
                        ),
                        const CartBadgeButton(),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.sm),
                  sliver: SliverToBoxAdapter(
                    child: _SearchEntry(onTap: () => context.go(Routes.search)),
                  ),
                ),
                const SliverToBoxAdapter(child: ActiveOrderBanner()),
                const SliverToBoxAdapter(child: PromoCarousel()),
                const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
                const SliverToBoxAdapter(child: CuisineChips()),
                SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Popular near you',
                    actionLabel: 'See all',
                    onAction: () => context.go(Routes.restaurants),
                  ),
                ),
                const SliverToBoxAdapter(child: _PopularRail()),
                const SliverToBoxAdapter(
                  child: SectionHeader(title: 'Featured dishes'),
                ),
                const SliverToBoxAdapter(child: _FeaturedDishesRail()),
                const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xxl)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AddressBar extends StatelessWidget {
  const _AddressBar({required this.label, required this.summary, required this.onTap});
  final String label;
  final String summary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.md),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        child: Row(
          children: [
            Icon(Icons.location_on, color: theme.colorScheme.primary),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text('Deliver to · $label',
                            style: theme.textTheme.labelMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
                    ],
                  ),
                  Text(summary,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTap: onTap,
      hintText: 'Search restaurants or dishes',
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor:
          WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainerHighest),
    );
  }
}

class _PopularRail extends ConsumerWidget {
  const _PopularRail();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popular = ref.watch(popularRestaurantsProvider);
    return SizedBox(
      height: 284,
      child: popular.when(
        data: (list) => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: list.length,
          itemBuilder: (context, i) => RestaurantCard(
            restaurant: list[i],
            width: 270,
            onTap: () => context.push(Routes.restaurantPath(list[i].id)),
          ),
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        ),
        loading: () => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: 4,
          itemBuilder: (_, _) => const RestaurantCardSkeleton(width: 270),
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        ),
        error: (_, _) => const Center(child: Text('Could not load restaurants')),
      ),
    );
  }
}

class _FeaturedDishesRail extends ConsumerWidget {
  const _FeaturedDishesRail();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dishes = ref.watch(featuredDishesProvider);
    return SizedBox(
      height: 210,
      child: dishes.when(
        data: (list) => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: list.length,
          itemBuilder: (context, i) => _FeaturedDishCard(dish: list[i]),
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        ),
        loading: () => ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: 4,
          itemBuilder: (_, _) => const SizedBox(
              width: 160,
              child: Card(child: ShimmerBox(height: 210, radius: 0))),
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
        ),
        error: (_, _) => const SizedBox.shrink(),
      ),
    );
  }
}

class _FeaturedDishCard extends StatelessWidget {
  const _FeaturedDishCard({required this.dish});
  final Dish dish;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return SizedBox(
      width: 160,
      child: Card(
        child: InkWell(
          onTap: () => context.push(Routes.restaurantPath(dish.restaurantId)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(url: dish.image, height: 120, width: 160),
              Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(dish.name,
                        style: t.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(Formatters.money(dish.price, currency: dish.currency),
                        style: t.bodyMedium
                            ?.copyWith(color: context.scheme.primary)),
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
