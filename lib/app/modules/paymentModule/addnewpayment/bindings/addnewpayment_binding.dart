import 'package:get/get.dart';

import '../controllers/addnewpayment_controller.dart';

class AddnewpaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddnewpaymentController>(
      () => AddnewpaymentController(),
    );
  }
}
