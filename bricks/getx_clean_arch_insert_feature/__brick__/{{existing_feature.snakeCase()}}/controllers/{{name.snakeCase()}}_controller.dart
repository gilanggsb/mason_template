import 'package:get/get.dart';

import '../{{existing_feature.snakeCase()}}.dart';

class {{name.pascalCase()}}Controller extends GetxController {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  {{name.pascalCase()}}Controller({required this.{{name.camelCase()}}Repository});
}