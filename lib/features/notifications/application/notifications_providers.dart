import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/notification.dart';
import '../../../data/repositories/notification_repository.dart';

part 'notifications_providers.g.dart';

@Riverpod(keepAlive: true)
class NotificationsController extends _$NotificationsController {
  NotificationRepository get _repo => ref.read(notificationRepositoryProvider);

  @override
  Future<List<AppNotification>> build() => _repo.list();

  Future<void> markRead(AppNotification n) async {
    if (n.read) return;
    await _repo.markRead(n);
    final current = state.value ?? const [];
    state = AsyncData([
      for (final item in current)
        item.id == n.id ? item.copyWith(read: true) : item,
    ]);
  }

  Future<void> markAllRead() async {
    final current = state.value ?? const [];
    for (final n in current.where((e) => !e.read)) {
      await _repo.markRead(n);
    }
    state = AsyncData([for (final item in current) item.copyWith(read: true)]);
  }
}

@riverpod
int unreadNotificationCount(Ref ref) {
  final list = ref.watch(notificationsControllerProvider).value ?? const [];
  return list.where((n) => !n.read).length;
}
