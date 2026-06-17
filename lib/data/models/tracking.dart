import 'package:freezed_annotation/freezed_annotation.dart';

import 'order.dart';

part 'tracking.freezed.dart';
part 'tracking.g.dart';

@freezed
abstract class TrackingStep with _$TrackingStep {
  const factory TrackingStep({
    required String key,
    required String label,
    @Default(false) bool done,
    @Default(false) bool active,
  }) = _TrackingStep;

  factory TrackingStep.fromJson(Map<String, dynamic> json) =>
      _$TrackingStepFromJson(json);
}

@freezed
abstract class Tracking with _$Tracking {
  const factory Tracking({
    required String orderId,
    required String status,
    @Default(0) int etaMinutes,
    Courier? courier,
    @Default(<List<double>>[]) List<List<double>> route,
    @Default(<TrackingStep>[]) List<TrackingStep> steps,
  }) = _Tracking;

  factory Tracking.fromJson(Map<String, dynamic> json) =>
      _$TrackingFromJson(json);
}
