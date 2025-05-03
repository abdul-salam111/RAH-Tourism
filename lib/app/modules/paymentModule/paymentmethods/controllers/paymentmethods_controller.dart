import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../data/postModels/savecardDetails.dart';
import '../../../../localdatabase/database.dart';

class PaymentmethodsController extends GetxController {
  var isChecked = false.obs;
  final DatabaseHelper dbHelper = DatabaseHelper();
  Future getData() async {
    carddetailsList.value = await dbHelper.getCards();
  }

  Activity activity = Activity();
  var selectedPaymentMethod = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
    if (Get.arguments[0] == Routes.CHOOSEPACKAGE) {
      activity = Get.arguments[1] as Activity;
    } else {
      activity = Get.arguments[1] as Activity;
    }
  }

  RxList<CardDetailsModel> carddetailsList = <CardDetailsModel>[].obs;
}
