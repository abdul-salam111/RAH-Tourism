import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/localdatabase/database.dart';
import 'package:bookdubaisafari/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:get/get.dart';

import '../../../../widgets/snakbar.dart';

class CategoriesActivitiesController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWishlistData();
  }

  var selectedIndex = 0.obs;
  var categoryId = 1.obs;

  RxList<Activity> filteredActivities = <Activity>[].obs;
  RxList<GetWishListData> wishList = <GetWishListData>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Fetch all wishlist data from the database
  void getWishlistData() async {
    final data = await dbHelper.fetchWishlistDataFromDatabase();
    wishList.assignAll(data); // Updates the list reactively
  }

  // Add an activity to the wishlist
  void addToWishList(GetWishListData getwishlistdata) async {
    await dbHelper.addToWishList(getwishlistdata);

    final data = await dbHelper.fetchWishlistDataFromDatabase();
    getWishlistData();
    wishlistController.wishList.assignAll(data);
    SnackbarHelper.showSnackbar(
      context: Get.context!,
      message: 'Added to wishlist!',
      actionLabel: 'Undo',
      onActionPressed: () {
        removeFromWishList(getwishlistdata.activity!.id!);
      },
      backgroundColor: whitecolor,
    );
  }

  final wishlistController = Get.put(WishlistController());
  // Remove an activity from the wishlist by activity ID
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
        wishlistController.wishList
            .removeWhere((e) => e.activity!.id == activityId);
      } else {
        print("Item not found in database.");
      }
    } catch (e) {
      print("Error removing item: $e");
    }
  }
}
