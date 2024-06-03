// ignore_for_file: prefer_mixin

import 'package:flutter/material.dart';

/// Wrapper for stateful functionality to provide onInit calls in stateles widget
class StatefulWrapper extends StatefulWidget {
  final Function? onInit;
  final Function? didChangeDependencies;
  final Function? onDispose;
  final Function? didUpdateWidget;
  final Widget child;
  const StatefulWrapper({
    super.key,
    required this.onInit,
    required this.child,
    this.didChangeDependencies,
    this.onDispose,
    this.didUpdateWidget,
  });
  @override
  StatefulWrapperState createState() => StatefulWrapperState();
}

class StatefulWrapperState extends State<StatefulWrapper>
    with WidgetsBindingObserver {
  @override
  void initState() {
    if (widget.onInit != null) {
      widget.onInit!();
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (widget.didChangeDependencies != null) {
      widget.didChangeDependencies!();
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose!();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StatefulWrapper oldWidget) {
    if (widget.didUpdateWidget != null) {
      widget.didUpdateWidget!();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
