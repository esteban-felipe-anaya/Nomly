# Nomly — UI contract for feature screens

You are building **presentation widgets only**. Do NOT create new providers, models,
repositories, routes, shared widgets, or run build_runner. Use ONLY what is listed
here. If you think something is missing, use a sensible composition of existing
pieces; do not invent provider names. Match the existing code style.

Package versions (write code for THESE APIs):
- Riverpod 3 with codegen. Widgets: `ConsumerWidget` / `ConsumerStatefulWidget`
  (`import 'package:flutter_riverpod/flutter_riverpod.dart';`). Read state with
  `ref.watch(xProvider)`, actions with `ref.read(xProvider.notifier)`.
  For `.family` providers call `ref.watch(xProvider(arg))`.
  For async providers awaited in code: `await ref.watch(xProvider.future)`.
- go_router 17: navigate with `context.push(path)`, `context.go(path)`, `context.pop()`
  (`import 'package:go_router/go_router.dart';`).
- intl via `Formatters` (below). NEVER format money/dates manually.

## Theme helpers (`import '../../../core/theme/app_theme.dart';`)
- `context.scheme` → ColorScheme, `context.textTheme` → TextTheme,
  `context.nomly` → NomlyColors (`.success`, `.onSuccess`, `.successContainer`,
  `.onSuccessContainer`, `.rating`).
- Spacing/radius (`import '../../../core/theme/app_spacing.dart';`):
  `AppSpacing.xs/sm/md/lg/xl/xxl/xxxl` (doubles), `AppSpacing.page` (EdgeInsets),
  `AppRadius.sm/md/lg/xl/pill`, `AppRadius.card/sheet/image` (BorderRadius),
  `AppDurations.fast/medium/slow`.

## Formatters (`import '../../../core/utils/formatters.dart';`)
`Formatters.money(num, currency: 'USD')`, `.fee(num)` ("Free" when 0),
`.dateTime(DateTime)`, `.date(DateTime)`, `.time(DateTime)`, `.minutes(int)`,
`.priceLevel(int)`, `.distance(double)`.

## Routes (`import '../../../core/router/routes.dart';`)
`Routes.home/restaurants/search/orders/account/cart/checkout/favorites/notifications/
settings/paymentMethods/addresses/addressEdit/selectAddress/login`.
Builders: `Routes.restaurantPath(id)`, `Routes.orderPath(id)`, `Routes.trackingPath(id)`.

## Shared widgets (`import '../../../shared/widgets/<file>.dart';`)
- `AppNetworkImage(url:, width?, height?, fit?, borderRadius?)` — app_network_image.dart
- `ShimmerBox(width?, height, radius)`, `ShimmerArea(child:)` — shimmer_box.dart
- `EmptyView(title:, message?, icon?, action?)`, `ErrorView(error:, onRetry?)`,
  `AsyncView<T>(value:, data: (T)=>Widget, loading?: ()=>Widget, onRetry?)` — state_views.dart
- `RatingBadge(rating:, count?, dense?)`, `FreeDeliveryChip()`, `OfferChip(label:)`,
  `MetaRow(parts: List<String>)`, `restaurantMeta(minutes:, deliveryFee:, priceLevel:, distanceKm?)`
  — badges.dart
- `QuantityStepper(quantity:, onChanged:, min?, max?, dense?)` — quantity_stepper.dart
- `SectionHeader(title:, actionLabel?, onAction?)` — section_header.dart
- `FavoriteRestaurantButton(restaurantId:, filled?)`, `FavoriteDishButton(dishId:, filled?)`
  — favorite_button.dart
- `RestaurantCard(restaurant:, onTap:, width?)`, `RestaurantCardSkeleton(width?)` — restaurant_card.dart
- `DishTile(dish:, onTap:, onAdd?, trailingBadge?)` — dish_tile.dart
- `CartBadgeButton()` — cart_badge_button.dart

## Layout (`import '../../../shared/layout/responsive.dart';`)
`context.layout` (LayoutType.compact/medium/expanded), `context.isCompact`,
`context.isExpanded`, `ResponsiveBuilder(builder: (ctx, layout)=>...)`,
`gridColumnsForWidth(width)`, `CenteredConstrained(child:, maxWidth?)`.

## Models (`import '../../../data/models/<file>.dart';`)
- restaurant.dart: `Restaurant{id,name,cuisineId,cuisine,description,cover,logo,rating,
  ratingCount,deliveryMinutes,deliveryFee,priceLevel,freeDelivery,offers:List<String>,
  distanceKm,lat?,lng?,address,menu:List<MenuCategory>,hasOffers}`,
  `MenuCategory{category,items:List<Dish>}`
- dish.dart: `Dish{id,restaurantId,name,category,description,price,currency,image,popular,
  customization:List<CustomizationGroup>}`, `CustomizationGroup{group,type,isRequired,
  options:List<CustomizationOption>,isSingle}`, `CustomizationOption{name,priceDelta}`
