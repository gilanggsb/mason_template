import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

extension NumExt on num {
  /// Does it contain [other]
  bool contains(Pattern other, [int startIndex = 0]) =>
      toString().contains(other);

  T max<T extends num>(T value) => math.max(this as T, value);

  T min<T extends num>(T value) => math.min(this as T, value);

  ///
  /// Use this extension method to get fixed values after decimal with defined length.
  ///
  String toDoubleStringAsFixed({int digit = 2}) =>
      toStringAsFixed(truncateToDouble() == this ? 0 : digit);

  ///
  /// Use this extension method to get precised values after decimal with defined length.
  ///
  String toDoubleStringAsPrecised({int length = 4}) {
    return ((this * math.pow(10, length)).truncateToDouble() /
            math.pow(10, length))
        .toString();
  }

  /// num long
  int get length => toString().length;

  ///
  /// Check if the number is null
  ///
  // ignore: unnecessary_null_comparison
  bool? get isNull => this == null;

  /// Returns if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns if the number is positive
  bool get isPositive => this > 0;

  /// Returns if the number is negative
  bool get isNegative => this < 0;

  /// Format numeric currency
  String get numCurrency =>
      intl.NumberFormat.currency(customPattern: "#,##0.00").format(this);

  /// Format numeric currency with provided locale
  String numCurrencyWithLocale({String locale = "en_US"}) =>
      intl.NumberFormat.currency(
        locale: locale,
      ).format(this);

  ///Widgets
  ///
  ///Converts the number into a [SizedBox] with the width as that number.
  ///
  Widget get widthBox => SizedBox(
        width: toDouble(),
      );

  ///
  ///Converts the number into a [SizedBox] with the height as that number.
  ///
  Widget get heightBox => SizedBox(
        height: toDouble(),
      );

  ///
  ///Converts the number into a [SizedBox] with the width & height as that number.
  ///
  Widget get squareBox => SizedBox(
        height: toDouble(),
        width: toDouble(),
      );
}
