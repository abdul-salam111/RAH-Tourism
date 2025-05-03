import 'package:get/get.dart';

import '../controllers/enterbookinginformation_controller.dart';

class EnterbookinginformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnterbookinginformationController>(
      () => EnterbookinginformationController(),
    );
  }
}
