import 'package:get/get.dart';

import '../controllers/sendgift_controller.dart';

class SendgiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SendgiftController>(
      () => SendgiftController(),
    );
  }
}
