import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

// Define the enum for log levels
enum LogLevel { debug, info, warning, error, api }

class AppUtils {
  static void debugPrint(
    String? text, {
    LogLevel level = LogLevel.debug,
    StackTrace? stackTrace,
  }) {
    if (kReleaseMode) return;

    String name = "{{project_name.upperCase()}}LOG";
    String colorCode = '\x1B[0m'; // Default color

    switch (level) {
      case LogLevel.api:
        name += "_API";
        colorCode = '\x1B[34m'; // Blue for API logs
        break;
      case LogLevel.error:
        name += "_ERROR";
        colorCode = '\x1B[31m'; // Red for error logs
        break;
      case LogLevel.warning:
        name += "_WARNING";
        colorCode = '\x1B[33m'; // Yellow for warning logs
        break;
      case LogLevel.info:
        name += "_INFO";
        colorCode = '\x1B[32m'; // Green for info logs
        break;
      case LogLevel.debug:
      default:
        colorCode = '\x1B[34m'; // Blue for debug logs
        break;
    }

    String resetCode = '\x1B[0m';
    String formattedMessage = '$colorCode${text ?? ''}$resetCode';

    log(
      formattedMessage,
      name: name,
      stackTrace: stackTrace,
    );
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: DefaultText(
          message,
          color: AppColors.white,
        ),
      ),
    );
  }

  static void copyLink(
      BuildContext context, String data, String successMessage) {
    Clipboard.setData(ClipboardData(text: data)).then((_) {
      showSnackBar(context, successMessage);
    });
  }

  static String addCurrencyFormat(String input) {
    // Add 'IDR' currency symbol
    String result = 'IDR ';

    // Convert input string to integer
    int value = int.tryParse(input) ?? 0;

    // Add comma separators for thousands
    result += value.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match match) => '${match[1]},',
        );

    return result;
  }
}
