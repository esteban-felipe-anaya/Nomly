// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromoResult _$PromoResultFromJson(Map<String, dynamic> json) => _PromoResult(
  code: json['code'] as String,
  valid: json['valid'] as bool,
  discountPct: (json['discountPct'] as num?)?.toDouble() ?? 0,
  freeDelivery: json['freeDelivery'] as bool? ?? false,
  description: json['description'] as String?,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$PromoResultToJson(_PromoResult instance) =>
    <String, dynamic>{
      'code': instance.code,
      'valid': instance.valid,
      'discountPct': instance.discountPct,
      'freeDelivery': instance.freeDelivery,
      'description': instance.description,
      'reason': instance.reason,
    };