- order.dart: `Order{id,userId,restaurantId,restaurantName,restaurantCover,addressId,
  items:List<OrderItem>,totals:OrderTotals,promoCode?,paymentMethod,scheduledFor?,status,
  placedAt,etaMinutes,courier?,route,placedAtDate:DateTime,isActive,itemCount}`,
  `OrderItem{dishId,restaurantId,name,image,unitPrice,quantity,selectedOptions,lineTotal,
  instructions}`, `OrderTotals{subtotal,discount,deliveryFee,serviceFee,tax,tip,total}`,
  `Courier{name,avatar,phone,lat,lng}`. status string ∈ confirmed/preparing/picked_up/
  on_the_way/delivered.
- address.dart: `Address{id,userId,label,line1,line2,city,notes,lat?,lng?,isDefault,summary}`
- user.dart: `User{id,name,email,phone,avatar}`
- cart_item.dart: `CartItem{id,dishId,restaurantId,restaurantName,name,image,unitPrice,
  currency,quantity,selectedOptions:List<CustomizationOption>,instructions,unitTotal,
  lineTotal,optionsLabel}`
- notification.dart: `AppNotification{id,type,title,body,read,date,dateTime}`,
  `FavoritesData{id,userId,restaurants:List<String>,dishes:List<String>}`
- catalog.dart: `Cuisine{id,name,icon}`, `PromoBanner{id,title,subtitle,image,restaurantId?}`

## Providers
- Auth: `authControllerProvider` → AuthState{status,user?,isAuthenticated,isGuest}.
  Notifier: `.login(email,pwd)`, `.register(name,email,pwd)`, `.logout()`, `.continueAsGuest()`
  (`import '../../auth/application/auth_controller.dart';`)
- Cart: `cartControllerProvider` → CartState{items,restaurantId?,restaurantName,baseDeliveryFee,
  currency,promo?,tip,count,isEmpty,totals:OrderTotals}. Notifier: `.increment(lineId)`,
  `.decrement(lineId)`, `.setQuantity`, `.setInstructions`, `.removeLine`, `.clear()`,
  `.setCart(items:,restaurantId:,restaurantName:,baseDeliveryFee:,currency:)`, `.reorder` n/a use setCart.
  (`import '../../cart/application/cart_controller.dart';`)
- Favorites: `favoritesControllerProvider` → AsyncValue<FavoritesData>. Notifier:
  `.toggleRestaurant(id)`, `.toggleDish(id)`. (`import '../../favorites/application/favorites_controller.dart';`)
- Settings: `settingsControllerProvider` → AppSettings{themeMode:ThemeMode,locale:Locale?}.
  Notifier: `.setThemeMode(ThemeMode)`, `.setLocale(Locale?)`. `supportedLocales`.
  (`import '../../account/application/settings_controller.dart';`)
- Address: `addressControllerProvider` → AsyncValue<List<Address>>. Notifier: `.add(Address)`,
  `.edit(Address)`, `.remove(id)`. `selectedAddressIdProvider` (String?) Notifier `.select(id)`.
  `selectedAddressProvider` → Address? (`import '../../address/application/address_controller.dart';`)
- Orders: `ordersListProvider` → AsyncValue<List<Order>>, `orderDetailProvider(id)` →
  AsyncValue<Order>, `activeOrderProvider` → AsyncValue<Order?>.
  (`import '../../orders/application/orders_providers.dart';`)
- Restaurant detail (for reorder delivery fee / dish lookups): `restaurantDetailProvider(id)`
  → AsyncValue<Restaurant>, `dishDetailProvider(id)` → AsyncValue<Dish>.
  (`import '../../restaurant/application/restaurant_detail_providers.dart';`)
- Notifications: `notificationsControllerProvider` → AsyncValue<List<AppNotification>>.
  Notifier: `.markRead(n)`, `.markAllRead()`. `unreadNotificationCountProvider` → int.
  (`import '../../notifications/application/notifications_providers.dart';`)
- Search: `searchRestaurantsProvider(query)` → AsyncValue<List<Restaurant>>,
  `searchDishesResultsProvider(query)` → AsyncValue<List<Dish>>, `recentSearchesProvider`
  → List<String> Notifier `.add(term)`, `.clear()`.
  (`import '../../search/application/search_providers.dart';`)
- Core: `preferencesProvider` → Preferences (`.setBool(key,v)`, `.getBool(key)`,
  key consts `Preferences.kOnboardingDone`). (`import '../../../core/providers/core_providers.dart';`)

## Conventions
- Each screen is a `ConsumerWidget`/`ConsumerStatefulWidget`. Wrap async data in `AsyncView`.
- Always provide loading (shimmer or skeleton), empty and error states.
- Respect safe areas; on wide layouts wrap scroll content in `CenteredConstrained`.
- Use M3 components only. No hardcoded colors/spacing — use the tokens above.
- File location: `lib/features/<feature>/presentation/<name>_screen.dart` (+ widgets/).
- When done, run `flutter analyze lib/features/<feature>` and fix all warnings/errors.
- Tracking opens via `context.push(Routes.trackingPath(orderId))`. Dish customization
  sheet (already built) opens via `DishCustomizationSheet.show(context, dish:, restaurant:)`
  from `lib/features/restaurant/widgets/dish_customization_sheet.dart`.
