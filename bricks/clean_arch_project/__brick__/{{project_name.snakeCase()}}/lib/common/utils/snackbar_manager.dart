import 'package:flutter/material.dart';

import '../common.dart';

class SnackbarManager {
  static void showSuccessSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.green,
      iconData: Icons.check_circle,
      duration: duration,
    );
  }

  static void showWarningSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.orange,
      iconData: Icons.warning,
      duration: duration,
    );
  }

  static void showErrorSnackbar({
    required String message,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: Colors.red,
      iconData: Icons.error,
      duration: duration,
    );
  }

  static void showCustomSnackbar({
    required String message,
    required Color backgroundColor,
    required IconData iconData,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    _showSnackbar(
      context: context,
      message: message,
      backgroundColor: backgroundColor,
      iconData: iconData,
      duration: duration,
    );
  }

  static void _showSnackbar({
    required String message,
    required Color backgroundColor,
    required IconData iconData,
    Duration duration = const Duration(seconds: 2),
    BuildContext? context,
  }) {
    final snackbar = SnackBar(
      content: Row(
        children: <Widget>[
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      duration: duration,
    );

    ScaffoldMessenger.of(context ?? globalContext).showSnackBar(snackbar);
  }

  static void closeSnackbar({BuildContext? context}) {
    ScaffoldMessenger.of(context ?? globalContext).clearSnackBars();
  }
}
