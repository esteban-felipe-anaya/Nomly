import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../data/models/catalog.dart';
import '../../../../shared/widgets/app_network_image.dart';
import '../../../../shared/widgets/shimmer_box.dart';
import '../../application/home_providers.dart';

/// Auto-playing promo banner carousel using real imagery.
class PromoCarousel extends ConsumerWidget {
  const PromoCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final banners = ref.watch(bannersProvider);
    return banners.when(
      data: (list) {
        if (list.isEmpty) return const SizedBox.shrink();
        return CarouselSlider(
          options: CarouselOptions(
            height: 160,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 0.9,
            enlargeCenterPage: true,
          ),
          items: [for (final b in list) _BannerCard(banner: b)],
        );
      },
      loading: () => const Padding(
        padding: AppSpacing.page,
        child: ShimmerBox(height: 150, radius: AppRadius.lg),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}

class _BannerCard extends StatelessWidget {
  const _BannerCard({required this.banner});
  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: banner.restaurantId == null
          ? null
          : () => context.push(Routes.restaurantPath(banner.restaurantId!)),
      child: ClipRRect(
        borderRadius: AppRadius.card,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppNetworkImage(url: banner.image),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.black.withValues(alpha: 0.1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 220,
                    child: Text(banner.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w800)),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  SizedBox(
                    width: 220,
                    child: Text(banner.subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white70)),
                  ),
                  if (banner.restaurantId != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md, vertical: 6),
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text('Order now',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: scheme.onPrimary,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
