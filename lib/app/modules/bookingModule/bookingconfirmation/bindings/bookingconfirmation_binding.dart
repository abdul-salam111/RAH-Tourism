import 'package:get/get.dart';

import '../controllers/bookingconfirmation_controller.dart';

class BookingconfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BookingconfirmationController>(
      BookingconfirmationController(),
    );
  }
}
