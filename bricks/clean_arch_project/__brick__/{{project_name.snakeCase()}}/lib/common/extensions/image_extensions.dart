extension ImageExtension on String {
  String imageAssetPath(filename) => "assets/images/$filename";
  String get toSvg => "${imageAssetPath(this)}.svg";
  String get toPng => "${imageAssetPath(this)}.png";
  String get toJpg => "${imageAssetPath(this)}.jpg";
}
