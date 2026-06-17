import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/formatters.dart';
import '../../../orders/application/orders_providers.dart';

/// Live "track your order" banner shown on home when an order is in progress.
class ActiveOrderBanner extends ConsumerWidget {
  const ActiveOrderBanner({super.key});

  static const _labels = {
    'confirmed': 'Order confirmed',
    'preparing': 'Preparing your food',
    'picked_up': 'Courier picked up your order',
    'on_the_way': 'On the way to you',
    'delivered': 'Delivered',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(activeOrderProvider).value;
    if (active == null) return const SizedBox.shrink();
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, AppSpacing.sm),
      child: Material(
        color: scheme.primaryContainer,
        borderRadius: AppRadius.card,
        child: InkWell(
          borderRadius: AppRadius.card,
          onTap: () => context.push(Routes.trackingPath(active.id)),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Icon(Icons.delivery_dining_rounded,
                    size: 36, color: scheme.onPrimaryContainer),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_labels[active.status] ?? 'In progress',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: scheme.onPrimaryContainer,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Text(
                          '${active.restaurantName} · ETA ${Formatters.minutes(active.etaMinutes)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: scheme.onPrimaryContainer
                                  .withValues(alpha: 0.85))),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, color: scheme.onPrimaryContainer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
