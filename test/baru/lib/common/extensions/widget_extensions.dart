import 'dart:ui' as ui show ViewPadding;

import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget paddingAll(double padding, {bool isSliver = false}) {
    return isSliver
        ? SliverPadding(
            padding: EdgeInsets.all(padding),
            sliver: this,
          )
        : Padding(
            padding: EdgeInsets.all(padding),
            child: this,
          );
  }

  Widget onDoubleTap(Function() function) => GestureDetector(
        onDoubleTap: function,
        child: this,
      );

  Widget onTap(Function() function) => InkWell(
        onTap: function,
        child: this,
      );

  Widget onLongPress(Function() function) => GestureDetector(
        onLongPress: function,
        child: this,
      );

  Container addColor(Color color) => Container(
        color: color,
        child: this,
      );

  Align align(Alignment alignment) => Align(
        alignment: alignment,
        child: this,
      );

  Widget paddingOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets padding = EdgeInsets.only(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
    );
    return isSliver
        ? SliverPadding(
            key: key,
            padding: padding,
            sliver: this,
          )
        : Padding(
            key: key,
            padding: padding,
            child: this,
          );
  }

  Widget paddingLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets padding = EdgeInsets.fromLTRB(left, top, right, bottom);
    return isSliver
        ? SliverPadding(
            key: key,
            padding: padding,
            sliver: this,
          )
        : Padding(
            key: key,
            padding: padding,
            child: this,
          );
  }

  Widget paddingFromWindowPadding(
    ui.ViewPadding padding,
    double devicePixelRatio, {
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets edgeInsets =
        EdgeInsets.fromViewPadding(padding, devicePixelRatio);
    return isSliver
        ? SliverPadding(
            key: key,
            padding: edgeInsets,
            sliver: this,
          )
        : Padding(
            key: key,
            padding: edgeInsets,
            child: this,
          );
  }

  Widget paddingSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets padding = EdgeInsets.symmetric(
      vertical: vertical,
      horizontal: horizontal,
    );
    return isSliver
        ? SliverPadding(
            key: key,
            padding: padding,
            sliver: this,
          )
        : Padding(
            key: key,
            padding: padding,
            child: this,
          );
  }

  Widget marginAll(double margin, {bool isSliver = false}) {
    return isSliver
        ? SliverPadding(
            padding: EdgeInsets.all(margin),
            sliver: this,
          )
        : Container(
            margin: EdgeInsets.all(margin),
            child: this,
          );
  }

  Widget marginOnly({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets margin = EdgeInsets.only(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
    );
    return isSliver
        ? SliverPadding(
            key: key,
            padding: margin,
            sliver: this,
          )
        : Container(
            key: key,
            margin: margin,
            child: this,
          );
  }

  Widget marginLTRB(
    double left,
    double top,
    double right,
    double bottom, {
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets margin = EdgeInsets.fromLTRB(left, top, right, bottom);
    return isSliver
        ? SliverPadding(
            key: key,
            padding: margin,
            sliver: this,
          )
        : Container(
            key: key,
            margin: margin,
            child: this,
          );
  }

  Widget marginFromWindowPadding(
    ui.ViewPadding margin,
    double devicePixelRatio, {
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets edgeInsets =
        EdgeInsets.fromViewPadding(margin, devicePixelRatio);
    return isSliver
        ? SliverPadding(
            key: key,
            padding: edgeInsets,
            sliver: this,
          )
        : Container(
            key: key,
            margin: edgeInsets,
            child: this,
          );
  }

  Widget marginSymmetric({
    double vertical = 0.0,
    double horizontal = 0.0,
    bool isSliver = false,
    Key? key,
  }) {
    EdgeInsets margin = EdgeInsets.symmetric(
      vertical: vertical,
      horizontal: horizontal,
    );
    return isSliver
        ? SliverPadding(
            key: key,
            padding: margin,
            sliver: this,
          )
        : Container(
            key: key,
            margin: margin,
            child: this,
          );
  }

  SliverToBoxAdapter sliverToBoxAdapter() => SliverToBoxAdapter(child: this);
}
