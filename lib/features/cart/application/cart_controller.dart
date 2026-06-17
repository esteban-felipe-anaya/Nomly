import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../../core/storage/preferences.dart';
import '../../../data/models/cart_item.dart';
import '../../../data/models/promo.dart';
import 'cart_state.dart';

part 'cart_controller.g.dart';

const _eq = DeepCollectionEquality();

/// Owns the cart. Persists to shared_preferences so it survives relaunch, and
/// stays alive across navigation.
@Riverpod(keepAlive: true)
class CartController extends _$CartController {
  late final Preferences _prefs;

  @override
  CartState build() {
    _prefs = ref.watch(preferencesProvider);
    final json = _prefs.getJson(Preferences.kCart);
    if (json != null) {
      try {
        return CartState.fromJson(json);
      } catch (_) {
        // ignore corrupt cache
      }
    }
    return const CartState();
  }

  void _persist(CartState next) {
    state = next;
    _prefs.setJson(Preferences.kCart, next.toJson());
  }

  bool isDifferentRestaurant(String restaurantId) =>
      state.isNotEmpty && state.restaurantId != restaurantId;

  bool _sameLine(CartItem a, CartItem b) =>
      a.dishId == b.dishId &&
      a.instructions == b.instructions &&
      _eq.equals(a.selectedOptions, b.selectedOptions);

  /// Adds [item] to the cart. Assumes the cart is empty or already scoped to
  /// [restaurantId] (callers use [isDifferentRestaurant] + [replaceWith]).
  void add(
    CartItem item, {
    required String restaurantId,
    required String restaurantName,
    required double baseDeliveryFee,
    String currency = 'USD',
  }) {
    final items = [...state.items];
    final existing = items.indexWhere((e) => _sameLine(e, item));
    if (existing >= 0) {
      items[existing] = items[existing]
          .copyWith(quantity: items[existing].quantity + item.quantity);
    } else {
      items.add(item);
    }
    _persist(state.copyWith(
      items: items,
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      baseDeliveryFee: baseDeliveryFee,
      currency: currency,
    ));
  }

  /// Clears the cart and adds [item] for a new restaurant.
  void replaceWith(
    CartItem item, {
    required String restaurantId,
    required String restaurantName,
    required double baseDeliveryFee,
    String currency = 'USD',
  }) {
    _persist(CartState(
      items: [item],
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      baseDeliveryFee: baseDeliveryFee,
      currency: currency,
    ));
  }

  void setQuantity(String lineId, int quantity) {
    if (quantity <= 0) return removeLine(lineId);
    final items = state.items
        .map((e) => e.id == lineId ? e.copyWith(quantity: quantity) : e)
        .toList();
    _persist(state.copyWith(items: items));
  }

  void increment(String lineId) {
    final line = state.items.firstWhereOrNull((e) => e.id == lineId);
    if (line != null) setQuantity(lineId, line.quantity + 1);
  }

  void decrement(String lineId) {
    final line = state.items.firstWhereOrNull((e) => e.id == lineId);
    if (line != null) setQuantity(lineId, line.quantity - 1);
  }

  void setInstructions(String lineId, String text) {
    final items = state.items
        .map((e) => e.id == lineId ? e.copyWith(instructions: text) : e)
        .toList();
    _persist(state.copyWith(items: items));
  }

  void removeLine(String lineId) {
    final items = state.items.where((e) => e.id != lineId).toList();
    if (items.isEmpty) {
      _persist(const CartState());
    } else {
      _persist(state.copyWith(items: items));
    }
  }

  void applyPromo(PromoResult promo) =>
      _persist(state.copyWith(promo: promo));

  void clearPromo() {
    final next = state.copyWith(promo: null);
    // copyWith can't null a field via the standard generated method; rebuild.
    _persist(CartState(
      items: next.items,
      restaurantId: next.restaurantId,
      restaurantName: next.restaurantName,
      baseDeliveryFee: next.baseDeliveryFee,
      currency: next.currency,
      tip: next.tip,
    ));
  }

  void setTip(double tip) => _persist(state.copyWith(tip: tip));

  /// Replaces the entire cart with [items] for [restaurantId]. Used by reorder.
  void setCart({
    required List<CartItem> items,
    required String restaurantId,
    required String restaurantName,
    required double baseDeliveryFee,
    String currency = 'USD',
  }) {
    _persist(CartState(
      items: items,
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      baseDeliveryFee: baseDeliveryFee,
      currency: currency,
    ));
  }

  void clear() => _persist(const CartState());
}
