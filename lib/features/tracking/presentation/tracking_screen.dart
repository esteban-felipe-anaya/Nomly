import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/formatters.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/app_network_image.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/tracking_controller.dart';

class TrackingScreen extends ConsumerWidget {
  const TrackingScreen({super.key, required this.orderId});
  final String orderId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trackingControllerProvider(orderId));
    return Scaffold(
      appBar: AppBar(title: const Text('Track order')),
      body: AsyncView(
        value: state,
        onRetry: () => ref.invalidate(trackingControllerProvider(orderId)),
        data: (tracking) {
          final map = _TrackingMap(state: tracking);
          final details = _TrackingDetails(orderId: orderId, state: tracking);
          if (context.isExpanded) {
            return Row(
              children: [
                Expanded(flex: 3, child: map),
                const VerticalDivider(width: 1),
                SizedBox(
                    width: 420,
                    child: SingleChildScrollView(child: details)),
              ],
            );
          }
          return Column(
            children: [
              SizedBox(height: 280, child: map),
              Expanded(child: SingleChildScrollView(child: details)),
            ],
          );
        },
      ),
    );
  }
}

class _TrackingMap extends StatelessWidget {
  const _TrackingMap({required this.state});
  final TrackingState state;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final route = state.route;
    final courier = state.courierPosition;
    final center = route.length >= 2
        ? LatLng(
            (route.first.latitude + route.last.latitude) / 2,
            (route.first.longitude + route.last.longitude) / 2,
          )
        : courier;

    return FlutterMap(
      options: MapOptions(
        initialCenter: center,
        initialZoom: 14.5,
        interactionOptions:
            const InteractionOptions(flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.nomly.app',
        ),
        if (route.length >= 2)
          PolylineLayer(
            polylines: [
              Polyline(points: route, strokeWidth: 4, color: scheme.primary),
            ],
          ),
        MarkerLayer(
          markers: [
            if (route.isNotEmpty)
              Marker(
                point: route.first,
                width: 40,
                height: 40,
                child: _Pin(icon: Icons.storefront_rounded, color: scheme.tertiary),
              ),
            if (route.isNotEmpty)
              Marker(
                point: route.last,
                width: 40,
                height: 40,
                child: _Pin(icon: Icons.home_rounded, color: scheme.secondary),
              ),
            Marker(
              point: courier,
              width: 46,
              height: 46,
              child: _CourierPin(color: scheme.primary, onColor: scheme.onPrimary),
            ),
          ],
        ),
      ],
    );
  }
}

class _Pin extends StatelessWidget {
  const _Pin({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}

class _CourierPin extends StatelessWidget {
  const _CourierPin({required this.color, required this.onColor});
  final Color color;
  final Color onColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.5), blurRadius: 8, spreadRadius: 2),
        ],
      ),
      child: Icon(Icons.delivery_dining_rounded, color: onColor, size: 24),
    );
  }
}

class _TrackingDetails extends StatelessWidget {
  const _TrackingDetails({required this.orderId, required this.state});
  final String orderId;
  final TrackingState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courier = state.tracking.courier;
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            state.delivered ? 'Delivered' : 'Arriving in',
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          if (!state.delivered)
            Text(Formatters.minutes(state.etaMinutes),
                style: theme.textTheme.displaySmall
                    ?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: AppSpacing.lg),
          if (courier != null)
            Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  child: ClipOval(
                    child: AppNetworkImage(
                        url: courier.avatar, width: 48, height: 48),
                  ),
                ),
                title: Text(courier.name),
                subtitle: const Text('Your courier'),
                trailing: IconButton.filledTonal(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Calling ${courier.name}…')),
                    );
                  },
                  icon: const Icon(Icons.call),
                ),
              ),
            ),
          const SizedBox(height: AppSpacing.lg),
          _Timeline(stepIndex: state.stepIndex),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => context.push(Routes.orderPath(orderId)),
              child: const Text('View order details'),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: FilledButton.tonal(
              onPressed: () => context.go(Routes.orders),
              child: const Text('Back to orders'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline({required this.stepIndex});
  final int stepIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final steps = trackingStatusOrder;
    return Column(
      children: [
        for (var i = 0; i < steps.length; i++)
          _TimelineRow(
            label: trackingStepLabels[steps[i]] ?? steps[i],
            done: i <= stepIndex,
            active: i == stepIndex,
            isLast: i == steps.length - 1,
            color: theme.colorScheme.primary,
          ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({
    required this.label,
    required this.done,
    required this.active,
    required this.isLast,
    required this.color,
  });
  final String label;
  final bool done;
  final bool active;
  final bool isLast;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onColor = done ? color : theme.colorScheme.outlineVariant;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: done ? color : Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: onColor, width: 2),
                ),
                child: done
                    ? Icon(Icons.check, size: 14, color: theme.colorScheme.onPrimary)
                    : null,
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: onColor),
                ),
            ],
          ),
          const SizedBox(width: AppSpacing.md),
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg, top: 1),
            child: Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: active ? FontWeight.w700 : FontWeight.w400,
                color: done
                    ? theme.colorScheme.onSurface
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
