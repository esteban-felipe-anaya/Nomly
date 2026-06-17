import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../data/models/cuisine_icons.dart';
import '../../../../data/models/restaurant_filter.dart';
import '../../../home/application/home_providers.dart';
import '../../application/restaurants_providers.dart';

/// M3 bottom sheet for restaurant filters: cuisine, rating, price, free
/// delivery and offers. Edits a local copy then applies it on "Show results".
class FilterSheet extends ConsumerStatefulWidget {
  const FilterSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const FilterSheet(),
    );
  }

  @override
  ConsumerState<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends ConsumerState<FilterSheet> {
  late RestaurantFilter _draft;

  @override
  void initState() {
    super.initState();
    _draft = ref.read(restaurantFilterControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cuisines = ref.watch(cuisinesProvider).value ?? const [];

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Column(
          children: [
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
                  Text('Filters', style: theme.textTheme.headlineSmall),
                  const SizedBox(height: AppSpacing.lg),
                  _label(context, 'Cuisine'),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      for (final c in cuisines)
                        FilterChip(
                          avatar: Icon(cuisineIcon(c.icon), size: 18),
                          label: Text(c.name),
                          selected: _draft.cuisineId == c.id,
                          onSelected: (sel) => setState(() => _draft =
                              _draft.copyWith(
                                  cuisineId: () => sel ? c.id : null)),
                        ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _label(context, 'Minimum rating'),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      _ratingChip(null, 'Any'),
                      _ratingChip(4.0, '4.0+'),
                      _ratingChip(4.5, '4.5+'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  _label(context, 'Price'),
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      _priceChip(null, 'Any'),
                      _priceChip(1, '\$'),
                      _priceChip(2, '\$\$'),
                      _priceChip(3, '\$\$\$'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Free delivery only'),
                    value: _draft.freeDelivery,
                    onChanged: (v) =>
                        setState(() => _draft = _draft.copyWith(freeDelivery: v)),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Has offers'),
                    value: _draft.offersOnly,
                    onChanged: (v) =>
                        setState(() => _draft = _draft.copyWith(offersOnly: v)),
                  ),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () =>
                            setState(() => _draft = const RestaurantFilter()),
                        child: const Text('Reset'),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        onPressed: () {
                          ref
                              .read(restaurantFilterControllerProvider.notifier)
                              .apply(_draft);
                          Navigator.of(context).pop();
                        },
                        child: const Text('Show results'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _label(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600)),
      );

  Widget _ratingChip(double? value, String label) => ChoiceChip(
        label: Text(label),
        selected: _draft.minRating == value,
        onSelected: (_) =>
            setState(() => _draft = _draft.copyWith(minRating: () => value)),
      );

  Widget _priceChip(int? value, String label) => ChoiceChip(
        label: Text(label),
        selected: _draft.priceLevel == value,
        onSelected: (_) =>
            setState(() => _draft = _draft.copyWith(priceLevel: () => value)),
      );
}
