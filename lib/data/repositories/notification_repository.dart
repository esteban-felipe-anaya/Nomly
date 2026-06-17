import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/notification.dart';
import 'guard.dart';

part 'notification_repository.g.dart';

class NotificationRepository {
  NotificationRepository(this._api);
  final NomlyApi _api;

  Future<List<AppNotification>> list() => guard(() async {
        final items = await _api.getNotifications();
        items.sort((a, b) => b.dateTime.compareTo(a.dateTime));
        return items;
      });

  Future<AppNotification> markRead(AppNotification n) =>
      guard(() => _api.updateNotification(n.id, n.copyWith(read: true)));
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(Ref ref) =>
    NotificationRepository(ref.watch(nomlyApiProvider));
