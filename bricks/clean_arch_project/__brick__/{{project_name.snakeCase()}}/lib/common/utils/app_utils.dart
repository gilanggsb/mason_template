import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class AppUtils {
  static TextStyle get _baseTextStyle => GoogleFonts.lato();

  static TextStyle regularTextStyle(
          {double? fontSize,
          FontStyle? fontStyle,
          Color? fontColor,
          double? letterSpacing}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        fontStyle: fontStyle,
        color: fontColor,
        letterSpacing: letterSpacing ?? 0.5,
      );

  static TextStyle mediumTextStyle(
          {double? fontSize,
          FontStyle? fontStyle,
          Color? fontColor,
          double? letterSpacing}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        fontStyle: fontStyle,
        color: fontColor,
        letterSpacing: letterSpacing ?? 0.5,
      );

  static TextStyle semiBoldTextStyle(
          {double? fontSize,
          FontStyle? fontStyle,
          Color? fontColor,
          double? letterSpacing}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        fontStyle: fontStyle,
        color: fontColor,
        letterSpacing: letterSpacing ?? 0.5,
      );

  static TextStyle boldTextStyle(
          {double? fontSize,
          FontStyle? fontStyle,
          Color? fontColor,
          double? letterSpacing}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontStyle: fontStyle,
        color: fontColor,
        letterSpacing: letterSpacing ?? 0.5,
      );

  static TextStyle thinTextStyle(
          {double? fontSize,
          FontStyle? fontStyle,
          Color? fontColor,
          double? letterSpacing}) =>
      _baseTextStyle.copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.w100,
        color: fontColor,
        letterSpacing: letterSpacing ?? 0.5,
        fontStyle: fontStyle,
      );

  static EdgeInsets get baseMarginPadding8 => const EdgeInsets.all(8);
  static EdgeInsets get baseMarginPadding12 => const EdgeInsets.all(12);
  static EdgeInsets get baseMarginPadding14 => const EdgeInsets.all(14);
  static EdgeInsets get baseMarginPadding16 => const EdgeInsets.all(16);

  static void debugPrint(
    String text, {
    bool isError = false,
    bool isApi = false,
  }) {
    String name = "JALALOG";
    if (kReleaseMode) return;

    if (isApi) {
      name += "_API";
    }

    if (isError) {
      name += "_ERROR";
    }
    log(isError ? '' : text, name: name, error: isError ? text : '');
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultText(
          message,
          color: AppColors.white,
        ),
      ),
    );
  }

  static void copyLink(
      BuildContext context, String data, String successMessage) {
    Clipboard.setData(ClipboardData(text: data)).then((_) {
      showSnackBar(context, successMessage);
    });
  }

  static String addCurrencyFormat(String input) {
    // Add 'IDR' currency symbol
    String result = 'IDR ';

    // Convert input string to integer
    int value = int.tryParse(input) ?? 0;

    // Add comma separators for thousands
    result += value.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );

    return result;
  }
}
