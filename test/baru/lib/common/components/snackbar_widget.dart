import 'package:flutter/material.dart';

import '../common.dart';

abstract class SnackBarWidget {
  // Private method for showing a snack bar
  static void _showSnackBar(
    String message,
    Color backgroundColor, {
    TextStyle? textStyle,
    Duration? duration,
    SnackBarAction? action,
    BuildContext? context,
    SnackBarBehavior? behavior,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? elevation,
  }) {
    final snackBar = SnackBar(
      content: DefaultText(
        message,
        style: textStyle,
        color: textStyle?.color,
      ),
      backgroundColor: backgroundColor,
      behavior: behavior ?? SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 4),
      action: action,
      shape: shape,
      margin: margin,
      padding: padding,
      elevation: elevation,
    );
    ScaffoldMessenger.of(context ?? globalContext).showSnackBar(snackBar);
  }

  // Public method for showing a success snack bar
  static void showSuccess(
    String message, {
    BuildContext? context,
  }) {
    _showSnackBar(
      context: context,
      message,
      AppPalette.green.base,
      textStyle: AppStyle.text().copyWith(color: AppPalette.white.base),
    );
  }

  // Public method for showing a failed snack bar
  static void showFailed(String message, {BuildContext? context}) {
    _showSnackBar(
      context: context,
      message,
      Colors.red,
      textStyle: AppStyle.text().copyWith(color: AppPalette.white.base),
    );
  }

  // Public method for showing a neutral snack bar
  static void showNeutral(
    String message, {
    BuildContext? context,
  }) {
    _showSnackBar(
      context: context,
      message,
      AppPalette.grey.grey60,
      textStyle: AppStyle.text().copyWith(color: AppPalette.white.base),
    );
  }

  // Public method for showing a custom snack bar
  static void showCustom(
    String message,
    Color backgroundColor, {
    BuildContext? context,
    Duration? duration,
    SnackBarAction? action,
    SnackBarBehavior? behavior,
    ShapeBorder? shape,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? elevation,
  }) {
    _showSnackBar(
      context: context,
      message,
      backgroundColor,
      duration: duration,
      action: action,
      behavior: behavior,
      shape: shape,
      margin: margin,
      padding: padding,
      elevation: elevation,
    );
  }
}
