// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads and mutates the user's address book.

@ProviderFor(AddressController)
final addressControllerProvider = AddressControllerProvider._();

/// Loads and mutates the user's address book.
final class AddressControllerProvider
    extends $AsyncNotifierProvider<AddressController, List<Address>> {
  /// Loads and mutates the user's address book.
  AddressControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addressControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addressControllerHash();

  @$internal
  @override
  AddressController create() => AddressController();
}

String _$addressControllerHash() => r'85ebf3ac045dd87e3a593686913a3c76a685ca09';

/// Loads and mutates the user's address book.

abstract class _$AddressController extends $AsyncNotifier<List<Address>> {
  FutureOr<List<Address>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Address>>, List<Address>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Address>>, List<Address>>,
              AsyncValue<List<Address>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// The selected delivery address id, persisted across launches.

@ProviderFor(SelectedAddressId)
final selectedAddressIdProvider = SelectedAddressIdProvider._();

/// The selected delivery address id, persisted across launches.
final class SelectedAddressIdProvider
    extends $NotifierProvider<SelectedAddressId, String?> {
  /// The selected delivery address id, persisted across launches.
  SelectedAddressIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAddressIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAddressIdHash();

  @$internal
  @override
  SelectedAddressId create() => SelectedAddressId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$selectedAddressIdHash() => r'4f6c645531b35c843b7fd39906b4e526a0e0e2f8';

/// The selected delivery address id, persisted across launches.

abstract class _$SelectedAddressId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Resolves the currently-selected [Address] (falling back to the default /
/// first address). Returns null while addresses are still loading.

@ProviderFor(selectedAddress)
final selectedAddressProvider = SelectedAddressProvider._();

/// Resolves the currently-selected [Address] (falling back to the default /
/// first address). Returns null while addresses are still loading.

final class SelectedAddressProvider
    extends $FunctionalProvider<Address?, Address?, Address?>
    with $Provider<Address?> {
  /// Resolves the currently-selected [Address] (falling back to the default /
  /// first address). Returns null while addresses are still loading.
  SelectedAddressProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedAddressProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedAddressHash();

  @$internal
  @override
  $ProviderElement<Address?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Address? create(Ref ref) {
    return selectedAddress(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Address? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Address?>(value),
    );
  }
}

String _$selectedAddressHash() => r'e5dc56fd59464d2bb50b4965a49d4ff03eab0952';
