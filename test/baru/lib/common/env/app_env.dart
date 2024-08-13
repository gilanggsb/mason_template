import '../common.dart';

class Env {
  static late final String baseUrl;
  static late final Flavor flavor;

  static void load() {
    if (const String.fromEnvironment('FLAVOR') == 'development') {
      baseUrl = EnvDevelopment.baseUrl;
      flavor = EnvDevelopment.flavor;
      return;
    }

    if (const String.fromEnvironment('FLAVOR') == 'staging') {
      baseUrl = EnvStaging.baseUrl;
      flavor = EnvStaging.flavor;
      return;
    }

    baseUrl = EnvProduction.baseUrl;
    flavor = EnvProduction.flavor;
  }
}
