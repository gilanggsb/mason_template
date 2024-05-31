import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

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
        color: AppColors.white,
      ),
      leading: leading,
      centerTitle: centerTitle ?? false,
      elevation: 1,
      backgroundColor: AppColors.primary,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbarSize ?? 50.0);
}
