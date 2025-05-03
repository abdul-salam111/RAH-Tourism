import 'package:get/get.dart';

import '../controllers/securitypage_controller.dart';

class SecuritypageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SecuritypageController>(
      () => SecuritypageController(),
    );
  }
}
