import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constant/app_theme.dart';
import 'shared_pref_provider.dart';

enum ThemePreference { system, light, dark }

final themePreferenceProvider = StateProvider<ThemePreference>((ref) {
  final pref = ref.watch(sharedPreferencesProvider);
  final savedTheme = pref.value?.getString('themeMode');

  switch (savedTheme) {
    case 'light':
      return ThemePreference.light;
    case 'dark':
      return ThemePreference.dark;
    default:
      return ThemePreference.system;
  }
});

final themeModeProvider = Provider<ThemeData>((ref) {
  final themePreference = ref.watch(themePreferenceProvider);
  final platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final pref = ref.read(sharedPreferencesProvider);

  pref.value?.setString('themeMode', themePreference.name);

  final themeData = switch (themePreference) {
    ThemePreference.light => AppTheme.lightTheme,
    ThemePreference.dark => AppTheme.darkTheme,
    ThemePreference.system => platformBrightness == Brightness.dark ? AppTheme.darkTheme : AppTheme.lightTheme,
  };

  _updateSystemUI(themePreference);

  return themeData;
});

void _updateSystemUI(ThemePreference themePreference) {
  final isDarkMode = themePreference == ThemePreference.dark ||
      (themePreference == ThemePreference.system &&
          WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: isDarkMode ? Colors.black : Colors.white, // Warna status bar
    statusBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: isDarkMode ? Colors.black : Colors.white,
    systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
  ));
}

final isDarkModeProvider = Provider<bool>((ref) {
  final themePreference = ref.watch(themePreferenceProvider);
  final platformBrightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;

  switch (themePreference) {
    case ThemePreference.light:
      return false;
    case ThemePreference.dark:
      return true;
    case ThemePreference.system:
      return platformBrightness == Brightness.dark;
  }
});
