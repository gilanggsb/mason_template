import 'package:envied/envied.dart';
import '../common.dart';

part 'env_production.g.dart';

@Envied(
  path: '.env.production',
  useConstantCase: true,
  obfuscate: true,
)
abstract class EnvProduction {
  @EnviedField()
  static Flavor flavor = _EnvProduction.flavor;

  @EnviedField()
  static String baseUrl = _EnvProduction.baseUrl;
}
