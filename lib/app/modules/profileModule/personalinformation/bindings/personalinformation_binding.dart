import 'package:get/get.dart';

import '../controllers/personalinformation_controller.dart';

class PersonalinformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalinformationController>(
      () => PersonalinformationController(),
    );
  }
}
