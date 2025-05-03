import 'package:get/get.dart';

import '../controllers/deleteaccount_controller.dart';

class DeleteaccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteaccountController>(
      () => DeleteaccountController(),
    );
  }
}
