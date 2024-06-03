extension MapExt on Map {
  Map updatePartially(Map updates) {
    updates.forEach((key, value) {
      if (this[key] is Map && value is Map) {
        this[key] = (this[key] as Map).updatePartially(value);
      } else {
        this[key] = value;
      }
    });
    return this;
  }
}
