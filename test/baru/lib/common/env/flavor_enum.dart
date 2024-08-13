enum Flavor {
  development('DEVELOPMENT'),
  staging('STAGING'),
  production('PRODUCTION');

  const Flavor(this.name);
  final String name;
}
