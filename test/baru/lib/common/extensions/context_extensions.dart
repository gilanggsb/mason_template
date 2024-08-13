import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

extension ContextExt on BuildContext {
  double get getHeight => MediaQuery.of(this).size.height.sp;
  double get getWidth => MediaQuery.of(this).size.width.sp;
  ThemeData get theme => Theme.of(this);
  bool get isLightTheme => theme.brightness == Brightness.light;
  AppTextThemeExtension get textThemeExt => theme.appTextTheme;
  AppColorsExtension get colorsExt => theme.appColors;
  Color? getColorExt(AppColorType type) => colorsExt.getColor(type);
}
