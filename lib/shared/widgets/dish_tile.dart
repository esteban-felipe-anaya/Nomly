import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';
import '../../data/models/dish.dart';
import 'app_network_image.dart';

/// Horizontal dish row used on restaurant menus and search results: text on the
/// left, photo + add button on the right.
class DishTile extends StatelessWidget {
  const DishTile({
    super.key,
    required this.dish,
    required this.onTap,
    this.onAdd,
    this.trailingBadge,
  });

  final Dish dish;
  final VoidCallback onTap;
  final VoidCallback? onAdd;
  final Widget? trailingBadge;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (dish.popular) ...[
                        Icon(Icons.local_fire_department_rounded,
                            size: 16, color: context.nomly.rating),
                        const SizedBox(width: 4),
                      ],
                      Flexible(
                        child: Text(dish.name,
                            style:
                                t.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(dish.description,
                      style: t.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: AppSpacing.sm),
                  Text(Formatters.money(dish.price, currency: dish.currency),
                      style: t.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Stack(
              clipBehavior: Clip.none,
              children: [
                AppNetworkImage(
                  url: dish.image,
                  width: 104,
                  height: 104,
                  borderRadius: AppRadius.image,
                ),
                if (onAdd != null)
                  Positioned(
                    right: -6,
                    bottom: -6,
                    child: Material(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: const CircleBorder(),
                      elevation: AppElevation.low,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: onAdd,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(Icons.add_rounded,
                              color:
                                  Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                      ),
                    ),
                  ),
                if (trailingBadge != null)
                  Positioned(top: -6, right: -6, child: trailingBadge!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
