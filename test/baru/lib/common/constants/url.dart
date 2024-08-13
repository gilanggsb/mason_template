import '../common.dart';

class URL {
  static String host = Env.baseUrl;
  static String version = "v2";
  static String base = '$host/$version';
  // QURAN URL
  static String quran = '$base/quran';
  static String quranSurah = '$quran/surat';
  static String quranSurahAll = '$quranSurah/semua';
  static String quranJuz = '$quran/juz';
  static String quranJuzAll = '$quranJuz/semua';
  static String quranAyah = '$quran/ayat';
  static String quranAyahJuz = '$quran/ayat/juz';
  static String quranAyahBrowse = '$quranAyah/browse';
}
