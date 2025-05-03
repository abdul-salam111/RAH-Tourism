import 'package:get/get.dart';

import '../controllers/editbookings_controller.dart';

class EditbookingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditbookingsController>(
      () => EditbookingsController(),
    );
  }
}
