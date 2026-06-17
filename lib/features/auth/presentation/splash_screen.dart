import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';

/// Branding splash shown while the session is being restored. Navigation away
/// is handled by the router redirect once auth status is known.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: scheme.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.takeout_dining_rounded, size: 88, color: scheme.onPrimary),
            const SizedBox(height: AppSpacing.lg),
            Text('Nomly',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: scheme.onPrimary, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.xs),
            Text('Good food, fast.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: scheme.onPrimary.withValues(alpha: 0.9))),
            const SizedBox(height: AppSpacing.xxl),
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                  strokeWidth: 3, color: scheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
