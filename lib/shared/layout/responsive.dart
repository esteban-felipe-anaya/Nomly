import 'package:flutter/widgets.dart';

import '../../core/theme/app_spacing.dart';

enum LayoutType { compact, medium, expanded }

LayoutType layoutTypeForWidth(double width) {
  if (AppBreakpoints.isCompact(width)) return LayoutType.compact;
  if (AppBreakpoints.isMedium(width)) return LayoutType.medium;
  return LayoutType.expanded;
}

extension LayoutTypeX on BuildContext {
  LayoutType get layout => layoutTypeForWidth(MediaQuery.sizeOf(this).width);
  bool get isCompact => layout == LayoutType.compact;
  bool get isExpanded => layout == LayoutType.expanded;
}

/// A simple responsive builder that exposes the current [LayoutType].
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({super.key, required this.builder});
  final Widget Function(BuildContext context, LayoutType layout) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) =>
          builder(context, layoutTypeForWidth(constraints.maxWidth)),
    );
  }
}

/// Number of restaurant-grid columns for a given width.
int gridColumnsForWidth(double width) {
  if (width < AppBreakpoints.compact) return 1;
  if (width < AppBreakpoints.medium) return 2;
  if (width < 1200) return 3;
  return 4;
}

/// Centers and width-limits page content on very wide screens for readability.
class CenteredConstrained extends StatelessWidget {
  const CenteredConstrained({super.key, required this.child, this.maxWidth = 1100});
  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
