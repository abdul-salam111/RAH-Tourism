import 'package:get/get.dart';

import '../controllers/choosepackage_controller.dart';

class ChoosepackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ChoosepackageController>(
      ChoosepackageController(),
    );
  }
}
