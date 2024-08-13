import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common.dart';

class AppStyle {
  static final TextStyle _baseTextStyle = GoogleFonts.notoSans();
  static final ThemeData lightTheme = _createTheme(Brightness.light);
  static final ThemeData darkTheme = _createTheme(Brightness.dark);

  static ThemeData _createTheme(Brightness brightness) {
    bool isLight = brightness == Brightness.light;
    return ThemeData(
      brightness: brightness,
      fontFamily: _baseTextStyle.fontFamily,
      scaffoldBackgroundColor:
          isLight ? AppPalette.background.base : AppPalette.background.dark,
      useMaterial3: true,
      primarySwatch: AppPalette.primary.base.toMaterialColor(),
      extensions: [
        _createAppColors(isLight),
        _createTextTheme(isLight),
      ],
    );
  }

  static AppColorsExtension _createAppColors(bool isLight) {
    return AppColorsExtension(
      colors: {
        AppColorType.primary: AppPalette.primary.base,
        AppColorType.primaryDark: AppPalette.primary.dark,
        AppColorType.primaryLight: AppPalette.primary.light,
        AppColorType.background:
            isLight ? AppPalette.background.base : AppPalette.background.dark,
        AppColorType.text:
            isLight ? AppPalette.primary.base : AppPalette.white.base,
        AppColorType.textLight: AppPalette.white.white50,
        AppColorType.textDark: AppPalette.grey.grey60,
        AppColorType.transparent: AppPalette.transparent,
        AppColorType.grey60: AppPalette.grey.grey60,
        AppColorType.grey40: AppPalette.grey.grey40,
        AppColorType.black50: AppPalette.black.black50,
        AppColorType.black200: AppPalette.black.black200,
        AppColorType.whiteBase: AppPalette.white.base,
        AppColorType.white50: AppPalette.white.white50,
        AppColorType.greenBase: AppPalette.green.base,
        AppColorType.greenLight: AppPalette.green.light,
        AppColorType.greenDark: AppPalette.green.dark,
        AppColorType.redBase: AppPalette.red.base,
        AppColorType.redLight: AppPalette.red.light,
        AppColorType.redDark: AppPalette.red.dark,
        AppColorType.blueBase: AppPalette.blue.base,
        AppColorType.darkBlue: AppPalette.blue.darkBlue,
        AppColorType.dustBlue: AppPalette.blue.dustBlue,
      },
    );
  }

  static AppTextThemeExtension _createTextTheme(bool isLight) {
    Color textColor = isLight ? AppPalette.primary.base : AppPalette.white.base;
    TextStyle baseTextStyle = _baseTextStyle.copyWith(color: textColor);

    return AppTextThemeExtension(
      displayLarge: baseTextStyle.copyWith(
        fontSize: 57.0,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: baseTextStyle.copyWith(
        fontSize: 45.0,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: baseTextStyle.copyWith(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: baseTextStyle.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: baseTextStyle.copyWith(
        fontSize: 28.0,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: baseTextStyle.copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      ),
      titleLarge: baseTextStyle.copyWith(
        fontSize: 22.0,
        fontWeight: FontWeight.normal,
      ),
      titleMedium: baseTextStyle.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: baseTextStyle.copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: baseTextStyle.copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: baseTextStyle.copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: baseTextStyle.copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
      ),
      labelSmall: baseTextStyle.copyWith(
        fontSize: 11.0,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TextStyle text({
    TextStyleType? type,
    double? fontSize,
    FontStyle? fontStyle,
    Color? fontColor,
    double? letterSpacing,
    Paint? foreground,
  }) {
    FontWeight fontWeight = FontWeight.w400;
    switch (type) {
      case TextStyleType.medium:
        fontWeight = FontWeight.w500;
        break;
      case TextStyleType.semiBold:
        fontWeight = FontWeight.w600;
        break;
      case TextStyleType.bold:
        fontWeight = FontWeight.w700;
        break;
      case TextStyleType.thin:
        fontWeight = FontWeight.w100;
        break;
      case TextStyleType.regular:
      default:
        fontWeight = FontWeight.w400;
        break;
    }

    return _baseTextStyle.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: fontColor,
      letterSpacing: letterSpacing ?? 0.5,
      foreground: foreground,
    );
  }

  static EdgeInsets get baseMarginPadding8 => const EdgeInsets.all(8);
  static EdgeInsets get baseMarginPadding12 => const EdgeInsets.all(12);
  static EdgeInsets get baseMarginPadding14 => const EdgeInsets.all(14);
  static EdgeInsets get baseMarginPadding16 => const EdgeInsets.all(16);
}
