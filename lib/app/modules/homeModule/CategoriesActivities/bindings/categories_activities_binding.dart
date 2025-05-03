import 'package:get/get.dart';

import '../controllers/categories_activities_controller.dart';

class CategoriesActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriesActivitiesController>(
      () => CategoriesActivitiesController(),
    );
  }
}
