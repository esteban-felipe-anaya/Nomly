import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../data/models/order.dart';

/// Reusable fee breakdown (subtotal, discount, delivery, service, tax, tip,
/// total). Shared by the cart and checkout review.
class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.totals, this.currency = 'USD'});

  final OrderTotals totals;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: AppRadius.card,
      ),
      child: Column(
        children: [
          _row(context, 'Subtotal', Formatters.money(totals.subtotal, currency: currency)),
          if (totals.discount > 0)
            _row(context, 'Discount',
                '−${Formatters.money(totals.discount, currency: currency)}',
                highlight: true),
          _row(context, 'Delivery fee', Formatters.fee(totals.deliveryFee, currency: currency)),
          _row(context, 'Service fee', Formatters.money(totals.serviceFee, currency: currency)),
          _row(context, 'Tax', Formatters.money(totals.tax, currency: currency)),
          if (totals.tip > 0)
            _row(context, 'Tip', Formatters.money(totals.tip, currency: currency)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(height: 1),
          ),
          _row(context, 'Total', Formatters.money(totals.total, currency: currency),
              bold: true),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value,
      {bool bold = false, bool highlight = false}) {
    final theme = Theme.of(context);
    final style = (bold ? theme.textTheme.titleMedium : theme.textTheme.bodyMedium)
        ?.copyWith(
      fontWeight: bold ? FontWeight.w700 : null,
      color: highlight ? theme.colorScheme.primary : null,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
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
