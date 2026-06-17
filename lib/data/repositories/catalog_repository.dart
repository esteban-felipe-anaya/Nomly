import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/core_providers.dart';
import '../api/nomly_api.dart';
import '../models/catalog.dart';
import 'guard.dart';

part 'catalog_repository.g.dart';

class CatalogRepository {
  CatalogRepository(this._api);
  final NomlyApi _api;

  Future<List<Cuisine>> cuisines() => guard(_api.getCuisines);
  Future<List<PromoBanner>> banners() => guard(_api.getBanners);
}

@Riverpod(keepAlive: true)
CatalogRepository catalogRepository(Ref ref) =>
    CatalogRepository(ref.watch(nomlyApiProvider));
