import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/providers/core_providers.dart';
import 'core/storage/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the API base URL (and any other config) from the bundled .env.
  // Optional: the app still runs on defaults / --dart-define if it's absent.
  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // no .env bundled — fall back to --dart-define / platform defaults
  }

  // SharedPreferences is created once and injected so synchronous reads (theme,
  // cart, favorites, selected address) are available everywhere.
  final preferences = await Preferences.create();

  runApp(
    ProviderScope(
      overrides: [
        preferencesProvider.overrideWithValue(preferences),
      ],
      child: const NomlyApp(),
    ),
  );
}
