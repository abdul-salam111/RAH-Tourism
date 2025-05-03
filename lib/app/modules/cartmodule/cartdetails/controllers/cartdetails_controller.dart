import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';
import 'package:get/get.dart';

class CartdetailsController extends GetxController {
 late GetCartDataModel activity;
  @override
  void onInit() {
    super.onInit();
    activity= Get.arguments;
  }


}
