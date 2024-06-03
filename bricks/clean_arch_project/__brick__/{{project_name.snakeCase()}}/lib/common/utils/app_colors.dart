import 'package:flutter/material.dart';

class AppColors {
  static const Color black = Color(0xFF454646);
  static const Color black200 = Color(0xFF454646);
  static const Color primary = Color(0xFF1B77DF);
  static const Color background = Color(0xFFFFFFFF);
  static const Color darkBlue = Color(0xFF004492);
  static const Color dustBlue = Color(0xFF859ED1);
  static const Color lightRed = Color(0xFFFA9884);
  static const Color cream = Color(0xFFFFE5CA);
  static const Color lightCream = Color.fromRGBO(255, 243, 226, 1);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightYellow = Color(0xFFFFF8E7);
  static const Color transparent = Colors.transparent;
  static const Color grey = Color(0xFF737373);
  static const Color grey200 = Color(0xFFE5E5E5);
  static const Color grey300 = Color(0xFFA09E9E);
  static const Color alert = Color(0xFFFA0000);
  static const Color green = Color(0xFF1ED761);
  static const Color primaryLight = Color(0xFFF9F9F9);
  static const Color blue = Color(0xFF3D73FF);
  static const Color orange = Color(0xFFF36E22);
  static const Color lightOrange = Color(0xFFFDECEC);
  static const Color secondary = Color(0xFFD0C9C0);
  static const Color accent = Color(0xFF5F7161);
  static MaterialColor generateMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
