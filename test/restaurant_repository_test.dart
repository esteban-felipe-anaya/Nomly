import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nomly/data/api/nomly_api.dart';
import 'package:nomly/data/models/restaurant_filter.dart';
import 'package:nomly/data/repositories/restaurant_repository.dart';

/// Minimal Dio adapter that returns a canned JSON body for any request, so the
/// repository can be exercised without a live server.
class _CannedAdapter implements HttpClientAdapter {
  _CannedAdapter(this.body);
  final String body;

  @override
  Future<ResponseBody> fetch(RequestOptions options,
      Stream<Uint8List>? requestStream, Future<void>? cancelFuture) async {
    return ResponseBody.fromString(
      body,
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType]
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

const _twoRestaurants = '''
[
  {"id":"rst_01","name":"Napoli","cuisine":"Pizza","cuisineId":"cui_pizza",
   "rating":4.7,"deliveryMinutes":20,"deliveryFee":0,"priceLevel":2,
   "freeDelivery":true,"offers":["20% off"]},
  {"id":"rst_02","name":"Slice","cuisine":"Pizza","cuisineId":"cui_pizza",
   "rating":4.2,"deliveryMinutes":25,"deliveryFee":2.49,"priceLevel":1,
   "freeDelivery":false,"offers":[]}
]
''';

void main() {
  RestaurantRepository buildRepo(String body) {
    final dio = Dio(BaseOptions(baseUrl: 'http://test.local'))
      ..httpClientAdapter = _CannedAdapter(body);
    return RestaurantRepository(NomlyApi(dio));
  }

  test('parses the restaurants payload into typed models', () async {
    final repo = buildRepo(_twoRestaurants);
    final list = await repo.list(const RestaurantFilter());
    expect(list, hasLength(2));
    expect(list.first.id, 'rst_01');
    expect(list.first.rating, 4.7);
    expect(list.first.freeDelivery, isTrue);
    expect(list.first.offers, contains('20% off'));
  });

  test('applies the client-side offersOnly filter', () async {
    final repo = buildRepo(_twoRestaurants);
    final list =
        await repo.list(const RestaurantFilter(offersOnly: true));
    expect(list, hasLength(1));
    expect(list.single.id, 'rst_01');
  });
}
