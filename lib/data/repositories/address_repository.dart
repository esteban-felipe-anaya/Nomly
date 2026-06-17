import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/address.dart';
import 'guard.dart';

part 'address_repository.g.dart';

class AddressRepository {
  AddressRepository(this._api);
  final NomlyApi _api;

  Future<List<Address>> list() => guard(_api.getAddresses);
  Future<Address> create(Address a) => guard(() => _api.createAddress(a));
  Future<Address> update(Address a) =>
      guard(() => _api.updateAddress(a.id, a));
  Future<void> delete(String id) => guard(() => _api.deleteAddress(id));
}

@Riverpod(keepAlive: true)
AddressRepository addressRepository(Ref ref) =>
    AddressRepository(ref.watch(nomlyApiProvider));
