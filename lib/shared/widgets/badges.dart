import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/formatters.dart';

/// Compact rating chip: ★ 4.7 (120+).
class RatingBadge extends StatelessWidget {
  const RatingBadge({super.key, required this.rating, this.count, this.dense = false});
  final double rating;
  final int? count;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: dense ? 16 : 18, color: context.nomly.rating),
        const SizedBox(width: 2),
        Text(rating.toStringAsFixed(1),
            style: (dense ? t.labelMedium : t.labelLarge)
                ?.copyWith(fontWeight: FontWeight.w600)),
        if (count != null) ...[
          const SizedBox(width: 2),
          Text('($count+)',
              style: t.labelSmall
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ],
      ],
    );
  }
}

/// Green "Free delivery" pill using the success color extension.
class FreeDeliveryChip extends StatelessWidget {
  const FreeDeliveryChip({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.nomly;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 3),
      decoration: BoxDecoration(
        color: c.successContainer,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.pedal_bike_rounded, size: 14, color: c.onSuccessContainer),
          const SizedBox(width: 4),
          Text('Free delivery',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: c.onSuccessContainer, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Small accent pill used for offers / promos.
class OfferChip extends StatelessWidget {
  const OfferChip({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 3),
      decoration: BoxDecoration(
        color: scheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_offer_rounded, size: 13, color: scheme.onTertiaryContainer),
          const SizedBox(width: 4),
          Text(label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: scheme.onTertiaryContainer, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

/// Inline metadata row like "25 min · $$ · 1.2 km" separated by dots.
class MetaRow extends StatelessWidget {
  const MetaRow({super.key, required this.parts});
  final List<String> parts;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant);
    return Text(parts.join('  ·  '), style: style, maxLines: 1, overflow: TextOverflow.ellipsis);
  }
}

/// Builds the standard meta parts for a restaurant.
List<String> restaurantMeta({
  required int minutes,
  required double deliveryFee,
  required int priceLevel,
  double? distanceKm,
}) =>
    [
      Formatters.minutes(minutes),
      Formatters.fee(deliveryFee),
      Formatters.priceLevel(priceLevel),
      if (distanceKm != null) Formatters.distance(distanceKm),
    ];
