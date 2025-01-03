import 'package:get/get.dart';

import '../splash.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // Get.lazyPut(() => SplashRepository(apiService: Get.find()));
    Get.lazyPut(() => SplashController(splashRepository: Get.find()));
  }
}