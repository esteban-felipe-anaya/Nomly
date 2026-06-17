import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/address.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/address_controller.dart';

/// Lets the user pick which saved [Address] orders are delivered to.
class SelectAddressScreen extends ConsumerWidget {
  const SelectAddressScreen({super.key});

  IconData _iconFor(Address address) {
    switch (address.label.toLowerCase()) {
      case 'home':
        return Icons.home_outlined;
      case 'work':
        return Icons.work_outline;
      default:
        return Icons.location_on_outlined;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressControllerProvider);
    final selectedId = ref.watch(selectedAddressIdProvider);
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Select delivery address')),
      body: AsyncView<List<Address>>(
        value: addresses,
        onRetry: () => ref.invalidate(addressControllerProvider),
        data: (list) {
          if (list.isEmpty) {
            return EmptyView(
              title: 'No addresses yet',
              message: 'Add a delivery address to continue.',
              icon: Icons.location_off_outlined,
              action: FilledButton.icon(
                onPressed: () => context.push(Routes.addressEdit),
                icon: const Icon(Icons.add),
                label: const Text('Add new address'),
              ),
            );
          }

          // Fall back to the default address when nothing is explicitly chosen.
          final effectiveId = list.any((a) => a.id == selectedId)
              ? selectedId
              : list.firstWhere(
                  (a) => a.isDefault,
                  orElse: () => list.first,
                ).id;

          return CenteredConstrained(
            child: RadioGroup<String>(
              groupValue: effectiveId,
              onChanged: (value) {
                if (value == null) return;
                ref.read(selectedAddressIdProvider.notifier).select(value);
                context.pop();
              },
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                children: [
                  for (final address in list)
                    RadioListTile<String>(
                      value: address.id,
                      secondary: Icon(_iconFor(address)),
                    title: Row(
                      children: [
                        Flexible(
                          child: Text(
                            address.label,
                            style: textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (address.isDefault) ...[
                          const SizedBox(width: AppSpacing.sm),
                          Chip(
                            label: const Text('Default'),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            backgroundColor: scheme.primaryContainer,
                            labelStyle: textTheme.labelSmall?.copyWith(
                              color: scheme.onPrimaryContainer,
                            ),
                            side: BorderSide.none,
                          ),
                        ],
                      ],
                    ),
                    subtitle: Text(
                      address.summary,
                      style: textTheme.bodyMedium
                          ?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add new address'),
                    onTap: () => context.push(Routes.addressEdit),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
