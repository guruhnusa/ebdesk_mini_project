import 'package:intl/intl.dart';

extension StringExt on String {
  //format ke inisial nama jadi jika nama nya misal Joko anwar menjadi JA jika satu hurud maka tetap satu huruf saja
  String get initials => split(' ').map((e) => e[0]).join().toUpperCase();

  String formatToLocale(String locale) {
    // Mengonversi string ke DateTime terlebih dahulu
    DateTime dateTime = DateTime.parse(this);

    // Menggunakan format sesuai locale yang diberikan
    final dateFormat = DateFormat('EEEE, dd MMMM', locale);

    // Mengembalikan format tanggal dengan huruf kapital
    return dateFormat.format(dateTime).toUpperCase();
  }

  //2024-07-19 ubah ke 19 Aug
  String formatToShortDate(String locale) {
    // Mengonversi string ke DateTime terlebih dahulu
    DateTime dateTime = DateTime.parse(this);

    // Menggunakan format sesuai locale yang diberikan
    final dateFormat = DateFormat('dd MMM', locale);

    // Mengembalikan format tanggal dengan huruf kapital
    return dateFormat.format(dateTime);
  }
}
