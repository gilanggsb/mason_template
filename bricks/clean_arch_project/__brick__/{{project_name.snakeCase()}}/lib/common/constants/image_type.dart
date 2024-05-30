enum ImageType {
  asset('asset'),
  network('network'),
  file('file');

  final String name;
  const ImageType(this.name);
}
