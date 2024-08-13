import 'package:envied/envied.dart';
import '../common.dart';

part 'env_development.g.dart';

@Envied(
  path: '.env.development',
  useConstantCase: true,
  obfuscate: true,
)
abstract class EnvDevelopment {
  @EnviedField()
  static Flavor flavor = _EnvDevelopment.flavor;

  @EnviedField()
  static String baseUrl = _EnvDevelopment.baseUrl;
}
