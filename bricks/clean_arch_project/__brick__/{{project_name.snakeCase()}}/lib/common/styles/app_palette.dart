// ignore_for_file: unused_field

import 'package:flutter/material.dart';

abstract class AppPalette {
  static const Color transparent = Colors.transparent;
  static const primary = _Primary();
  static const grey = _GreyColors();
  static final gradient = _GradientColors();
  static const black = _BlackColors();
  static const white = _WhiteColors();
  static const green = _GreenColors();
  static const blue = _BlueColors();
  static const red = _RedColors();
  static final background = _BackgroundColors();
}

class _Primary {
  const _Primary();
  final Color base = const Color(0xFFDA8856);
  final Color light = const Color(0xFFE5A578);
  final Color light1 = const Color(0xFFF0C29A);
  final Color light2 = const Color(0xFFFBDFBC);
  final Color light3 = const Color(0xFFFDECD3);
  final Color light4 = const Color(0xFFFEF9EA);
  final Color dark = const Color(0xFFB06C45);
  final Color dark1 = const Color(0xFF8C5636);
  final Color dark2 = const Color(0xFF6D4328);
  final Color dark3 = const Color(0xFF4F301D);
  final Color dark4 = const Color(0xFF331F12);
}

class _GreyColors {
  const _GreyColors();
  final grey60 = const Color(0xAA292C29);
  final grey40 = const Color(0x66292C29);
}

class _WhiteColors {
  const _WhiteColors();
  final Color base = const Color(0xFFFFFFFF);
  final Color white50 = const Color(0xAAFFFFFF);
}

class _GradientColors {
  _GradientColors();
  final primary = LinearGradient(
    colors: [
      AppPalette.primary.light,
      AppPalette.primary.base,
    ],
  );
}

class _BlackColors {
  const _BlackColors();
  final Color black50 = const Color(0xFF454646);
  final Color black200 = const Color(0xFF454646);
}

class _GreenColors {
  const _GreenColors();
  final base = Colors.green;
  final light = const Color(0xFFA5D6A7);
  final dark = const Color(0xFF388E3C);
}

class _RedColors {
  const _RedColors();
  final base = const Color(0xFFFA0000);
  final light = const Color(0xFFFA9884);
  final dark = const Color(0xFFC62828);
}

class _BlueColors {
  const _BlueColors();
  final base = Colors.blue;
  final Color darkBlue = const Color(0xFF004492);
  final Color dustBlue = const Color(0xFF859ED1);
}

class _BackgroundColors {
  _BackgroundColors();
  final base = AppPalette.white.base;
  final dark = const Color(0xFF454646);
}
