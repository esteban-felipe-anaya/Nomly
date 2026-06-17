/// Centralized route paths and names for go_router. Keeping them here avoids
/// stringly-typed navigation scattered across the app and keeps web URLs tidy.
abstract final class Routes {
  // Top-level / pre-shell
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgot-password';

  // Shell tabs
  static const home = '/home';
  static const restaurants = '/restaurants';
  static const search = '/search';
  static const orders = '/orders';
  static const account = '/account';

  // Detail / flow routes
  static const restaurantDetail = '/restaurants/:id'; // build via restaurantPath
  static const cart = '/cart';
  static const checkout = '/checkout';
  static const tracking = '/orders/:id/tracking';
  static const orderDetail = '/orders/:id';
  static const favorites = '/favorites';
  static const notifications = '/notifications';
  static const addresses = '/account/addresses';
  static const addressEdit = '/account/addresses/edit';
  static const selectAddress = '/select-address';
  static const settings = '/account/settings';
  static const paymentMethods = '/account/payment-methods';

  static String restaurantPath(String id) => '/restaurants/$id';
  static String trackingPath(String id) => '/orders/$id/tracking';
  static String orderPath(String id) => '/orders/$id';
}
