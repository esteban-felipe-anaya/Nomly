import 'package:flutter_test/flutter_test.dart';
import 'package:nomly/data/models/restaurant_filter.dart';

void main() {
  test('empty filter only sends the default sort', () {
    expect(const RestaurantFilter().toQuery(), {'sort': 'recommended'});
  });

  test('maps every active field to its query parameter', () {
    const filter = RestaurantFilter(
      cuisineId: 'cui_pizza',
      query: 'napoli',
      minRating: 4.5,
      priceLevel: 2,
      freeDelivery: true,
      sort: RestaurantSort.rating,
    );
    expect(filter.toQuery(), {
      'sort': 'rating',
      'cuisineId': 'cui_pizza',
      'q': 'napoli',
      'minRating': 4.5,
      'priceLevel': 2,
      'freeDelivery': true,
    });
  });

  test('offersOnly is client-side and never hits the query', () {
    const filter = RestaurantFilter(offersOnly: true);
    expect(filter.toQuery().containsKey('offersOnly'), isFalse);
    expect(filter.hasActiveFilters, isTrue);
  });

  test('blank query and false freeDelivery are omitted', () {
    const filter = RestaurantFilter(query: '   ', freeDelivery: false);
    expect(filter.toQuery(), {'sort': 'recommended'});
  });

  test('activeCount reflects the number of applied constraints', () {
    const filter = RestaurantFilter(
      cuisineId: 'c',
      minRating: 4,
      freeDelivery: true,
      sort: RestaurantSort.distance,
    );
    // cuisine + minRating + freeDelivery + non-default sort = 4
    expect(filter.activeCount, 4);
  });

  test('copyWith can clear a nullable field', () {
    const filter = RestaurantFilter(cuisineId: 'c');
    final cleared = filter.copyWith(cuisineId: () => null);
    expect(cleared.cuisineId, isNull);
  });
}
