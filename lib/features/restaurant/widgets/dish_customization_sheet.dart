import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../data/models/cart_item.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/quantity_stepper.dart';
import '../../cart/application/cart_controller.dart';

const _uuid = Uuid();

/// M3 modal bottom sheet for customizing a dish (size, add-ons, options, qty,
/// special instructions) before adding it to the cart. Handles the
/// "different restaurant → start a new cart?" confirmation.
class DishCustomizationSheet extends ConsumerStatefulWidget {
  const DishCustomizationSheet({
    super.key,
    required this.dish,
    required this.restaurant,
  });

  final Dish dish;
  final Restaurant restaurant;

  static Future<void> show(
    BuildContext context, {
    required Dish dish,
    required Restaurant restaurant,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          DishCustomizationSheet(dish: dish, restaurant: restaurant),
    );
  }

  @override
  ConsumerState<DishCustomizationSheet> createState() =>
      _DishCustomizationSheetState();
}

class _DishCustomizationSheetState
    extends ConsumerState<DishCustomizationSheet> {
  // group name -> selected option names
  final Map<String, Set<String>> _selected = {};
  final _instructions = TextEditingController();
  int _quantity = 1;

  Dish get dish => widget.dish;

  @override
  void initState() {
    super.initState();
    for (final g in dish.customization) {
      // single-choice groups default to their first option
      if (g.isSingle && g.options.isNotEmpty) {
        _selected[g.group] = {g.options.first.name};
      } else {
        _selected[g.group] = <String>{};
      }
    }
  }

  @override
  void dispose() {
    _instructions.dispose();
    super.dispose();
  }

  List<CustomizationOption> get _chosenOptions {
    final result = <CustomizationOption>[];
    for (final g in dish.customization) {
      final names = _selected[g.group] ?? const {};
      for (final o in g.options) {
        if (names.contains(o.name)) result.add(o);
      }
    }
    return result;
  }

  double get _unitPrice =>
      dish.price + _chosenOptions.fold(0.0, (s, o) => s + o.priceDelta);
  double get _total => _unitPrice * _quantity;

  void _toggle(String group, String option, bool single) {
    setState(() {
      final set = _selected.putIfAbsent(group, () => <String>{});
      if (single) {
        set
          ..clear()
          ..add(option);
      } else {
        set.contains(option) ? set.remove(option) : set.add(option);
      }
    });
  }

  Future<void> _addToCart() async {
    final cart = ref.read(cartControllerProvider.notifier);
    final item = CartItem(
      id: _uuid.v4(),
      dishId: dish.id,
      restaurantId: widget.restaurant.id,
      restaurantName: widget.restaurant.name,
      name: dish.name,
      image: dish.image,
      unitPrice: dish.price,
      currency: dish.currency,
      quantity: _quantity,
      selectedOptions: _chosenOptions,
      instructions: _instructions.text.trim(),
    );

    if (ref
        .read(cartControllerProvider.notifier)
        .isDifferentRestaurant(widget.restaurant.id)) {
      final replace = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Start a new cart?'),
          content: Text(
              'Your cart has items from another restaurant. Adding this will start a new cart.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: const Text('Cancel')),
            FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: const Text('New cart')),
          ],
        ),
      );
      if (replace != true) return;
      cart.replaceWith(
        item,
        restaurantId: widget.restaurant.id,
        restaurantName: widget.restaurant.name,
        baseDeliveryFee: widget.restaurant.deliveryFee,
        currency: dish.currency,
      );
    } else {
      cart.add(
        item,
        restaurantId: widget.restaurant.id,
        restaurantName: widget.restaurant.name,
        baseDeliveryFee: widget.restaurant.deliveryFee,
        currency: dish.currency,
      );
    }

    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${dish.name} added to cart')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.zero,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: AppNetworkImage(url: dish.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dish.name, style: theme.textTheme.headlineSmall),
                        const SizedBox(height: AppSpacing.xs),
                        Text(dish.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant)),
                        const SizedBox(height: AppSpacing.md),
                        Text(Formatters.money(dish.price, currency: dish.currency),
                            style: theme.textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  for (final group in dish.customization)
                    _GroupSection(
                      group: group,
                      selected: _selected[group.group] ?? const {},
                      onToggle: (opt) =>
                          _toggle(group.group, opt, group.isSingle),
                      currency: dish.currency,
                    ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    child: TextField(
                      controller: _instructions,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Special instructions',
                        hintText: 'e.g. no onions, extra napkins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
            _AddBar(
              quantity: _quantity,
              total: _total,
              currency: dish.currency,
              onQuantity: (q) => setState(() => _quantity = q),
              onAdd: _addToCart,
            ),
          ],
        );
      },
    );
  }
}

class _GroupSection extends StatelessWidget {
  const _GroupSection({
    required this.group,
    required this.selected,
    required this.onToggle,
    required this.currency,
  });

  final CustomizationGroup group;
  final Set<String> selected;
  final ValueChanged<String> onToggle;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg, AppSpacing.sm, AppSpacing.lg, 0),
          child: Row(
            children: [
              Text(group.group,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(width: AppSpacing.sm),
              Text(group.isRequired ? 'Required' : 'Optional',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
        for (final option in group.options)
          _OptionRow(
            label: option.name,
            priceDelta: option.priceDelta,
            currency: currency,
            single: group.isSingle,
            selected: selected.contains(option.name),
            onTap: () => onToggle(option.name),
          ),
        const Divider(height: AppSpacing.lg),
      ],
    );
  }
}

class _OptionRow extends StatelessWidget {
  const _OptionRow({
    required this.label,
    required this.priceDelta,
    required this.currency,
    required this.single,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final double priceDelta;
  final String currency;
  final bool single;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
        child: Row(
          children: [
            Icon(
              single
                  ? (selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked)
                  : (selected
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank_rounded),
              color: selected
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Text(label)),
            if (priceDelta > 0)
              Text('+${Formatters.money(priceDelta, currency: currency)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}

class _AddBar extends StatelessWidget {
  const _AddBar({
    required this.quantity,
    required this.total,
    required this.currency,
    required this.onQuantity,
    required this.onAdd,
  });

  final int quantity;
  final double total;
  final String currency;
  final ValueChanged<int> onQuantity;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppElevation.high,
      color: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              QuantityStepper(quantity: quantity, onChanged: onQuantity),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: FilledButton(
                  onPressed: onAdd,
                  child: Text(
                      'Add  ·  ${Formatters.money(total, currency: currency)}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
