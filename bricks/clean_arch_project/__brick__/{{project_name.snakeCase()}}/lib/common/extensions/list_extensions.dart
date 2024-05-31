extension ListExt on List {
  List<T> toResponseList<T>(T Function(Map<String, dynamic> json) fromJsonT) {
    List<T> value = <T>[];
    forEach((element) {
      value.add(fromJsonT(element));
    });
    return value;
  }
}
