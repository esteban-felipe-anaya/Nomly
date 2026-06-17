// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String,
      type: json['type'] as String? ?? 'system',
      title: json['title'] as String,
      body: json['body'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      date: json['date'] as String,
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'date': instance.date,
    };

_FavoritesData _$FavoritesDataFromJson(Map<String, dynamic> json) =>
    _FavoritesData(
      id: json['id'] as String? ?? 'fav_01',
      userId: json['userId'] as String? ?? 'usr_01',
      restaurants:
          (json['restaurants'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      dishes:
          (json['dishes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$FavoritesDataToJson(_FavoritesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'restaurants': instance.restaurants,
      'dishes': instance.dishes,
    };
