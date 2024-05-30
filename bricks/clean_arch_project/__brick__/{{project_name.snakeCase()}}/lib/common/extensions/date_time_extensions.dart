import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  format(String format) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(this);
  }
}
