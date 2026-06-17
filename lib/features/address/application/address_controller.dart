import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/core_providers.dart';
import '../../../core/storage/preferences.dart';
import '../../../data/models/address.dart';
import '../../../data/repositories/address_repository.dart';

part 'address_controller.g.dart';

/// Loads and mutates the user's address book.
@Riverpod(keepAlive: true)
class AddressController extends _$AddressController {
  AddressRepository get _repo => ref.read(addressRepositoryProvider);

  @override
  Future<List<Address>> build() => _repo.list();

  Future<Address> add(Address a) async {
    final created = await _repo.create(a);
    ref.invalidateSelf();
    await future;
    return created;
  }

  Future<void> edit(Address a) async {
    await _repo.update(a);
    ref.invalidateSelf();
    await future;
  }

  Future<void> remove(String id) async {
    await _repo.delete(id);
    ref.invalidateSelf();
    await future;
  }
}

/// The selected delivery address id, persisted across launches.
@Riverpod(keepAlive: true)
class SelectedAddressId extends _$SelectedAddressId {
  Preferences get _prefs => ref.read(preferencesProvider);

  @override
  String? build() => _prefs.getString(Preferences.kSelectedAddress);

  void select(String id) {
    state = id;
    _prefs.setString(Preferences.kSelectedAddress, id);
  }
}

/// Resolves the currently-selected [Address] (falling back to the default /
/// first address). Returns null while addresses are still loading.
@riverpod
Address? selectedAddress(Ref ref) {
  final addresses = ref.watch(addressControllerProvider).value ?? const [];
  if (addresses.isEmpty) return null;
  final selectedId = ref.watch(selectedAddressIdProvider);
  return addresses.firstWhereOrNull((a) => a.id == selectedId) ??
      addresses.firstWhereOrNull((a) => a.isDefault) ??
      addresses.first;
}
