import 'package:envied/envied.dart';
import '../common.dart';

part 'env_staging.g.dart';

@Envied(
  path: '.env.staging',
  useConstantCase: true,
  obfuscate: true,
)
abstract class EnvStaging {
  @EnviedField()
  static Flavor flavor = _EnvStaging.flavor;

  @EnviedField()
  static String baseUrl = _EnvStaging.baseUrl;
}
