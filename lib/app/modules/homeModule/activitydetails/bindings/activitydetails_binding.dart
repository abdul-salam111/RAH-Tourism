import 'package:get/get.dart';

import '../controllers/activitydetails_controller.dart';

class ActivitydetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ActivitydetailsController>(
      ActivitydetailsController(),
    );
  }
}
