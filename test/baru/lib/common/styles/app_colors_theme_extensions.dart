import 'package:flutter/material.dart';

import '../common.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Map<AppColorType, Color> colors;

  AppColorsExtension({required this.colors});

  Color? getColor(AppColorType key) => colors[key];

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Map<AppColorType, Color>? colors,
  }) {
    return AppColorsExtension(colors: {...this.colors, ...?colors});
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    final lerpedColors = <AppColorType, Color>{};
    for (var key in colors.keys) {
      lerpedColors[key] = Color.lerp(colors[key], other.colors[key], t)!;
    }

    return AppColorsExtension(colors: lerpedColors);
  }
}
