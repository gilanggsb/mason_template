import 'package:flutter/material.dart';

import '../common.dart';

class DefaultScaffold extends StatelessWidget {
  final Widget body;
  final Color? bgBodyColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavBar;
  final Widget? drawer;
  final void Function(bool)? onPopInvoked;
  final FloatingActionButton? floatingActionButton;
  final EdgeInsets? bodyPadding;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool canPop;
  final Function()? onInit;
  final Function()? onDispose;
  final Function()? didUpdateWidget;
  final Function()? didChangeDependencies;

  const DefaultScaffold({
    super.key,
    required this.body,
    this.bgBodyColor,
    this.appBar,
    this.bottomNavBar,
    this.onPopInvoked,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bodyPadding,
    this.onInit,
    this.onDispose,
    this.didUpdateWidget,
    this.didChangeDependencies,
    this.canPop = true,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      // onPopInvoked: onPopInvoked,
      child: StatefulWrapper(
        onInit: onInit,
        didChangeDependencies: didChangeDependencies,
        didUpdateWidget: didUpdateWidget,
        onDispose: onDispose,
        child: Scaffold(
          appBar: appBar,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          backgroundColor:
              bgBodyColor ?? context.getColorExt(AppColorType.background),
          body: Container(
            // padding: bodyPadding ?? const EdgeInsets.all(16),
            child: body,
          ),
          bottomNavigationBar: bottomNavBar,
        ),
      ),
    );
  }
}
