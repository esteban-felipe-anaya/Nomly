import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// Reusable −/+ quantity control used in the dish sheet and cart.
class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onChanged,
    this.min = 1,
    this.max = 99,
    this.dense = false,
  });

  final int quantity;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;
  final bool dense;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final size = dense ? 32.0 : 40.0;
    return Container(
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _btn(context, Icons.remove_rounded, size,
              quantity > min ? () => onChanged(quantity - 1) : null),
          Container(
            constraints: BoxConstraints(minWidth: dense ? 24 : 32),
            alignment: Alignment.center,
            child: Text('$quantity',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600)),
          ),
          _btn(context, Icons.add_rounded, size,
              quantity < max ? () => onChanged(quantity + 1) : null),
        ],
      ),
    );
  }

  Widget _btn(BuildContext context, IconData icon, double size, VoidCallback? onTap) {
    final scheme = Theme.of(context).colorScheme;
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon,
            size: dense ? 18 : 20,
            color: onTap == null ? scheme.onSurfaceVariant.withValues(alpha: 0.4) : scheme.primary),
      ),
    );
  }
}
