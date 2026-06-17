import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/app_exception.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/order.dart';
import '../../../data/repositories/order_repository.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/state_views.dart';
import '../../address/application/address_controller.dart';
import '../../cart/application/cart_controller.dart';
import '../../cart/presentation/widgets/order_summary.dart';
import '../../orders/application/orders_providers.dart';

const _paymentMethods = ['Visa •••• 4242', 'Mastercard •••• 5555', 'Cash on delivery'];

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String _payment = _paymentMethods.first;
  bool _scheduled = false;
  TimeOfDay? _scheduleTime;
  bool _placing = false;

  Future<void> _placeOrder() async {
    final cart = ref.read(cartControllerProvider);
    final address = ref.read(selectedAddressProvider);
    if (address == null || cart.isEmpty || cart.restaurantId == null) return;

    setState(() => _placing = true);
    try {
      final items = [
        for (final line in cart.items)
          OrderItem(
            dishId: line.dishId,
            restaurantId: line.restaurantId,
            name: line.name,
            image: line.image,
            unitPrice: line.unitPrice,
            quantity: line.quantity,
            selectedOptions: line.selectedOptions,
            lineTotal: line.lineTotal,
            instructions: line.instructions,
          ),
      ];
      final order = await ref.read(orderRepositoryProvider).place(
            PlaceOrderRequest(
              restaurantId: cart.restaurantId!,
              addressId: address.id,
              items: items,
              totals: cart.totals,
              paymentMethod: _payment,
              promoCode: cart.promo?.code,
              scheduledFor: _scheduled && _scheduleTime != null
                  ? 'Today ${_scheduleTime!.format(context)}'
                  : null,
            ),
          );
      ref.read(cartControllerProvider.notifier).clear();
      ref.invalidate(ordersListProvider);
      ref.invalidate(activeOrderProvider);
      if (!mounted) return;
      await _showSuccess(order);
      if (!mounted) return;
      context.go(Routes.trackingPath(order.id));
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _placing = false);
    }
  }

  Future<void> _showSuccess(Order order) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: Icon(Icons.check_circle_rounded,
            color: Theme.of(ctx).colorScheme.primary, size: 48),
        title: const Text('Order placed!'),
        content: Text('Your order #${order.id} is confirmed and being prepared.'),
        actions: [
          FilledButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Track order'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartControllerProvider);
    final address = ref.watch(selectedAddressProvider);
    final theme = Theme.of(context);

    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Checkout')),
        body: EmptyView(
          title: 'Nothing to check out',
          message: 'Your cart is empty.',
          icon: Icons.shopping_bag_outlined,
          action: FilledButton.tonal(
            onPressed: () => context.go(Routes.restaurants),
            child: const Text('Find food'),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: CenteredConstrained(
        maxWidth: 720,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            _SectionCard(
              title: 'Delivery address',
              child: address == null
                  ? ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.add_location_alt_outlined),
                      title: const Text('Add a delivery address'),
                      onTap: () => context.push(Routes.addressEdit),
                    )
                  : ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(address.label),
                      subtitle: Text(address.summary),
                      trailing: TextButton(
                        onPressed: () => context.push(Routes.selectAddress),
                        child: const Text('Change'),
                      ),
                    ),
            ),
            _SectionCard(
              title: 'Delivery time',
              child: Column(
                children: [
                  SegmentedButton<bool>(
                    segments: const [
                      ButtonSegment(value: false, label: Text('Now'), icon: Icon(Icons.bolt)),
                      ButtonSegment(
                          value: true, label: Text('Schedule'), icon: Icon(Icons.schedule)),
                    ],
                    selected: {_scheduled},
                    onSelectionChanged: (s) async {
                      final scheduled = s.first;
                      if (scheduled) {
                        final picked = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (picked != null) {
                          setState(() {
                            _scheduled = true;
                            _scheduleTime = picked;
                          });
                        }
                      } else {
                        setState(() => _scheduled = false);
                      }
                    },
                  ),
                  if (_scheduled && _scheduleTime != null)
                    Padding(
                      padding: const EdgeInsets.only(top: AppSpacing.sm),
                      child: Text('Scheduled for ${_scheduleTime!.format(context)}',
                          style: theme.textTheme.bodyMedium),
                    ),
                ],
              ),
            ),
            _SectionCard(
              title: 'Payment method',
              child: Column(
                children: [
                  for (final method in _paymentMethods)
                    RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      value: method,
                      // ignore: deprecated_member_use
                      groupValue: _payment,
                      // ignore: deprecated_member_use
                      onChanged: (v) => setState(() => _payment = v!),
                      secondary: Icon(method.startsWith('Cash')
                          ? Icons.payments_outlined
                          : Icons.credit_card),
                      title: Text(method),
                    ),
                ],
              ),
            ),
            _SectionCard(
              title: 'Order summary',
              child: OrderSummary(totals: cart.totals, currency: cart.currency),
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: (_placing || address == null) ? null : _placeOrder,
              child: _placing
                  ? const SizedBox(
                      height: 22, width: 22, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(
                      'Place order · ${Formatters.money(cart.totals.total, currency: cart.currency)}'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: AppSpacing.sm),
            child,
          ],
        ),
      ),
    );
  }
}
