import 'package:get/get.dart';

import '../controllers/supportandhelp_controller.dart';

class SupportandhelpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportandhelpController>(
      () => SupportandhelpController(),
    );
  }
}
