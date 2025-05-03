import 'package:get/get.dart';

import '../controllers/verificationscreen_controller.dart';

class VerificationscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerificationscreenController>(
      () => VerificationscreenController(),
    );
  }
}
