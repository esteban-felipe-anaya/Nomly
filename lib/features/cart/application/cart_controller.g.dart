// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Owns the cart. Persists to shared_preferences so it survives relaunch, and
/// stays alive across navigation.

@ProviderFor(CartController)
final cartControllerProvider = CartControllerProvider._();

/// Owns the cart. Persists to shared_preferences so it survives relaunch, and
/// stays alive across navigation.
final class CartControllerProvider
    extends $NotifierProvider<CartController, CartState> {
  /// Owns the cart. Persists to shared_preferences so it survives relaunch, and
  /// stays alive across navigation.
  CartControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartControllerHash();

  @$internal
  @override
  CartController create() => CartController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartState>(value),
    );
  }
}

String _$cartControllerHash() => r'c16ffd49728760c52914b274fb9c0276ab8216a6';

/// Owns the cart. Persists to shared_preferences so it survives relaunch, and
/// stays alive across navigation.

abstract class _$CartController extends $Notifier<CartState> {
  CartState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CartState, CartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CartState, CartState>,
              CartState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
