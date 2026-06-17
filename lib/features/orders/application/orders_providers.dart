import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/models/order.dart';
import '../../../data/repositories/order_repository.dart';

part 'orders_providers.g.dart';

/// All of the user's orders, newest first.
@riverpod
Future<List<Order>> ordersList(Ref ref) =>
    ref.watch(orderRepositoryProvider).list();

/// A single order by id.
@riverpod
Future<Order> orderDetail(Ref ref, String id) =>
    ref.watch(orderRepositoryProvider).get(id);

/// The most recent active (not delivered/cancelled) order, if any — surfaced on
/// the home screen and orders tab as a live tracking banner.
@riverpod
Future<Order?> activeOrder(Ref ref) async {
  final orders = await ref.watch(ordersListProvider.future);
  for (final o in orders) {
    if (o.isActive) return o;
  }
  return null;
}
