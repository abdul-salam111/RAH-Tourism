import 'package:get/get.dart';

import '../controllers/giftprview_controller.dart';

class GiftprviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GiftprviewController>(
      () => GiftprviewController(),
    );
  }
}
