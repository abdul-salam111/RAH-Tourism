import 'package:get/get.dart';

import '../controllers/cities_actvities_controller.dart';

class CitiesActvitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CitiesActvitiesController>(
      CitiesActvitiesController(),
    );
  }
}
