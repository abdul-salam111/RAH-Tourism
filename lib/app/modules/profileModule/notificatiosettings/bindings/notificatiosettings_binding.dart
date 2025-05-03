import 'package:get/get.dart';

import '../controllers/notificatiosettings_controller.dart';

class NotificatiosettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificatiosettingsController>(
      () => NotificatiosettingsController(),
    );
  }
}
