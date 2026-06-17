import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const AppNotification._();

  const factory AppNotification({
    required String id,
    @Default('system') String type, // order | offer | system
    required String title,
    @Default('') String body,
    @Default(false) bool read,
    required String date,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  DateTime get dateTime =>
      DateTime.tryParse(date) ?? DateTime.fromMillisecondsSinceEpoch(0);
}

@freezed
abstract class FavoritesData with _$FavoritesData {
  const factory FavoritesData({
    @Default('fav_01') String id,
    @Default('usr_01') String userId,
    @Default(<String>[]) List<String> restaurants,
    @Default(<String>[]) List<String> dishes,
  }) = _FavoritesData;

  factory FavoritesData.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDataFromJson(json);
}
