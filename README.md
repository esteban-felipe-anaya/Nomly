# Nomly 🍔

A production-quality, cross-platform **food delivery app** built with Flutter, running from a
single codebase on **iOS, Android, Web, macOS, Windows and Linux**. Nomly ships with a runnable
**mock REST API**, a proper networking + repository layer (no hardcoded data in the UI), **real
food photography** everywhere, and every flow wired end-to-end — including **live order tracking**
on an OpenStreetMap map.

Seed color: warm appetizing orange `#E0531F` (drives the Material 3 `ColorScheme`).

---

## Features

- **Material 3 / Material You** — `ColorScheme.fromSeed`, full light + dark themes, platform
  **dynamic color** (`dynamic_color`) with seed fallback. M3 components throughout:
  `NavigationBar`/`NavigationRail`, `SearchBar`, `FilledButton`, `Card`, `FilterChip`,
  `SegmentedButton`, `Badge`, M3 bottom sheets, dialogs, tonal surfaces.
- **Adaptive & responsive** — bottom `NavigationBar` (mobile), `NavigationRail` (tablet),
  extended rail (desktop/web); single-column → multi-column grids; restaurant detail shows a
  **cart side-panel** on wide screens.
- **End-to-end flow** — pick address → browse (search + cuisine filters + sort) → restaurant
  detail → customize dish (size/add-ons via bottom sheet) → cart badge updates → cart (qty,
  notes, promo, fee breakdown, tip) → **auth-gated checkout** → place order → **live tracking**
  (status timeline + courier moving on `flutter_map` + ETA) → order history → **reorder**.
- **Auth gating** — browse as a guest; checkout requires sign-in (redirect, then resume).
- **Favorites** (restaurants + dishes), **address book** CRUD, **promo codes**, persisted
  **theme/locale**, **cart** and **recent searches** — all survive relaunch.
- **Real images only** — real Unsplash food photography curated into `db.json` (every URL
  verified HTTP 200) and `randomuser.me` courier/profile portraits. Loaded with
  `cached_network_image` and a shimmer placeholder. No `picsum`/placeholder generators anywhere.

## Tech stack

| Concern | Package |
|---|---|
| State | `flutter_riverpod` + `riverpod_annotation` (codegen) |
| Routing | `go_router` (shell route, deep links, web URLs, auth redirect) |
| Networking | `dio` + `retrofit` |
| Models | `freezed` + `json_serializable` |
| Map | `flutter_map` (OpenStreetMap — works on all six platforms, no API key) |
| Images | `cached_network_image` |
| UI | `carousel_slider`, `shimmer`, `flutter_rating_bar` |
| Storage | `flutter_secure_storage` (token), `shared_preferences` (prefs/cart/favorites) |
| Format | `intl` · **Icon**: `flutter_launcher_icons` |

## Architecture

Feature-first clean architecture:

```
lib/
  core/        theme & design tokens, router, dio client + interceptors, env, storage, providers
  data/        models (freezed), api client (retrofit), repositories
  features/    auth, address, home, restaurants, restaurant, search, cart, checkout,
               tracking, orders, favorites, account, notifications
               (each: application/  presentation/  widgets/)
  shared/      reusable widgets (cards, tiles, stepper, state views) + adaptive layout
  app.dart · main.dart
mock-api/      json-server: db.json (real image URLs), server.js, routes.json, generators
```

Every screen reads from a repository via Riverpod providers; loading (shimmer), empty and error
states are handled everywhere. A Dio interceptor simulates **300–800 ms latency** and the
occasional transient error so those states are genuinely exercised.

---

## Prerequisites

- Flutter (stable) — developed on Flutter 3.44 / Dart 3.12
- Node.js 18+ (for the mock API)

## 1. Install & generate code

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # freezed / json / retrofit / riverpod
```

> Re-run the `build_runner` step whenever you change a model, provider or API method.
> On **Windows**, enable Developer Mode (`start ms-settings:developers`) so Flutter can use
> symlinks for desktop plugin builds. (Web/analyze/tests do not require it.)

## 2. Run the mock API

```bash
cd mock-api
npm install
npm run seed     # (re)generate db.json from the verified image pool (deterministic)
npm start        # serves http://localhost:3000
```

Useful scripts:

- `npm run dev` — seed then start.
- `npm run verify-images` — checks that **every** image URL in `db.json` returns HTTP 200
  (fails non-zero if any don't).

The API implements the full contract: `POST /auth/login|register`, `GET /auth/me`,
`/addresses` CRUD, `/cuisines`, `/banners`, `/restaurants` (with `cuisineId,q,minRating,
priceLevel,freeDelivery,sort,_page,_limit`), `/restaurants/:id`, `/restaurants/:id/menu`,
`/dishes/:id`, `POST /promo/validate`, `/orders` (+ `:id`, `:id/tracking`), `/favorites`,
`/notifications`. Seeded with 1 user, 3 addresses, 8 cuisines, 21 restaurants (~187 dishes), 4
banners, favorites, 5 past orders + 1 active order with courier coordinates, and 6 notifications.

Promo codes to try: `NOMLY20` (20% off), `FREESHIP` (free delivery, min $15), `TACO10` (10% off).

## 3. Point the app at the API

The base URL defaults sensibly per platform (`http://localhost:3000`, and `http://10.0.2.2:3000`
on the Android emulator). Override it for a device or a hosted API:

```bash
flutter run --dart-define=NOMLY_API_BASE_URL=http://192.168.1.50:3000
```

> Demo sign-in accepts **any** email/password and returns the seeded user.

## 4. Run on each platform

```bash
flutter run -d chrome      # Web
flutter run -d windows     # Windows  (macos / linux on those hosts)
flutter run -d <emulator>  # Android / iOS
```

Build artifacts: `flutter build web` · `flutter build apk` · `flutter build windows` · etc.

## 5. App icon

The launcher icon (rounded-square orange background, white takeout bag with a cut-out fork) is
generated for all platforms via `flutter_launcher_icons` (config in `pubspec.yaml`). The master
assets live in `assets/icon/` (`icon.png` 1024², adaptive `icon_foreground.png`, and an
`icon.svg` source). To regenerate:

```bash
python tool/generate_icon.py        # (re)draw the PNGs from the SVG mark (Pillow)
dart run flutter_launcher_icons      # emit Android/iOS/web/Windows/macOS icons
```

The SVG can also be rasterized with
`rsvg-convert -w 1024 -h 1024 assets/icon/icon.svg -o assets/icon/icon.png`.

## 6. Tests

```bash
flutter test
```

Covers the cart-total math (add-ons + promo + tip + free-delivery), the filter→query-parameter
mapping, and the restaurant repository (parsing + client-side `offersOnly` filter) against a
mocked Dio adapter.

---

## Notes & assumptions

- **Single-restaurant cart.** Like most delivery apps, the cart is scoped to one restaurant;
  adding a dish from another restaurant prompts to start a new cart. This keeps the placed order
  mapped cleanly to one restaurant and one delivery fee.
- **Live tracking** auto-advances the order status on a timer and animates the courier along the
  route for the demo (the status timeline + ETA update as it moves).
- **Payment** is mocked (card list is illustrative; no real processing), per the brief.
- Image URLs are real, openly-hotlinkable Unsplash photos and `randomuser.me` portraits. They were
  all HTTP-200-verified at authoring time; run `npm run verify-images` to re-check.
