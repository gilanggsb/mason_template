import 'package:flutter/material.dart';

import '../common.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle,
    this.bottom,
    this.appbarSize,
    this.leading,
  });

  final String? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final PreferredSizeWidget? bottom;
  final double? appbarSize;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: DefaultText(
        title ?? '',
        style: context.textThemeExt.headlineMedium,
        color: context.getColorExt(AppColorType.text),
      ),
      leading: leading,
      centerTitle: centerTitle ?? false,
      backgroundColor: context.getColorExt(AppColorType.background),
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarSize ?? 50.0);
}
