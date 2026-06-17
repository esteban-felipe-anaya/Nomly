import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/network/app_exception.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/cart_item.dart';
import '../../../data/repositories/promo_repository.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/quantity_stepper.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/cart_controller.dart';
import 'widgets/order_summary.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartControllerProvider);
    final notifier = ref.read(cartControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
        actions: [
          if (cart.isNotEmpty)
            TextButton(
              onPressed: () => notifier.clear(),
              child: const Text('Clear'),
            ),
        ],
      ),
      body: cart.isEmpty
          ? EmptyView(
              title: 'Your cart is empty',
              message: 'Browse restaurants and add some dishes.',
              icon: Icons.shopping_bag_outlined,
              action: FilledButton.tonal(
                onPressed: () => context.go(Routes.restaurants),
                child: const Text('Find food'),
              ),
            )
          : CenteredConstrained(
              maxWidth: 720,
              child: ListView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
                  _RestaurantHeader(name: cart.restaurantName),
                  const SizedBox(height: AppSpacing.sm),
                  for (final line in cart.items)
                    _CartLineTile(line: line, notifier: notifier),
                  const SizedBox(height: AppSpacing.lg),
                  _PromoField(),
                  const SizedBox(height: AppSpacing.lg),
                  _TipSelector(
                    selected: cart.tip,
                    currency: cart.currency,
                    onSelected: notifier.setTip,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  OrderSummary(totals: cart.totals, currency: cart.currency),
                  const SizedBox(height: AppSpacing.xl),
                  FilledButton(
                    onPressed: () => context.push(Routes.checkout),
                    child: Text(
                        'Go to checkout · ${Formatters.money(cart.totals.total, currency: cart.currency)}'),
                  ),
                ],
              ),
            ),
    );
  }
}

class _RestaurantHeader extends StatelessWidget {
  const _RestaurantHeader({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.storefront_rounded, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
        ),
      ],
    );
  }
}

class _CartLineTile extends StatelessWidget {
  const _CartLineTile({required this.line, required this.notifier});
  final CartItem line;
  final CartController notifier;

  Future<void> _editInstructions(BuildContext context) async {
    final controller = TextEditingController(text: line.instructions);
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Special instructions'),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLines: 3,
          decoration: const InputDecoration(hintText: 'e.g. no onions'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
              onPressed: () => Navigator.pop(ctx, controller.text),
              child: const Text('Save')),
        ],
      ),
    );
    if (result != null) notifier.setInstructions(line.id, result);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
              url: line.image, width: 64, height: 64, borderRadius: AppRadius.image),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(line.name, style: theme.textTheme.titleSmall),
                if (line.optionsLabel.isNotEmpty)
                  Text(line.optionsLabel,
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant)),
                const SizedBox(height: AppSpacing.xs),
                Text(Formatters.money(line.lineTotal, currency: line.currency),
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700)),
                TextButton.icon(
                  onPressed: () => _editInstructions(context),
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 32),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  icon: const Icon(Icons.edit_note_rounded, size: 18),
                  label: Text(
                      line.instructions.isEmpty ? 'Add note' : 'Edit note'),
                ),
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
      ),
    );
  }
}

class _PromoField extends ConsumerStatefulWidget {
  @override
  ConsumerState<_PromoField> createState() => _PromoFieldState();
}

class _PromoFieldState extends ConsumerState<_PromoField> {
  final _controller = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _apply() async {
    final cart = ref.read(cartControllerProvider);
    final code = _controller.text.trim();
    if (code.isEmpty) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final result = await ref
          .read(promoRepositoryProvider)
          .validate(code, cart.totals.subtotal);
      if (result.valid) {
        ref.read(cartControllerProvider.notifier).applyPromo(result);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Promo "${result.code}" applied')),
          );
        }
      } else {
        setState(() => _error = result.reason ?? 'Invalid code');
      }
    } on AppException catch (e) {
      setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartControllerProvider);
    final promo = cart.promo;
    if (promo != null && promo.valid) {
      return Card(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: ListTile(
          leading: const Icon(Icons.local_offer_rounded),
          title: Text('Promo ${promo.code} applied'),
          subtitle: Text(promo.description ?? ''),
          trailing: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () =>
                ref.read(cartControllerProvider.notifier).clearPromo(),
          ),
        ),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
              labelText: 'Promo code',
              hintText: 'NOMLY20',
              prefixIcon: const Icon(Icons.local_offer_outlined),
              errorText: _error,
            ),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: FilledButton.tonal(
            onPressed: _loading ? null : _apply,
            child: _loading
                ? const SizedBox(
                    height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Apply'),
          ),
        ),
      ],
    );
  }
}

class _TipSelector extends StatelessWidget {
  const _TipSelector(
      {required this.selected, required this.currency, required this.onSelected});
  final double selected;
  final String currency;
  final ValueChanged<double> onSelected;

  static const _options = [0.0, 2.0, 3.0, 5.0];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Add a tip',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            for (final t in _options)
              ChoiceChip(
                label: Text(t == 0 ? 'None' : Formatters.money(t, currency: currency)),
                selected: selected == t,
                onSelected: (_) => onSelected(t),
              ),
          ],
        ),
      ],
    );
  }
}
