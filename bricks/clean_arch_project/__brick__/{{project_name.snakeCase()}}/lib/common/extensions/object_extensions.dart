extension ObjectExt on Object {
  // ignore: unnecessary_null_comparison
  bool get isNull => this == null;
}

extension ObjectExtNull on Object? {
  // ignore: unnecessary_null_comparison
  bool get isNull => this == null;
}
