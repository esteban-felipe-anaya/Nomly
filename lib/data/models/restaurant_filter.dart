import 'package:flutter/foundation.dart';

/// Sort options for the restaurant list, mapped to the API `sort` query value.
enum RestaurantSort {
  recommended('recommended', 'Recommended'),
  rating('rating', 'Rating'),
  deliveryTime('delivery_time', 'Delivery time'),
  distance('distance', 'Distance');

  const RestaurantSort(this.query, this.label);
  final String query;
  final String label;
}

/// Immutable filter/sort state for the restaurants feed. [toQuery] is the
/// single source of truth that maps UI selections to API query parameters and
/// is covered by unit tests.
@immutable
class RestaurantFilter {
  const RestaurantFilter({
    this.cuisineId,
    this.query,
    this.minRating,
    this.priceLevel,
    this.freeDelivery = false,
    this.offersOnly = false,
    this.sort = RestaurantSort.recommended,
  });

  final String? cuisineId;
  final String? query;
  final double? minRating;
  final int? priceLevel;
  final bool freeDelivery;
  final bool offersOnly;
  final RestaurantSort sort;

  bool get hasActiveFilters =>
      cuisineId != null ||
      minRating != null ||
      priceLevel != null ||
      freeDelivery ||
      offersOnly ||
      sort != RestaurantSort.recommended;

  int get activeCount => [
        cuisineId != null,
        minRating != null,
        priceLevel != null,
        freeDelivery,
        offersOnly,
        sort != RestaurantSort.recommended,
      ].where((e) => e).length;

  /// Maps the filter into json-server / mock-API query parameters. Null/empty
  /// values are omitted so the URL stays clean.
  Map<String, dynamic> toQuery() {
    final q = <String, dynamic>{'sort': sort.query};
    if (cuisineId != null && cuisineId!.isNotEmpty) q['cuisineId'] = cuisineId;
    if (query != null && query!.trim().isNotEmpty) q['q'] = query!.trim();
    if (minRating != null) q['minRating'] = minRating;
    if (priceLevel != null) q['priceLevel'] = priceLevel;
    if (freeDelivery) q['freeDelivery'] = true;
    return q;
  }

  RestaurantFilter copyWith({
    String? Function()? cuisineId,
    String? Function()? query,
    double? Function()? minRating,
    int? Function()? priceLevel,
    bool? freeDelivery,
    bool? offersOnly,
    RestaurantSort? sort,
  }) {
    return RestaurantFilter(
      cuisineId: cuisineId != null ? cuisineId() : this.cuisineId,
      query: query != null ? query() : this.query,
      minRating: minRating != null ? minRating() : this.minRating,
      priceLevel: priceLevel != null ? priceLevel() : this.priceLevel,
      freeDelivery: freeDelivery ?? this.freeDelivery,
      offersOnly: offersOnly ?? this.offersOnly,
      sort: sort ?? this.sort,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RestaurantFilter &&
      other.cuisineId == cuisineId &&
      other.query == query &&
      other.minRating == minRating &&
      other.priceLevel == priceLevel &&
      other.freeDelivery == freeDelivery &&
      other.offersOnly == offersOnly &&
      other.sort == sort;

  @override
  int get hashCode => Object.hash(
      cuisineId, query, minRating, priceLevel, freeDelivery, offersOnly, sort);
}
