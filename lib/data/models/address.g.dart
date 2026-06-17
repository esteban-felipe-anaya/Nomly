// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Address _$AddressFromJson(Map<String, dynamic> json) => _Address(
  id: json['id'] as String,
  userId: json['userId'] as String? ?? 'usr_01',
  label: json['label'] as String,
  line1: json['line1'] as String,
  line2: json['line2'] as String? ?? '',
  city: json['city'] as String? ?? '',
  notes: json['notes'] as String? ?? '',
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  isDefault: json['isDefault'] as bool? ?? false,
);

Map<String, dynamic> _$AddressToJson(_Address instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'label': instance.label,
  'line1': instance.line1,
  'line2': instance.line2,
  'city': instance.city,
  'notes': instance.notes,
  'lat': instance.lat,
  'lng': instance.lng,
  'isDefault': instance.isDefault,
};
