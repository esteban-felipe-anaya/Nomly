import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/order.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/shimmer_box.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/orders_providers.dart';

/// Maps an order status string to a friendly, human-readable label.
String orderStatusLabel(String status) {
  switch (status) {
    case 'confirmed':
      return 'Confirmed';
    case 'preparing':
      return 'Preparing';
    case 'picked_up':
      return 'Picked up';
    case 'on_the_way':
      return 'On the way';
    case 'delivered':
      return 'Delivered';
    default:
      return 'Confirmed';
  }
}

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref.watch(ordersListProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your orders')),
      body: SafeArea(
        child: AsyncView<List<Order>>(
          value: orders,
          onRetry: () => ref.invalidate(ordersListProvider),
          loading: () => const _OrdersSkeleton(),
          data: (list) {
            if (list.isEmpty) {
              return EmptyView(
                title: 'No orders yet',
                message: 'When you place an order it will show up here.',
                icon: Icons.receipt_long_outlined,
                action: FilledButton(
                  onPressed: () => context.go(Routes.restaurants),
                  child: const Text('Browse restaurants'),
                ),
              );
            }

            final active = list.where((o) => o.isActive).toList();
            final past = list.where((o) => !o.isActive).toList();

            return CenteredConstrained(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.lg,
                ),
                children: [
                  if (active.isNotEmpty) ...[
                    for (final order in active) ...[
                      _ActiveOrderCard(order: order),
                      const SizedBox(height: AppSpacing.lg),
                    ],
                  ],
                  if (past.isNotEmpty) ...[
                    Text('Past orders', style: context.textTheme.titleMedium),
                    const SizedBox(height: AppSpacing.md),
                    for (final order in past) ...[
                      _PastOrderCard(order: order),
                      const SizedBox(height: AppSpacing.md),
                    ],
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ActiveOrderCard extends StatelessWidget {
  const _ActiveOrderCard({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.local_shipping_outlined,
                    color: scheme.onPrimaryContainer),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    orderStatusLabel(order.status),
                    style: context.textTheme.titleMedium?.copyWith(
                      color: scheme.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              order.restaurantName,
              style: context.textTheme.titleSmall
                  ?.copyWith(color: scheme.onPrimaryContainer),
            ),
            if (order.etaMinutes > 0) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Arriving in ${Formatters.minutes(order.etaMinutes)}',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: scheme.onPrimaryContainer.withValues(alpha: 0.8),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.icon(
                onPressed: () =>
                    context.push(Routes.trackingPath(order.id)),
                icon: const Icon(Icons.map_outlined),
                label: const Text('Track order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PastOrderCard extends StatelessWidget {
  const _PastOrderCard({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Card(
      child: InkWell(
        onTap: () => context.push(Routes.orderPath(order.id)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(
                url: order.restaurantCover,
                width: 64,
                height: 64,
                borderRadius: AppRadius.image,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.restaurantName,
                      style: context.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      Formatters.date(order.placedAtDate),
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      '${order.itemCount} '
                      '${order.itemCount == 1 ? 'item' : 'items'} · '
                      '${Formatters.money(order.totals.total)}',
                      style: context.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _StatusChip(status: order.status),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final delivered = status == 'delivered';
    final bg = delivered
        ? context.nomly.successContainer
        : scheme.secondaryContainer;
    final fg = delivered
        ? context.nomly.onSuccessContainer
        : scheme.onSecondaryContainer;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        orderStatusLabel(status),
        style: context.textTheme.labelMedium
            ?.copyWith(color: fg, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _OrdersSkeleton extends StatelessWidget {
  const _OrdersSkeleton();

  @override
  Widget build(BuildContext context) {
    return CenteredConstrained(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        children: [
          const ShimmerBox(height: 140, radius: AppRadius.lg),
          const SizedBox(height: AppSpacing.lg),
          for (var i = 0; i < 4; i++) ...[
            ShimmerArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: context.scheme.surfaceContainerHighest,
                      borderRadius: AppRadius.image,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(width: 160, height: 16),
                        SizedBox(height: AppSpacing.sm),
                        ShimmerBox(width: 100, height: 12),
                        SizedBox(height: AppSpacing.sm),
                        ShimmerBox(width: 120, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ],
      ),
    );
  }
}
