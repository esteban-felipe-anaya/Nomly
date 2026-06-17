import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../data/models/restaurant_filter.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/cart_badge_button.dart';
import '../../../shared/widgets/restaurant_card.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/restaurants_providers.dart';
import 'widgets/filter_sheet.dart';

class RestaurantsScreen extends ConsumerWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(restaurantFilterControllerProvider);
    final list = ref.watch(restaurantsListProvider);
    final controller = ref.read(restaurantFilterControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        actions: [
          IconButton(
            tooltip: 'Filters',
            onPressed: () => FilterSheet.show(context),
            icon: Badge(
              isLabelVisible: filter.activeCount > 0,
              label: Text('${filter.activeCount}'),
              child: const Icon(Icons.tune_rounded),
            ),
          ),
          const CartBadgeButton(),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: _SortBar(
            sort: filter.sort,
            onChanged: controller.setSort,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(restaurantsListProvider),
        child: AsyncView(
          value: list,
          onRetry: () => ref.invalidate(restaurantsListProvider),
          loading: () => _grid(
            context,
            itemCount: 6,
            builder: (_, _) => const RestaurantCardSkeleton(),
          ),
          data: (restaurants) {
            if (restaurants.isEmpty) {
              return EmptyView(
                title: 'No restaurants match',
                message: 'Try clearing some filters.',
                icon: Icons.storefront_outlined,
                action: FilledButton.tonal(
                  onPressed: controller.reset,
                  child: const Text('Clear filters'),
                ),
              );
            }
            return _grid(
              context,
              itemCount: restaurants.length,
              builder: (context, i) => RestaurantCard(
                restaurant: restaurants[i],
                onTap: () =>
                    context.push(Routes.restaurantPath(restaurants[i].id)),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _grid(
    BuildContext context, {
    required int itemCount,
    required Widget Function(BuildContext, int) builder,
  }) {
    return CenteredConstrained(
      maxWidth: 1300,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = gridColumnsForWidth(constraints.maxWidth);
          return GridView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.md,
              mainAxisExtent: 268,
            ),
            itemCount: itemCount,
            itemBuilder: builder,
          );
        },
      ),
    );
  }
}

class _SortBar extends StatelessWidget {
  const _SortBar({required this.sort, required this.onChanged});
  final RestaurantSort sort;
  final ValueChanged<RestaurantSort> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        children: [
          for (final s in RestaurantSort.values)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.sm),
              child: ChoiceChip(
                label: Text(s.label),
                selected: sort == s,
                onSelected: (_) => onChanged(s),
              ),
            ),
        ],
      ),
    );
  }
}
