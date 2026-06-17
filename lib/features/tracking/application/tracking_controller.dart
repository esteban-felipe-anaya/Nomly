import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../data/models/tracking.dart';
import '../../../data/repositories/order_repository.dart';

part 'tracking_controller.g.dart';

const _statusOrder = [
  'confirmed',
  'preparing',
  'picked_up',
  'on_the_way',
  'delivered'
];

class TrackingState {
  const TrackingState({
    required this.tracking,
    required this.stepIndex,
    required this.courierProgress,
    required this.etaMinutes,
  });

  final Tracking tracking;
  final int stepIndex;
  final double courierProgress; // 0..1 along the route
  final int etaMinutes;

  String get status => _statusOrder[stepIndex];
  bool get delivered => status == 'delivered';

  List<LatLng> get route =>
      tracking.route.map((p) => LatLng(p[0], p[1])).toList();

  /// Interpolated courier position along the route polyline.
  LatLng get courierPosition {
    final pts = route;
    if (pts.isEmpty) {
      final c = tracking.courier;
      return c == null ? const LatLng(0, 0) : LatLng(c.lat, c.lng);
    }
    if (pts.length == 1 || courierProgress <= 0) return pts.first;
    if (courierProgress >= 1) return pts.last;

    // total length (planar approximation, fine for a city-scale demo)
    final segLen = <double>[];
    var total = 0.0;
    for (var i = 0; i < pts.length - 1; i++) {
      final d = _dist(pts[i], pts[i + 1]);
      segLen.add(d);
      total += d;
    }
    var target = courierProgress * total;
    for (var i = 0; i < segLen.length; i++) {
      if (target <= segLen[i] || i == segLen.length - 1) {
        final f = segLen[i] == 0 ? 0.0 : (target / segLen[i]).clamp(0.0, 1.0);
        return LatLng(
          pts[i].latitude + (pts[i + 1].latitude - pts[i].latitude) * f,
          pts[i].longitude + (pts[i + 1].longitude - pts[i].longitude) * f,
        );
      }
      target -= segLen[i];
    }
    return pts.last;
  }

  static double _dist(LatLng a, LatLng b) {
    final dx = a.latitude - b.latitude;
    final dy = a.longitude - b.longitude;
    return dx * dx + dy * dy; // squared is fine for relative weighting
  }

  TrackingState copyWith({int? stepIndex, double? courierProgress, int? etaMinutes}) =>
      TrackingState(
        tracking: tracking,
        stepIndex: stepIndex ?? this.stepIndex,
        courierProgress: courierProgress ?? this.courierProgress,
        etaMinutes: etaMinutes ?? this.etaMinutes,
      );
}

/// Loads order tracking and, for the demo, auto-advances the status on a timer
/// and animates the courier along the route toward the delivery address.
@riverpod
class TrackingController extends _$TrackingController {
  Timer? _statusTimer;
  Timer? _courierTimer;

  @override
  Future<TrackingState> build(String orderId) async {
    final tracking = await ref.read(orderRepositoryProvider).tracking(orderId);
    ref.onDispose(() {
      _statusTimer?.cancel();
      _courierTimer?.cancel();
    });

    var index = _statusOrder.indexOf(tracking.status);
    if (index < 0) index = 0;

    if (index < _statusOrder.length - 1) {
      _statusTimer = Timer.periodic(AppDurations.trackingTick, (_) => _advance());
      _courierTimer =
          Timer.periodic(AppDurations.courierTick, (_) => _moveCourier());
    }

    return TrackingState(
      tracking: tracking,
      stepIndex: index,
      courierProgress: index >= 2 ? 0.05 : 0.0,
      etaMinutes: tracking.etaMinutes == 0 ? 15 : tracking.etaMinutes,
    );
  }

  void _advance() {
    final cur = state.value;
    if (cur == null) return;
    if (cur.stepIndex >= _statusOrder.length - 1) {
      _statusTimer?.cancel();
      _courierTimer?.cancel();
      return;
    }
    state = AsyncData(cur.copyWith(stepIndex: cur.stepIndex + 1));
  }

  void _moveCourier() {
    final cur = state.value;
    if (cur == null) return;
    // courier only moves once picked up / on the way
    if (cur.stepIndex < 2) return;
    final next = (cur.courierProgress + 0.04).clamp(0.0, 1.0);
    final eta = (cur.etaMinutes * (1 - next)).round().clamp(0, cur.etaMinutes);
    state = AsyncData(cur.copyWith(
      courierProgress: next,
      etaMinutes: cur.delivered ? 0 : eta,
    ));
    if (next >= 1.0) _courierTimer?.cancel();
  }
}

/// Friendly labels for the status timeline.
const trackingStepLabels = <String, String>{
  'confirmed': 'Order confirmed',
  'preparing': 'Preparing your food',
  'picked_up': 'Courier picked up',
  'on_the_way': 'On the way',
  'delivered': 'Delivered',
};

List<String> get trackingStatusOrder => _statusOrder;
