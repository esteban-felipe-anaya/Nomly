import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/dish.dart';
import '../../../data/models/restaurant.dart';
import '../../../shared/layout/responsive.dart';
import '../../../shared/widgets/dish_tile.dart';
import '../../../shared/widgets/restaurant_card.dart';
import '../../../shared/widgets/section_header.dart';
import '../../../shared/widgets/shimmer_box.dart';
import '../../../shared/widgets/state_views.dart';
import '../application/search_providers.dart';

/// Search tab: an M3 search field that drives live restaurant + dish results,
/// with recent searches and cuisine suggestions when the query is empty.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _query = '';

  static const _cuisineSuggestions = ['Pizza', 'Sushi', 'Tacos', 'Burgers'];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _setQuery(String value) {
    setState(() => _query = value);
  }

  void _fillQuery(String value) {
    _controller
      ..text = value
      ..selection = TextSelection.collapsed(offset: value.length);
    _setQuery(value);
    _focusNode.requestFocus();
  }

  void _submit(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    ref.read(recentSearchesProvider.notifier).add(trimmed);
  }

  @override
  Widget build(BuildContext context) {
    final hasQuery = _query.trim().isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: AppSpacing.lg,
        title: SearchBar(
          controller: _controller,
          focusNode: _focusNode,
          hintText: 'Search restaurants & dishes',
          leading: const Icon(Icons.search_rounded),
          trailing: [
            if (hasQuery)
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  _controller.clear();
                  _setQuery('');
                },
              ),
          ],
          onChanged: _setQuery,
          onSubmitted: _submit,
        ),
      ),
      body: SafeArea(
        top: false,
        child: hasQuery
            ? _ResultsView(query: _query.trim(), onSubmitQuery: _submit)
            : _IdleView(onPick: _fillQuery),
      ),
    );
  }
}

/// Shown when the query is empty: recent searches + cuisine suggestion chips.
class _IdleView extends ConsumerWidget {
  const _IdleView({required this.onPick});

  final ValueChanged<String> onPick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recents = ref.watch(recentSearchesProvider);
    return CenteredConstrained(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        children: [
          if (recents.isNotEmpty) ...[
            SectionHeader(
              title: 'Recent searches',
              actionLabel: 'Clear all',
              onAction: () => ref.read(recentSearchesProvider.notifier).clear(),
            ),
            Padding(
              padding: AppSpacing.page,
              child: Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final term in recents)
                    ActionChip(
                      avatar: const Icon(Icons.history_rounded, size: 18),
                      label: Text(term),
                      onPressed: () => onPick(term),
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
          const SectionHeader(title: 'Try a cuisine'),
          Padding(
            padding: AppSpacing.page,
            child: Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final cuisine in _SearchScreenState._cuisineSuggestions)
                  ActionChip(
                    label: Text(cuisine),
                    onPressed: () => onPick(cuisine),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Shown when there is a query: restaurant + dish result sections.
class _ResultsView extends ConsumerWidget {
  const _ResultsView({required this.query, required this.onSubmitQuery});

  final String query;
  final ValueChanged<String> onSubmitQuery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurants = ref.watch(searchRestaurantsProvider(query));
    final dishes = ref.watch(searchDishesResultsProvider(query));

    final bothEmpty =
        restaurants.value?.isEmpty == true && dishes.value?.isEmpty == true;
    if (bothEmpty) {
      return EmptyView(
        icon: Icons.search_off_rounded,
        title: 'No results for "$query"',
        message: 'Try a different name, cuisine or dish.',
      );
    }

    return CenteredConstrained(
      child: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        children: [
          const SectionHeader(title: 'Restaurants'),
          _RestaurantResults(query: query),
          const SizedBox(height: AppSpacing.lg),
          const SectionHeader(title: 'Dishes'),
          _DishResults(query: query),
        ],
      ),
    );
  }
}

class _RestaurantResults extends ConsumerWidget {
  const _RestaurantResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(searchRestaurantsProvider(query));
    return AsyncView<List<Restaurant>>(
      value: value,
      onRetry: () => ref.invalidate(searchRestaurantsProvider(query)),
      loading: () => const _RestaurantResultsSkeleton(),
      data: (restaurants) {
        if (restaurants.isEmpty) {
          return const _InlineEmpty(message: 'No matching restaurants.');
        }
        return ResponsiveBuilder(
          builder: (context, layout) {
            final columns =
                gridColumnsForWidth(MediaQuery.sizeOf(context).width);
            if (columns <= 1) {
              return Column(
                children: [
                  for (final r in restaurants)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(AppSpacing.lg,
                          AppSpacing.xs, AppSpacing.lg, AppSpacing.sm),
                      child: RestaurantCard(
                        restaurant: r,
                        onTap: () =>
                            context.push(Routes.restaurantPath(r.id)),
                      ),
                    ),
                ],
              );
            }
            return Padding(
              padding: AppSpacing.page,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: AppSpacing.md,
                  crossAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, i) {
                  final r = restaurants[i];
                  return RestaurantCard(
                    restaurant: r,
                    onTap: () => context.push(Routes.restaurantPath(r.id)),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _DishResults extends ConsumerWidget {
  const _DishResults({required this.query});

  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(searchDishesResultsProvider(query));
    return AsyncView<List<Dish>>(
      value: value,
      onRetry: () => ref.invalidate(searchDishesResultsProvider(query)),
      loading: () => const _DishResultsSkeleton(),
      data: (dishes) {
        if (dishes.isEmpty) {
          return const _InlineEmpty(message: 'No matching dishes.');
        }
        return Column(
          children: [
            for (final dish in dishes)
              DishTile(
                dish: dish,
                onTap: () =>
                    context.push(Routes.restaurantPath(dish.restaurantId)),
              ),
          ],
        );
      },
    );
  }
}

class _InlineEmpty extends StatelessWidget {
  const _InlineEmpty({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      child: Text(
        message,
        style: context.textTheme.bodyMedium
            ?.copyWith(color: context.scheme.onSurfaceVariant),
      ),
    );
  }
}

class _RestaurantResultsSkeleton extends StatelessWidget {
  const _RestaurantResultsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 2; i++)
          const Padding(
            padding: EdgeInsets.fromLTRB(
                AppSpacing.lg, AppSpacing.xs, AppSpacing.lg, AppSpacing.sm),
            child: RestaurantCardSkeleton(),
          ),
      ],
    );
  }
}

class _DishResultsSkeleton extends StatelessWidget {
  const _DishResultsSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < 3; i++)
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.lg, vertical: AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(width: 140, height: 16),
                      SizedBox(height: AppSpacing.sm),
                      ShimmerBox(width: 200, height: 12),
                      SizedBox(height: AppSpacing.sm),
                      ShimmerBox(width: 60, height: 14),
                    ],
                  ),
                ),
                SizedBox(width: AppSpacing.md),
                ShimmerBox(width: 104, height: 104, radius: AppRadius.md),
              ],
            ),
          ),
      ],
    );
  }
}
