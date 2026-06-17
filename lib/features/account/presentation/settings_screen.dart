import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/layout/responsive.dart';
import '../application/settings_controller.dart';

/// App settings: theme mode and language selection.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final controller = ref.read(settingsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: CenteredConstrained(
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.lg,
            ),
            children: [
              _SectionHeader(title: 'Appearance'),
              const SizedBox(height: AppSpacing.sm),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: SizedBox(
                    width: double.infinity,
                    child: SegmentedButton<ThemeMode>(
                      segments: const [
                        ButtonSegment(
                          value: ThemeMode.system,
                          label: Text('System'),
                          icon: Icon(Icons.brightness_auto_outlined),
                        ),
                        ButtonSegment(
                          value: ThemeMode.light,
                          label: Text('Light'),
                          icon: Icon(Icons.light_mode_outlined),
                        ),
                        ButtonSegment(
                          value: ThemeMode.dark,
                          label: Text('Dark'),
                          icon: Icon(Icons.dark_mode_outlined),
                        ),
                      ],
                      selected: {settings.themeMode},
                      onSelectionChanged: (selection) =>
                          controller.setThemeMode(selection.first),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _SectionHeader(title: 'Language'),
              const SizedBox(height: AppSpacing.sm),
              Card(
                child: Column(
                  children: [
                    _LanguageTile(
                      title: 'System default',
                      selected: settings.locale == null,
                      onTap: () => controller.setLocale(null),
                    ),
                    const Divider(height: 1),
                    for (final locale in supportedLocales) ...[
                      _LanguageTile(
                        title: _languageName(locale.languageCode),
                        selected:
                            settings.locale?.languageCode == locale.languageCode,
                        onTap: () => controller.setLocale(locale),
                      ),
                      if (locale != supportedLocales.last)
                        const Divider(height: 1),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _languageName(String code) {
    switch (code) {
      case 'es':
        return 'Español';
      case 'en':
      default:
        return 'English';
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleSmall?.copyWith(
        color: context.scheme.primary,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: selected
          ? Icon(Icons.check, color: context.scheme.primary)
          : null,
      onTap: onTap,
    );
  }
}
