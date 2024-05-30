import 'dart:convert';

import 'package:intl/intl.dart' as intl;

extension StringExtension on String {
  int get parseInt => int.parse(this);

  int? get tryParseInt => int.tryParse(this);

  double get parseDouble => double.parse(this);

  double? get tryParseDouble => double.tryParse(this);

  bool get parseBool => this == 'true' ? true : false;

  bool get isValidEmail => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      ).hasMatch(this);

  bool get isValidPassword => length >= 6;

  String get capitalFirstChar {
    if (length == 0) return this;
    return split(" ")
        .map((str) => str[0].toUpperCase() + str.substring(1))
        .join(" ");
  }

  bool get isValidName => contains(RegExp(r'[0-9]'));

  /// Returns [this] with characters in reverse order.
  ///
  /// Example:
  /// ```dart
  /// 'word'.reverse(); // 'drow'
  /// ```
  ///
  /// WARNING: This is the naive-est possible implementation, relying on native
  /// string indexing. Therefore, this method is almost guaranteed to exhibit
  /// unexpected behavior for non-ASCII characters.
  String reverse() {
    final stringBuffer = StringBuffer();
    for (var i = length - 1; i >= 0; i--) {
      stringBuffer.write(this[i]);
    }
    return stringBuffer.toString();
  }

  /// Format numeric currency
  String get numCurrency =>
      intl.NumberFormat.currency(customPattern: "#,##0.00")
          .format(double.tryParse(this))
          .toString();

  /// Check whether a string is a number or not
  /// ```dart
  /// '123'.isNumber(); // true
  /// '123.456'.isNumber(); // true
  /// 'abc'.isNumber(); // false
  /// '123abc'.isNumber(); // false
  /// ```
  bool isNumber() {
    final isMatch = RegExp("[0-9]").hasMatch(this);
    return isMatch;
  }

  static final _camelCaseMatcher = RegExp('[A-Z][a-z]*');

  /// From 'foo_bar' to 'fooBar'
  String get lowerCamelCase {
    final out = StringBuffer();
    final parts = split('_');
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (part.isNotEmpty) {
        out.write(i == 0 ? part.toLowerCase() : part.capitalized);
      }
    }
    return out.toString();
  }

  /// from 'foo_bar' to 'FooBar'
  String get upperCamelCase {
    final out = StringBuffer();
    final parts = split('_');
    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];
      if (part.isNotEmpty) {
        out.write(part.capitalized);
      }
    }
    return out.toString();
  }

  /// from 'foo' to 'Foo'
  String get capitalized => this[0].toUpperCase() + substring(1);

  /// from fooBar to foo_bar
  String get snakeCase => replaceAllMapped(
        _camelCaseMatcher,
        (match) => '${match.start == 0 ? '' : '_'}${match[0]!.toLowerCase()}',
      );

  /// Base64 encryption
  String get toEncodedBase64 => base64Encode(utf8.encode(this));

  /// Base64 decryption
  String get toDecodedBase64 => String.fromCharCodes(base64Decode(this));

  /// Returns the average read time duration of the given `String` in seconds.
  ///
  /// The default calculation is based on 200 words per minute.
  ///
  /// You can pass the [wordsPerMinute] parameter for different read speeds.
  /// ### Example
  /// ```dart
  /// String foo =  'Hello dear friend how you doing ?';
  /// int readTime = foo.readTime(); // returns 3 seconds.
  /// ```
  int readTime({int wordsPerMinute = 200}) {
    var words = trim().split(RegExp(r'(\s+)'));
    var magicalNumber = words.length / wordsPerMinute;
    return (magicalNumber * 100).toInt();
  }

  /// Removes only the numbers from the `String`.
  /// ### Example 1
  /// ```dart
  /// String foo = 'es4e5523nt1is';
  /// String noNumbers = foo.removeNumbers; // returns 'esentis'
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = '1244e*s*4e*5523n*t*1i*s';
  /// String noNumbers = foo.removeNumbers; // returns 'e*s*e*n*t*i*s'
  /// ```
  String get removeNumbers {
    var regex = RegExp(r'(\d+)');
    return replaceAll(regex, '');
  }

  /// Returns all special characters from the `String`.
  /// ### Example
  /// ```dart
  /// String foo = '/!@#\$%^\-&*()+",.?":{}|<>~_-`*%^/ese?:"///ntis/!@#\$%^&*(),.?":{}|<>~_-`';
  /// String removed = foo.removeSpecial; // returns 'esentis'
  /// ```
  String get removeSpecial {
    // ignore: unnecessary_raw_strings
    var regex = RegExp(r'[/!@#$%^\-&*()+",.?":{}|<>~_-`]');
    return replaceAll(regex, '');
  }

  String get uriDecoded {
    return Uri.decodeFull(this);
  }

  /// Converts with [Uri.encodeFull].
  String get uriEncoded {
    return Uri.encodeFull(this);
  }

  /// Converts with [decodeComponent].
  String get uriComponentDecoded {
    return Uri.decodeComponent(this);
  }

  /// Converts with [Uri.encodeComponent].
  String get uriComponentEncoded {
    return Uri.encodeComponent(this);
  }

  ///return true if `String` contains html tags
  /// ### Example 1
  /// ```dart
  /// String foo = '<p>foo</p>';
  /// foo.isContainHtmlTags; // returns true
  /// ### Example 2
  /// ```dart
  /// String foo = 'foo';
  /// foo.isContainHtmlTags; // returns false
  bool get isContainHtmlTags =>
      RegExp(r"<[^>]*>", multiLine: true).hasMatch(this);
}

extension StringExt on String? {
  /// Checks whether the `String` is `null`.
  /// ### Example 1
  /// ```dart
  /// String? foo;
  /// bool isNull = foo.isNull; // returns true
  /// ```
  /// ### Example 2
  /// ```dart
  /// String foo = 'fff';
  /// bool isNull = foo.isNull; // returns false
  /// ```
  bool get isNull {
    return this == null;
  }
}
