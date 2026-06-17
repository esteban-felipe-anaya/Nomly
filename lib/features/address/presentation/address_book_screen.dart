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

/// Displays the user's saved delivery addresses with edit/delete affordances.
class AddressBookScreen extends ConsumerWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(addressControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your addresses')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.addressEdit),
        icon: const Icon(Icons.add),
        label: const Text('Add address'),
      ),
      body: AsyncView<List<Address>>(
        value: addresses,
        onRetry: () => ref.invalidate(addressControllerProvider),
        data: (list) {
          if (list.isEmpty) {
            return EmptyView(
              title: 'No addresses yet',
              message: 'Add a delivery address to get started.',
              icon: Icons.location_off_outlined,
              action: FilledButton.icon(
                onPressed: () => context.push(Routes.addressEdit),
                icon: const Icon(Icons.add),
                label: const Text('Add address'),
              ),
            );
          }
          return CenteredConstrained(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.xxxl + AppSpacing.xl,
              ),
              itemCount: list.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
              itemBuilder: (context, index) =>
                  _AddressCard(address: list[index]),
            ),
          );
        },
      ),
    );
  }
}

class _AddressCard extends ConsumerWidget {
  const _AddressCard({required this.address});

  final Address address;

  IconData get _icon {
    switch (address.label.toLowerCase()) {
      case 'home':
        return Icons.home_outlined;
      case 'work':
        return Icons.work_outline;
      default:
        return Icons.location_on_outlined;
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete address?'),
        content: Text('"${address.label}" will be removed permanently.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => context.pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await ref.read(addressControllerProvider.notifier).remove(address.id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheme = context.scheme;
    final textTheme = context.textTheme;

    final subtitleParts = <String>[
      address.summary,
      if (address.notes.isNotEmpty) address.notes,
    ];

    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        leading: CircleAvatar(
          backgroundColor: scheme.secondaryContainer,
          foregroundColor: scheme.onSecondaryContainer,
          child: Icon(_icon),
        ),
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
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: scheme.primaryContainer,
                labelStyle: textTheme.labelSmall?.copyWith(
                  color: scheme.onPrimaryContainer,
                ),
                side: BorderSide.none,
              ),
            ],
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: AppSpacing.xs),
          child: Text(
            subtitleParts.join('\n'),
            style: textTheme.bodyMedium
                ?.copyWith(color: scheme.onSurfaceVariant),
          ),
        ),
        isThreeLine: subtitleParts.length > 1,
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'edit':
                context.push(Routes.addressEdit, extra: address);
              case 'delete':
                _confirmDelete(context, ref);
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 'edit',
              child: ListTile(
                leading: Icon(Icons.edit_outlined),
                title: Text('Edit'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Delete'),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
