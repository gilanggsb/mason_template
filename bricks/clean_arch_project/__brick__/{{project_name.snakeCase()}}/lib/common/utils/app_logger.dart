import 'dart:developer';
import 'package:flutter/foundation.dart';

// Define the enum for log levels
enum LogLevel { debug, info, warning, error, api, custom }

class Logger {
  static void debugPrint(
    String? text, {
    LogLevel level = LogLevel.debug,
    String customColor = '\x1B[0m',
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
        colorCode = '\x1B[34m'; // Blue for debug logs
        break;
      case LogLevel.custom:
        colorCode = customColor; // Use custom color
        break;
      default:
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

  static void logInfo(String message, {StackTrace? stackTrace}) {
    debugPrint(message, level: LogLevel.info, stackTrace: stackTrace);
  }

  static void logWarning(String message, {StackTrace? stackTrace}) {
    debugPrint(message, level: LogLevel.warning, stackTrace: stackTrace);
  }

  static void logError(String message, {StackTrace? stackTrace}) {
    debugPrint(message, level: LogLevel.error, stackTrace: stackTrace);
  }

  static void logDebug(String message, {StackTrace? stackTrace}) {
    debugPrint(message, stackTrace: stackTrace);
  }

  static void logApi(String message, {StackTrace? stackTrace}) {
    debugPrint(message, level: LogLevel.api, stackTrace: stackTrace);
  }

  static void logCustom(String message, String colorCode,
      {StackTrace? stackTrace}) {
    debugPrint(message,
        level: LogLevel.custom, customColor: colorCode, stackTrace: stackTrace);
  }
}
