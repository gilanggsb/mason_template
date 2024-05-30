import 'package:flutter/material.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    super.key,
    required this.body,
    this.backgroundColor,
    this.marginBody,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super();

  final Widget body;
  final Color? backgroundColor;

  final DefaultAppBar? appBar;
  final EdgeInsets? marginBody;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        backgroundColor: AppColors.background,
        body: Container(
          margin: marginBody ?? AppUtils.baseMarginPadding8,
          child: body,
        ),
      ),
    );
  }
}
