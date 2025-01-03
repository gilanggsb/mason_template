import 'package:get/get.dart';

import '../{{existing_feature.snakeCase()}}.dart';

class {{name.pascalCase()}}Binding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => {{name.pascalCase()}}Repository(apiService: Get.find()));
    Get.lazyPut(() => {{name.pascalCase()}}Controller({{name.camelCase()}}Repository: Get.find()));
  }
}