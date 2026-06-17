// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads and toggles the user's favorite restaurants and dishes. Favorites are
/// persisted server-side (mock API) so they survive relaunch.

@ProviderFor(FavoritesController)
final favoritesControllerProvider = FavoritesControllerProvider._();

/// Loads and toggles the user's favorite restaurants and dishes. Favorites are
/// persisted server-side (mock API) so they survive relaunch.
final class FavoritesControllerProvider
    extends $AsyncNotifierProvider<FavoritesController, FavoritesData> {
  /// Loads and toggles the user's favorite restaurants and dishes. Favorites are
  /// persisted server-side (mock API) so they survive relaunch.
  FavoritesControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favoritesControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favoritesControllerHash();

  @$internal
  @override
  FavoritesController create() => FavoritesController();
}

String _$favoritesControllerHash() =>
    r'60b3a645096e1c73511f9cc420cb20df947afa96';

/// Loads and toggles the user's favorite restaurants and dishes. Favorites are
/// persisted server-side (mock API) so they survive relaunch.

abstract class _$FavoritesController extends $AsyncNotifier<FavoritesData> {
  FutureOr<FavoritesData> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<FavoritesData>, FavoritesData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<FavoritesData>, FavoritesData>,
              AsyncValue<FavoritesData>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
