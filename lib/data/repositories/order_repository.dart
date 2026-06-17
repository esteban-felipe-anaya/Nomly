import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/order.dart';
import '../models/tracking.dart';
import 'guard.dart';

part 'order_repository.g.dart';

class PlaceOrderRequest {
  PlaceOrderRequest({
    required this.restaurantId,
    required this.addressId,
    required this.items,
    required this.totals,
    required this.paymentMethod,
    this.promoCode,
    this.scheduledFor,
  });

  final String restaurantId;
  final String addressId;
  final List<OrderItem> items;
  final OrderTotals totals;
  final String paymentMethod;
  final String? promoCode;
  final String? scheduledFor;

  Map<String, dynamic> toJson() => {
        'restaurantId': restaurantId,
        'addressId': addressId,
        'items': items.map((e) => e.toJson()).toList(),
        'totals': totals.toJson(),
        'paymentMethod': paymentMethod,
        'promoCode': promoCode,
        'scheduledFor': scheduledFor,
        'placedAt': DateTime.now().toUtc().toIso8601String(),
      };
}

class OrderRepository {
  OrderRepository(this._api);
  final NomlyApi _api;

  Future<Order> place(PlaceOrderRequest req) =>
      guard(() => _api.placeOrder(req.toJson()));

  Future<List<Order>> list() => guard(() async {
        final orders = await _api.getOrders();
        orders.sort((a, b) => b.placedAtDate.compareTo(a.placedAtDate));
        return orders;
      });

  Future<Order> get(String id) => guard(() => _api.getOrder(id));

  Future<Tracking> tracking(String id) => guard(() => _api.getTracking(id));
}

@Riverpod(keepAlive: true)
OrderRepository orderRepository(Ref ref) =>
    OrderRepository(ref.watch(nomlyApiProvider));
