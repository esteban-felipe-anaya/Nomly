import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/address.dart';
import '../../features/account/presentation/account_screen.dart';
import '../../features/account/presentation/payment_methods_screen.dart';
import '../../features/account/presentation/settings_screen.dart';
import '../../features/address/presentation/address_book_screen.dart';
import '../../features/address/presentation/address_edit_screen.dart';
import '../../features/address/presentation/select_address_screen.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/cart/presentation/cart_screen.dart';
import '../../features/checkout/presentation/checkout_screen.dart';
import '../../features/favorites/presentation/favorites_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/orders/presentation/order_detail_screen.dart';
import '../../features/orders/presentation/orders_screen.dart';
import '../../features/restaurant/presentation/restaurant_detail_screen.dart';
import '../../features/restaurants/presentation/restaurants_screen.dart';
import '../../features/search/presentation/search_screen.dart';
import '../../features/tracking/presentation/tracking_screen.dart';
import '../../shared/layout/adaptive_scaffold.dart';
import '../providers/core_providers.dart';
import '../storage/preferences.dart';
import 'routes.dart';

part 'app_router.g.dart';

final _shellKey = GlobalKey<NavigatorState>();
final _rootKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(Ref ref) {
  // Re-run redirects whenever auth state changes.
  final refresh = ValueNotifier<int>(0);
  ref.listen(authControllerProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: Routes.splash,
    navigatorKey: _rootKey,
    refreshListenable: refresh,
    redirect: (context, state) {
      final auth = ref.read(authControllerProvider);
      final prefs = ref.read(preferencesProvider);
      final loc = state.matchedLocation;

      const authRoutes = {Routes.login, Routes.register, Routes.forgotPassword};
      final atSplash = loc == Routes.splash;
      final atOnboarding = loc == Routes.onboarding;

      // Wait for session restore.
      if (!auth.isKnown) return atSplash ? null : Routes.splash;

      // First-run onboarding.
      final onboarded = prefs.getBool(Preferences.kOnboardingDone);
      if (!onboarded && !atOnboarding) return Routes.onboarding;
      if (onboarded && (atSplash || atOnboarding)) return Routes.home;

      // Checkout requires authentication.
      if (loc == Routes.checkout && !auth.isAuthenticated) {
        return '${Routes.login}?redirect=${Uri.encodeComponent(loc)}';
      }

      // Avoid showing splash once known.
      if (atSplash) return Routes.home;
      // If already authenticated, don't sit on auth screens reached via redirect.
      if (auth.isAuthenticated && authRoutes.contains(loc) &&
          state.uri.queryParameters['redirect'] == null) {
        return Routes.home;
      }
      return null;
    },
    routes: [
      GoRoute(path: Routes.splash, builder: (_, _) => const SplashScreen()),
      GoRoute(path: Routes.onboarding, builder: (_, _) => const OnboardingScreen()),
      GoRoute(path: Routes.login, builder: (_, _) => const LoginScreen()),
      GoRoute(path: Routes.register, builder: (_, _) => const RegisterScreen()),
      GoRoute(
          path: Routes.forgotPassword,
          builder: (_, _) => const ForgotPasswordScreen()),

      // Main shell with bottom-nav / rail tabs.
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => AdaptiveNavScaffold(shell: shell),
        branches: [
          StatefulShellBranch(navigatorKey: _shellKey, routes: [
            GoRoute(path: Routes.home, builder: (_, _) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
                path: Routes.restaurants,
                builder: (_, _) => const RestaurantsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.search, builder: (_, _) => const SearchScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.orders, builder: (_, _) => const OrdersScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: Routes.account, builder: (_, _) => const AccountScreen()),
          ]),
        ],
      ),

      // Pushed full-screen routes.
      GoRoute(
        path: Routes.restaurantDetail,
        builder: (_, state) =>
            RestaurantDetailScreen(restaurantId: state.pathParameters['id']!),
      ),
      GoRoute(path: Routes.cart, builder: (_, _) => const CartScreen()),
      GoRoute(path: Routes.checkout, builder: (_, _) => const CheckoutScreen()),
      GoRoute(
        path: Routes.tracking,
        builder: (_, state) =>
            TrackingScreen(orderId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: Routes.orderDetail,
        builder: (_, state) =>
            OrderDetailScreen(orderId: state.pathParameters['id']!),
      ),
      GoRoute(path: Routes.favorites, builder: (_, _) => const FavoritesScreen()),
      GoRoute(
          path: Routes.notifications,
          builder: (_, _) => const NotificationsScreen()),
      GoRoute(
          path: Routes.addresses, builder: (_, _) => const AddressBookScreen()),
      GoRoute(
        path: Routes.addressEdit,
        builder: (_, state) =>
            AddressEditScreen(existing: state.extra as Address?),
      ),
      GoRoute(
          path: Routes.selectAddress,
          builder: (_, _) => const SelectAddressScreen()),
      GoRoute(path: Routes.settings, builder: (_, _) => const SettingsScreen()),
      GoRoute(
          path: Routes.paymentMethods,
          builder: (_, _) => const PaymentMethodsScreen()),
    ],
  );
}
