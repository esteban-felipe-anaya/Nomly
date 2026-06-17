import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'responsive.dart';

class NavDestinationData {
  const NavDestinationData(this.icon, this.selectedIcon, this.label);
  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

const kNavDestinations = <NavDestinationData>[
  NavDestinationData(Icons.home_outlined, Icons.home_rounded, 'Home'),
  NavDestinationData(
      Icons.storefront_outlined, Icons.storefront_rounded, 'Restaurants'),
  NavDestinationData(Icons.search_outlined, Icons.search_rounded, 'Search'),
  NavDestinationData(
      Icons.receipt_long_outlined, Icons.receipt_long_rounded, 'Orders'),
  NavDestinationData(
      Icons.person_outline_rounded, Icons.person_rounded, 'Account'),
];

/// Wraps the [StatefulNavigationShell] (go_router branches) and renders the
/// appropriate M3 navigation affordance for the current width:
///   * compact  → bottom NavigationBar
///   * medium   → NavigationRail
///   * expanded → extended NavigationRail (desktop / web)
class AdaptiveNavScaffold extends StatelessWidget {
  const AdaptiveNavScaffold({super.key, required this.shell});

  final StatefulNavigationShell shell;

  void _onTap(int index) {
    shell.goBranch(index, initialLocation: index == shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, layout) {
        if (layout == LayoutType.compact) {
          return Scaffold(
            body: shell,
            bottomNavigationBar: NavigationBar(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: _onTap,
              destinations: [
                for (final d in kNavDestinations)
                  NavigationDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selectedIcon),
                    label: d.label,
                  ),
              ],
            ),
          );
        }

        final extended = layout == LayoutType.expanded;
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                extended: extended,
                minExtendedWidth: 200,
                selectedIndex: shell.currentIndex,
                onDestinationSelected: _onTap,
                labelType: extended
                    ? NavigationRailLabelType.none
                    : NavigationRailLabelType.all,
                leading: _RailLeading(extended: extended),
                destinations: [
                  for (final d in kNavDestinations)
                    NavigationRailDestination(
                      icon: Icon(d.icon),
                      selectedIcon: Icon(d.selectedIcon),
                      label: Text(d.label),
                    ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(child: shell),
            ],
          ),
        );
      },
    );
  }
}

class _RailLeading extends StatelessWidget {
  const _RailLeading({required this.extended});
  final bool extended;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.takeout_dining_rounded, color: scheme.primary),
          if (extended) ...[
            const SizedBox(width: 8),
            Text('Nomly',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700, color: scheme.primary)),
          ],
        ],
      ),
    );
  }
}
