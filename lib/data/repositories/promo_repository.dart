import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/promo.dart';
import 'guard.dart';

part 'promo_repository.g.dart';

class PromoRepository {
  PromoRepository(this._api);
  final NomlyApi _api;

  Future<PromoResult> validate(String code, double subtotal) => guard(
      () => _api.validatePromo({'code': code, 'subtotal': subtotal}));
}

@Riverpod(keepAlive: true)
PromoRepository promoRepository(Ref ref) =>
    PromoRepository(ref.watch(nomlyApiProvider));
