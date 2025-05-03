import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';
import 'package:bookdubaisafari/app/localdatabase/database.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getActivityData();
  }

  RxList<GetCartDataModel> activityList = <GetCartDataModel>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();
  void getActivityData() async {
    activityList.value = await dbHelper.fetchCartDataFromDatabase();
    print(activityList.length);
  }

  void deleteActivity(id) async {
    await dbHelper.delete(id);
    getActivityData();
  }
}
