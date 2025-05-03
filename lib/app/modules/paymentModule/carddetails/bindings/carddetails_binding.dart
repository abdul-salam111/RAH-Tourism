import 'package:get/get.dart';

import '../controllers/carddetails_controller.dart';

class CarddetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarddetailsController>(
      () => CarddetailsController(),
    );
  }
}
