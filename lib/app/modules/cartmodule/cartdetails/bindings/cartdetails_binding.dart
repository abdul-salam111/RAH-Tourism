import 'package:get/get.dart';

import '../controllers/cartdetails_controller.dart';

class CartdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartdetailsController>(
      () => CartdetailsController(),
    );
  }
}
