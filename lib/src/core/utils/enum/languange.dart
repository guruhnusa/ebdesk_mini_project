enum Language {
  english(flag: '🇬🇧', code: 'en', name: 'English'),
  indonesian(flag: '🇮🇩', code: 'id', name: 'Indonesia');

  const Language({required this.flag, required this.code, required this.name});

  final String flag;
  final String code;
  final String name;
}
