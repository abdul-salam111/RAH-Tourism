import 'package:bookdubaisafari/app/data/postModels/savecardDetails.dart';
import 'package:bookdubaisafari/app/localdatabase/database.dart';
import 'package:get/get.dart';

class AddnewpaymentController extends GetxController {
  final DatabaseHelper dbHelper = DatabaseHelper();
  Future getData() async {
    carddetailsList.value = await dbHelper.getCards();
  }

  var selectedPaymentMethod = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  RxList<CardDetailsModel> carddetailsList = <CardDetailsModel>[].obs;
}
