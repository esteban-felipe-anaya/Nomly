// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrackingStep _$TrackingStepFromJson(Map<String, dynamic> json) =>
    _TrackingStep(
      key: json['key'] as String,
      label: json['label'] as String,
      done: json['done'] as bool? ?? false,
      active: json['active'] as bool? ?? false,
    );

Map<String, dynamic> _$TrackingStepToJson(_TrackingStep instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
      'done': instance.done,
      'active': instance.active,
    };

_Tracking _$TrackingFromJson(Map<String, dynamic> json) => _Tracking(
  orderId: json['orderId'] as String,
  status: json['status'] as String,
  etaMinutes: (json['etaMinutes'] as num?)?.toInt() ?? 0,
  courier: json['courier'] == null
      ? null
      : Courier.fromJson(json['courier'] as Map<String, dynamic>),
  route:
      (json['route'] as List<dynamic>?)
          ?.map(
            (e) =>
                (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          )
          .toList() ??
      const <List<double>>[],
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => TrackingStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <TrackingStep>[],
);

Map<String, dynamic> _$TrackingToJson(_Tracking instance) => <String, dynamic>{
  'orderId': instance.orderId,
  'status': instance.status,
  'etaMinutes': instance.etaMinutes,
  'courier': instance.courier,
  'route': instance.route,
  'steps': instance.steps,
};
