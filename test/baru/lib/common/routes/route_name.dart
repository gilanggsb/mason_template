enum RouteName {
  home('Home', 'home'),
  root('Root', '/'),
  splash('Splash', '/splash');

  final String name;
  final String pathName;
  const RouteName(this.name, this.pathName);
}
