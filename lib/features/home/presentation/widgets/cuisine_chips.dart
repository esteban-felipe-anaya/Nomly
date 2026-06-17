import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../data/models/cuisine_icons.dart';
import '../../../restaurants/application/restaurants_providers.dart';
import '../../application/home_providers.dart';

/// Horizontal row of cuisine FilterChips. Tapping one applies the cuisine
/// filter and jumps to the restaurants feed.
class CuisineChips extends ConsumerWidget {
  const CuisineChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cuisines = ref.watch(cuisinesProvider);
    final selected = ref.watch(
        restaurantFilterControllerProvider.select((f) => f.cuisineId));

    return cuisines.when(
      data: (list) => SizedBox(
        height: 44,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: list.length,
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
          itemBuilder: (context, i) {
            final c = list[i];
            return FilterChip(
              avatar: Icon(cuisineIcon(c.icon), size: 18),
              label: Text(c.name),
              selected: selected == c.id,
              onSelected: (_) {
                ref
                    .read(restaurantFilterControllerProvider.notifier)
                    .setCuisine(c.id);
                context.go(Routes.restaurants);
              },
            );
          },
        ),
      ),
      loading: () => SizedBox(
        height: 44,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: AppSpacing.page,
          itemCount: 6,
          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
          itemBuilder: (_, _) => const Chip(label: SizedBox(width: 56)),
        ),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
