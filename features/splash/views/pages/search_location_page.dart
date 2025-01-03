import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../splash.dart';

class SearchLocationPage extends GetView<SearchLocationController> {
  const SearchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('SearchLocation Page')));
  }
}