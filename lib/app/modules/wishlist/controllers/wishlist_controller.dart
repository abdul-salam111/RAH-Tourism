import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/localdatabase/database.dart';
import 'package:bookdubaisafari/app/modules/homeModule/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  RxList<GetWishListData> wishList = <GetWishListData>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  void getWishlistData() async {
    final data = await dbHelper.fetchWishlistDataFromDatabase();
    wishList.assignAll(data); // Updates the list reactively
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWishlistData();
  }

  void removeFromWishList(int activityId) async {
    try {
      getWishlistData();
      // Find the item in the wishlist by activity ID
      final itemToRemove =
          wishList.firstWhere((e) => e.activity!.id == activityId);

      bool isRemoved = await dbHelper.removeFromWishList(itemToRemove.id!);
      if (isRemoved) {
        wishList.removeWhere(
            (e) => e.activity!.id == activityId); // Remove from local list
        HomeController().getWishlistData();
      } else {
        print("Item not found in database.");
      }
    } catch (e) {
      print("Error removing item: $e");
    }
  }
}
