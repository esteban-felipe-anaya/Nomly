import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/cart_item.dart';
import '../../../data/models/order.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/shimmer_box.dart';
import '../../../shared/widgets/state_views.dart';
import '../../cart/application/cart_controller.dart';
import '../../restaurant/application/restaurant_detail_providers.dart';
import '../application/orders_providers.dart';
import 'orders_screen.dart';

class OrderDetailScreen extends ConsumerWidget {
  const OrderDetailScreen({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(orderDetailProvider(orderId));
    return Scaffold(
      appBar: AppBar(title: const Text('Order details')),
      body: SafeArea(
        child: AsyncView<Order>(
          value: order,
          onRetry: () => ref.invalidate(orderDetailProvider(orderId)),
          loading: () => const _OrderDetailSkeleton(),
          data: (data) => _OrderDetailBody(order: data),
        ),
      ),
    );
  }
}

class _OrderDetailBody extends ConsumerWidget {
  const _OrderDetailBody({required this.order});

  final Order order;

  Future<void> _reorder(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    try {
      final now = DateTime.now().microsecondsSinceEpoch;
      final items = <CartItem>[
        for (var i = 0; i < order.items.length; i++)
          CartItem(
            id: '${now + i}',
            dishId: order.items[i].dishId,
            restaurantId: order.items[i].restaurantId,
            restaurantName: order.restaurantName,
            name: order.items[i].name,
            image: order.items[i].image,
            unitPrice: order.items[i].unitPrice,
            currency: 'USD',
            quantity: order.items[i].quantity,
            selectedOptions: order.items[i].selectedOptions,
            instructions: order.items[i].instructions,
          ),
      ];
      final restaurant =
          await ref.read(restaurantDetailProvider(order.restaurantId).future);
      ref.read(cartControllerProvider.notifier).setCart(
            items: items,
            restaurantId: order.restaurantId,
            restaurantName: order.restaurantName,
            baseDeliveryFee: restaurant.deliveryFee,
          );
      messenger.showSnackBar(
        const SnackBar(content: Text('Items added to your cart')),
      );
      router.push(Routes.cart);
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Couldn’t reorder. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.scheme;
    return CenteredConstrained(
      child: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.xxl),
        children: [
          AppNetworkImage(
            url: order.restaurantCover,
            height: 180,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.restaurantName,
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    _StatusPill(status: order.status),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        Formatters.dateTime(order.placedAtDate),
                        style: context.textTheme.bodyMedium
                            ?.copyWith(color: scheme.onSurfaceVariant),
                      ),
                    ),
                  ],
                ),
                if (order.isActive) ...[
                  const SizedBox(height: AppSpacing.lg),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () =>
                          context.push(Routes.trackingPath(order.id)),
                      icon: const Icon(Icons.map_outlined),
                      label: const Text('Track order'),
                    ),
                  ),
                ],
                const SizedBox(height: AppSpacing.xl),
                Text('Items', style: context.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                for (final item in order.items) _OrderItemRow(item: item),
                const SizedBox(height: AppSpacing.xl),
                Text('Summary', style: context.textTheme.titleMedium),
                const SizedBox(height: AppSpacing.sm),
                _Totals(totals: order.totals),
                const Divider(height: AppSpacing.xl),
                _InfoRow(
                  icon: Icons.payment_outlined,
                  label: 'Payment',
                  value: order.paymentMethod,
                ),
                const SizedBox(height: AppSpacing.md),
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Delivery address',
                  value: order.addressId,
                ),
                const SizedBox(height: AppSpacing.xl),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.tonalIcon(
                    onPressed: () => _reorder(context, ref),
                    icon: const Icon(Icons.replay),
                    label: const Text('Reorder'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderItemRow extends StatelessWidget {
  const _OrderItemRow({required this.item});

  final OrderItem item;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    final options = item.selectedOptions.map((o) => o.name).join(', ');
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Text(
              '${item.quantity}×',
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: context.textTheme.bodyLarge),
                if (options.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    options,
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: scheme.onSurfaceVariant),
                  ),
                ],
                if (item.instructions.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    item.instructions,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            Formatters.money(item.lineTotal),
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _Totals extends StatelessWidget {
  const _Totals({required this.totals});

  final OrderTotals totals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TotalRow(label: 'Subtotal', value: Formatters.money(totals.subtotal)),
        if (totals.discount > 0)
          _TotalRow(
            label: 'Discount',
            value: '−${Formatters.money(totals.discount)}',
          ),
        _TotalRow(
          label: 'Delivery fee',
          value: Formatters.fee(totals.deliveryFee),
        ),
        _TotalRow(
            label: 'Service fee', value: Formatters.money(totals.serviceFee)),
        _TotalRow(label: 'Tax', value: Formatters.money(totals.tax)),
        if (totals.tip > 0)
          _TotalRow(label: 'Tip', value: Formatters.money(totals.tip)),
        const SizedBox(height: AppSpacing.xs),
        _TotalRow(
          label: 'Total',
          value: Formatters.money(totals.total),
          emphasize: true,
        ),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)
        : context.textTheme.bodyMedium
            ?.copyWith(color: context.scheme.onSurfaceVariant);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = context.scheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: scheme.onSurfaceVariant),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textTheme.bodySmall
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: AppSpacing.xxs),
              Text(value, style: context.textTheme.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});

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

class _OrderDetailSkeleton extends StatelessWidget {
  const _OrderDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return CenteredConstrained(
      child: ListView(
        children: [
          const ShimmerBox(height: 180, radius: 0),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerBox(width: 200, height: 24),
                SizedBox(height: AppSpacing.md),
                ShimmerBox(width: 140, height: 14),
                SizedBox(height: AppSpacing.xl),
                ShimmerBox(height: 14),
                SizedBox(height: AppSpacing.md),
                ShimmerBox(height: 14),
                SizedBox(height: AppSpacing.md),
                ShimmerBox(height: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
