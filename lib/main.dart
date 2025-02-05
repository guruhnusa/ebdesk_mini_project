import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'l10n/app_localizations.dart';
import 'src/core/routers/route_provider.dart';
import 'src/core/utils/provider/language_provider.dart';
import 'src/core/utils/provider/language_repository.dart';
import 'src/core/utils/provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();

  final language = await container.read(languageRepositoryProvider).getLanguage();

  runApp(
    ProviderScope(
      overrides: [
        languageProvider.overrideWith(
          (ref) => language,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final language = ref.watch(languageProvider);

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language.code),
      title: 'EbDesk Mini Project',
      theme: themeMode,
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider: ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
