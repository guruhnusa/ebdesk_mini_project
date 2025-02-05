import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../enum/languange.dart';

final languageProvider = StateProvider<Language>((ref) {
  return Language.english;
});
