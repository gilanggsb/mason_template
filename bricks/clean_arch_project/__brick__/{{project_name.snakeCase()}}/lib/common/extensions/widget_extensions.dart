import 'package:flutter/material.dart';
import 'dart:ui' as ui show ViewPadding;

extension WidgetExtension on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget onDoubleTap(Function() function) => GestureDetector(
        onDoubleTap: function,
        child: this,
      );

  Widget onTap(Function() function) => GestureDetector(
        onTap: function,
        child: this,
      );

  Widget onLongPress(Function() function) => GestureDetector(
        onLongPress: function,
        child: this,
      );
  Padding paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );

  Padding paddingLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );

  Padding paddingFromWindowPadding(
    ui.ViewPadding padding,
    double devicePixelRatio, {
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.fromViewPadding(padding, devicePixelRatio),
        child: this,
      );

  Padding paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    Key? key,
  }) =>
      Padding(
        key: key,
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        child: this,
      );
}
