import 'package:mason/mason.dart';

import 'generate_barrel.dart';

Future<void> run(HookContext context) async {
  await generateBarrelFile(context);
}
