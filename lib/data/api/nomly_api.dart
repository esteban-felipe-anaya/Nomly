import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/address.dart';
import '../models/catalog.dart';
import '../models/dish.dart';
import '../models/notification.dart';
import '../models/order.dart';
import '../models/promo.dart';
import '../models/restaurant.dart';
import '../models/tracking.dart';
import '../models/user.dart';

part 'nomly_api.g.dart';

/// Retrofit definition of the Nomly mock REST API. Generated implementation
/// lives in `nomly_api.g.dart`.
@RestApi()
abstract class NomlyApi {
  factory NomlyApi(Dio dio, {String? baseUrl}) = _NomlyApi;

  // --- Auth ---------------------------------------------------------------
  @POST('/auth/login')
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST('/auth/register')
  Future<AuthResponse> register(@Body() Map<String, dynamic> body);

  @GET('/auth/me')
  Future<MeResponse> me();

  // --- Addresses ----------------------------------------------------------
  @GET('/addresses')
  Future<List<Address>> getAddresses();

  @POST('/addresses')
  Future<Address> createAddress(@Body() Address address);

  @PUT('/addresses/{id}')
  Future<Address> updateAddress(@Path('id') String id, @Body() Address address);

  @DELETE('/addresses/{id}')
  Future<void> deleteAddress(@Path('id') String id);

  // --- Catalog ------------------------------------------------------------
  @GET('/cuisines')
  Future<List<Cuisine>> getCuisines();

  @GET('/banners')
  Future<List<PromoBanner>> getBanners();

  // --- Restaurants & dishes ----------------------------------------------
  @GET('/restaurants')
  Future<List<Restaurant>> getRestaurants(
      @Queries() Map<String, dynamic> queries);

  @GET('/restaurants/{id}')
  Future<Restaurant> getRestaurant(@Path('id') String id);

  @GET('/restaurants/{id}/menu')
  Future<List<MenuCategory>> getMenu(@Path('id') String id);

  @GET('/dishes/{id}')
  Future<Dish> getDish(@Path('id') String id);

  /// Full-text dish search (json-server `q`). Used by the search screen.
  @GET('/dishes')
  Future<List<Dish>> searchDishes(@Queries() Map<String, dynamic> queries);

  // --- Promo --------------------------------------------------------------
  @POST('/promo/validate')
  Future<PromoResult> validatePromo(@Body() Map<String, dynamic> body);

  // --- Orders -------------------------------------------------------------
  @POST('/orders')
  Future<Order> placeOrder(@Body() Map<String, dynamic> body);

  @GET('/orders')
  Future<List<Order>> getOrders();

  @GET('/orders/{id}')
  Future<Order> getOrder(@Path('id') String id);

  @GET('/orders/{id}/tracking')
  Future<Tracking> getTracking(@Path('id') String id);

  // --- Favorites ----------------------------------------------------------
  @GET('/favorites')
  Future<List<FavoritesData>> getFavorites();

  @PUT('/favorites/{id}')
  Future<FavoritesData> updateFavorites(
      @Path('id') String id, @Body() FavoritesData favorites);

  // --- Notifications ------------------------------------------------------
  @GET('/notifications')
  Future<List<AppNotification>> getNotifications();

  @PUT('/notifications/{id}')
  Future<AppNotification> updateNotification(
      @Path('id') String id, @Body() AppNotification notification);
}
