import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/modules/homeModule/home/controllers/home_controller.dart';

import 'package:get/get.dart';

class ActivitydetailsController extends GetxController {
  int? index;
  Activity? activity;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    index = Get.arguments[0];
    activity = Get.arguments[1];
  }

  var selectedimage = 0.obs;
  HomeController homeController = Get.put(HomeController());

  var listOfTabs = [
    "ABOUT THIS ACTIVITY",
    "DESCRIPTION",
    "HIGHTLIGHTS",
    "ITENRARY",
    "WHAT'S INCLUDED",
    "WHAT'S NOT INCLUDED",
    "TRIP INSTRUCTIONS",
  ];
  var selectedTab = 0.obs;
}
