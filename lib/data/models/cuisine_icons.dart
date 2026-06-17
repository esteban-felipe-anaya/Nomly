import 'package:flutter/material.dart';

/// Maps the cuisine `icon` string from the API to a const [IconData]. A const
/// lookup (not IconData(codepoint)) keeps Flutter's icon tree-shaking working.
IconData cuisineIcon(String name) {
  switch (name) {
    case 'local_pizza':
      return Icons.local_pizza;
    case 'lunch_dining':
      return Icons.lunch_dining;
    case 'set_meal':
      return Icons.set_meal;
    case 'eco':
      return Icons.eco;
    case 'ramen_dining':
      return Icons.ramen_dining;
    case 'rice_bowl':
      return Icons.rice_bowl;
    case 'icecream':
      return Icons.icecream;
    case 'restaurant':
    default:
      return Icons.restaurant;
  }
}
