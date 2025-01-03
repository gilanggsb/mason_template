import 'package:get/get.dart';

import '../splash.dart';

class SearchLocationBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SearchLocationRepository(apiService: Get.find()));
    Get.lazyPut(() => SearchLocationController(searchLocationRepository: Get.find()));
  }
}