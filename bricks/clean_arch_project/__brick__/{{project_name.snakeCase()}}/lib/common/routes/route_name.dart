enum RouteName {
  home('Home', '/home'),
  splash('Splash', '/');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
