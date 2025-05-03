import 'package:get/get.dart';

import '../controllers/bookingdetails_controller.dart';

class BookingdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingdetailsController>(
      BookingdetailsController(),
    );
  }
}
