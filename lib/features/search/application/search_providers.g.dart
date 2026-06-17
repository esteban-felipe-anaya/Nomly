// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Restaurant matches for a query.

@ProviderFor(searchRestaurants)
final searchRestaurantsProvider = SearchRestaurantsFamily._();

/// Restaurant matches for a query.

final class SearchRestaurantsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Restaurant>>,
          List<Restaurant>,
          FutureOr<List<Restaurant>>
        >
    with $FutureModifier<List<Restaurant>>, $FutureProvider<List<Restaurant>> {
  /// Restaurant matches for a query.
  SearchRestaurantsProvider._({
    required SearchRestaurantsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchRestaurantsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchRestaurantsHash();

  @override
  String toString() {
    return r'searchRestaurantsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Restaurant>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Restaurant>> create(Ref ref) {
    final argument = this.argument as String;
    return searchRestaurants(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchRestaurantsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchRestaurantsHash() => r'ab5a5a24f7c0e35c3a2757b2d2e12d047661af6a';

/// Restaurant matches for a query.

final class SearchRestaurantsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Restaurant>>, String> {
  SearchRestaurantsFamily._()
    : super(
        retry: null,
        name: r'searchRestaurantsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Restaurant matches for a query.

  SearchRestaurantsProvider call(String query) =>
      SearchRestaurantsProvider._(argument: query, from: this);

  @override
  String toString() => r'searchRestaurantsProvider';
}

/// Dish matches for a query (full-text via the mock API).

@ProviderFor(searchDishesResults)
final searchDishesResultsProvider = SearchDishesResultsFamily._();

/// Dish matches for a query (full-text via the mock API).

final class SearchDishesResultsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Dish>>,
          List<Dish>,
          FutureOr<List<Dish>>
        >
    with $FutureModifier<List<Dish>>, $FutureProvider<List<Dish>> {
  /// Dish matches for a query (full-text via the mock API).
  SearchDishesResultsProvider._({
    required SearchDishesResultsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'searchDishesResultsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$searchDishesResultsHash();

  @override
  String toString() {
    return r'searchDishesResultsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Dish>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Dish>> create(Ref ref) {
    final argument = this.argument as String;
    return searchDishesResults(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchDishesResultsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchDishesResultsHash() =>
    r'b94bf7cb488fad0474d843951e2fc41a00ebfe26';

/// Dish matches for a query (full-text via the mock API).

final class SearchDishesResultsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Dish>>, String> {
  SearchDishesResultsFamily._()
    : super(
        retry: null,
        name: r'searchDishesResultsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Dish matches for a query (full-text via the mock API).

  SearchDishesResultsProvider call(String query) =>
      SearchDishesResultsProvider._(argument: query, from: this);

  @override
  String toString() => r'searchDishesResultsProvider';
}

/// Recent search terms, persisted across launches (most-recent first, max 8).

@ProviderFor(RecentSearches)
final recentSearchesProvider = RecentSearchesProvider._();

/// Recent search terms, persisted across launches (most-recent first, max 8).
final class RecentSearchesProvider
    extends $NotifierProvider<RecentSearches, List<String>> {
  /// Recent search terms, persisted across launches (most-recent first, max 8).
  RecentSearchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentSearchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentSearchesHash();

  @$internal
  @override
  RecentSearches create() => RecentSearches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<String>>(value),
    );
  }
}

String _$recentSearchesHash() => r'662afb0420d77613f93859ac35ca66f57d69d6be';

/// Recent search terms, persisted across launches (most-recent first, max 8).

abstract class _$RecentSearches extends $Notifier<List<String>> {
  List<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<String>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<String>, List<String>>,
              List<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
