import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Page extends GetView<{{name.pascalCase()}}Controller> {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('{{name.pascalCase()}} Page')));
  }
}