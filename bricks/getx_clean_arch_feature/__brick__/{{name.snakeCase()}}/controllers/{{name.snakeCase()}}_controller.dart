import 'package:get/get.dart';

import '../{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Controller extends GetxController {
  final {{name.pascalCase()}}Repository {{name.camelCase()}}Repository;

  {{name.pascalCase()}}Controller({required this.{{name.camelCase()}}Repository});
}