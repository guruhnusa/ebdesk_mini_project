import 'dart:developer';
import 'dart:ui' as ui;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../enum/languange.dart';
import 'language_provider.dart';
import 'shared_pref_provider.dart';

part 'language_repository.g.dart';

class LanguageRepository {
  final Ref ref;

  LanguageRepository({required this.ref});

  static const String languageCodeKey = 'language_code';

  Language _getSystemLanguage() {
    final deviceLocale = ui.PlatformDispatcher.instance.locale.languageCode;

    log('Locale: $deviceLocale');

    for (var lang in Language.values) {
      if (lang.code == deviceLocale) {
        return lang;
      }
    }
    return Language.english;
  }

  Future<void> setLanguage({required Language language}) async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    await pref.setString('language', language.code);
    ref.read(languageProvider.notifier).update(
          (state) => language,
        );
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPreferencesProvider.future);

    final savedLanguage = pref.getString('language');

    if (savedLanguage == null) {
      final systemLang = _getSystemLanguage();

      await setLanguage(language: systemLang);
      return systemLang;
    }

    for (var item in Language.values) {
      if (item.code == savedLanguage) {
        return item;
      }
    }

    return Language.english;
  }

  Future<void> resetToSystemLanguage() async {
    final systemLang = _getSystemLanguage();
    await setLanguage(language: systemLang);
  }
}

@riverpod
LanguageRepository languageRepository(Ref ref) {
  return LanguageRepository(ref: ref);
}
