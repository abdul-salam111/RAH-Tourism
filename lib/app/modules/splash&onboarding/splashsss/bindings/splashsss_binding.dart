import 'package:get/get.dart';

import '../controllers/splashsss_controller.dart';

class SplashsssBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashsssController>(
      () => SplashsssController(),
    );
  }
}
