import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../shared/widgets/quantity_stepper.dart';
import '../../../../shared/widgets/state_views.dart';
import '../../../cart/application/cart_controller.dart';

/// Persistent cart summary shown beside the menu on expanded (desktop/web)
/// layouts. Mirrors the cart screen at a glance and links to checkout.
class CartSidePanel extends ConsumerWidget {
  const CartSidePanel({super.key, required this.restaurantId});
  final String restaurantId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    final notifier = ref.read(cartControllerProvider.notifier);
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Row(
              children: [
                Icon(Icons.shopping_bag_outlined, color: theme.colorScheme.primary),
                const SizedBox(width: AppSpacing.sm),
                Text('Your cart', style: theme.textTheme.titleLarge),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: cart.isEmpty
                ? const EmptyView(
                    title: 'Cart is empty',
                    message: 'Add dishes from the menu to get started.',
                    icon: Icons.shopping_bag_outlined,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    itemCount: cart.items.length,
                    separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
                    itemBuilder: (context, i) {
                      final line = cart.items[i];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(line.name,
                                    style: theme.textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                                if (line.optionsLabel.isNotEmpty)
                                  Text(line.optionsLabel,
                                      style: theme.textTheme.bodySmall?.copyWith(
                                          color:
                                              theme.colorScheme.onSurfaceVariant),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                const SizedBox(height: AppSpacing.xs),
                                Text(
                                    Formatters.money(line.lineTotal,
                                        currency: line.currency),
                                    style: theme.textTheme.bodyMedium),
                              ],
                            ),
                          ),
                          QuantityStepper(
                            dense: true,
                            quantity: line.quantity,
                            min: 0,
                            onChanged: (q) => notifier.setQuantity(line.id, q),
                          ),
                        ],
                      );
                    },
                  ),
          ),
          if (cart.isNotEmpty) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal', style: theme.textTheme.titleMedium),
                      Text(
                          Formatters.money(cart.totals.subtotal,
                              currency: cart.currency),
                          style: theme.textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.md),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => context.push(Routes.cart),
                      child: Text('View cart · ${cart.count} items'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
