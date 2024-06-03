import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class AppUtils {
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
