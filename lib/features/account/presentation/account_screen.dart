import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../auth/application/auth_controller.dart';

/// Account tab: shows the signed-in profile (or a sign-in prompt) plus a
/// grouped list of account-related destinations.
class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: SafeArea(
        child: CenteredConstrained(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.lg,
            ),
            children: [
              _HeaderCard(auth: auth),
              const SizedBox(height: AppSpacing.lg),
              const _MenuGroup(),
              if (auth.isAuthenticated) ...[
                const SizedBox(height: AppSpacing.xl),
                _LogoutButton(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard({required this.auth});

  final AuthState auth;

  @override
  Widget build(BuildContext context) {
    final user = auth.user;
    if (auth.isAuthenticated && user != null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: user.avatar.isEmpty
                    ? _AvatarFallback(name: user.name)
                    : AppNetworkImage(
                        url: user.avatar,
                        width: 64,
                        height: 64,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
              ),
              const SizedBox(width: AppSpacing.lg),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: context.textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xxs),
                    Text(
                      user.email,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.scheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome to Nomly', style: context.textTheme.titleMedium),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Sign in to track orders, save favorites and check out faster.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.scheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Align(
              alignment: Alignment.centerLeft,
              child: FilledButton.icon(
                onPressed: () => context.push(Routes.login),
                icon: const Icon(Icons.login),
                label: const Text('Sign in'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarFallback extends StatelessWidget {
  const _AvatarFallback({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    final initial = name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase();
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.scheme.primaryContainer,
      ),
      child: Text(
        initial,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.scheme.onPrimaryContainer,
        ),
      ),
    );
  }
}

class _MenuGroup extends StatelessWidget {
  const _MenuGroup();

  @override
  Widget build(BuildContext context) {
    final items = <_MenuItem>[
      const _MenuItem(
        icon: Icons.location_on_outlined,
        label: 'Addresses',
        route: Routes.addresses,
      ),
      const _MenuItem(
        icon: Icons.credit_card,
        label: 'Payment methods',
        route: Routes.paymentMethods,
      ),
      const _MenuItem(
        icon: Icons.favorite_border,
        label: 'Favorites',
        route: Routes.favorites,
      ),
      const _MenuItem(
        icon: Icons.notifications_outlined,
        label: 'Notifications',
        route: Routes.notifications,
      ),
      const _MenuItem(
        icon: Icons.settings_outlined,
        label: 'Settings',
        route: Routes.settings,
      ),
    ];

    return Card(
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            ListTile(
              leading: Icon(items[i].icon),
              title: Text(items[i].label),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push(items[i].route),
            ),
            if (i != items.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}

class _MenuItem {
  const _MenuItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  final IconData icon;
  final String label;
  final String route;
}

class _LogoutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => _confirmLogout(context, ref),
        icon: const Icon(Icons.logout),
        label: const Text('Log out'),
      ),
    );
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;
    await ref.read(authControllerProvider.notifier).logout();
    if (!context.mounted) return;
    context.go(Routes.home);
  }
}
