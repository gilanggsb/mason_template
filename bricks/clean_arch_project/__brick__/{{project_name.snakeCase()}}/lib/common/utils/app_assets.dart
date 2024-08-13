import '../common.dart';

abstract class AppAssets {
  const AppAssets();

  static get icDownload => 'ic_download'.toPng;
  static get icSpeaker => 'ic_speaker'.toPng;
  static get icQuran => 'ic_quran'.toPng;
  static get icJumpTo => 'ic_jumpto'.toPng;
  static get icRectangleQuranNumber => 'ic_rectangle_quran_number'.toPng;
  static get quranBanner => 'quran_banner'.toPng;
  static get titleHeaderOrnament => 'title_header_ornament'.toPng;
  static get headerOrnament => 'header_ornament'.toPng;
  static get musicDiscAnim => 'music_disc_anim'.toJson;
}
