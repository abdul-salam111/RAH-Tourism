import 'package:bookdubaisafari/app/data/getModels/getMainCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/modules/wishlist/controllers/wishlist_controller.dart';
import 'package:bookdubaisafari/app/repositories/categoriesRepo.dart';
import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/widgets/snakbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../localdatabase/database.dart';

class HomeController extends GetxController {
  final searchController = TextEditingController().obs;
  final categoriesImages = [
    "https://media.cntraveller.com/photos/617936a2a8f76267fba5d115/master/w_1600%2Cc_limit/The%2520Burj%2520Khalifa-GettyImages-1084264582.jpeg",
    "https://cdn.pixabay.com/photo/2022/05/24/21/22/abu-7219383_640.jpg",
    "https://t3.ftcdn.net/jpg/02/21/55/84/360_F_221558453_YmJL5Ot3H2KvImYydiAtRBR07F8vyPRM.jpg",
    "https://www.desertholidaytours.com/assets/img/package/al-ain-city-tour-abu-dhabi-1.jpg"
  ];
  GetMainCategories getMainCategories = GetMainCategories();
  CategoriesRepository categoriesRepository = CategoriesRepository();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    getAllCategories();
    await getSubCategoriess();
    getFeaturedActivities();
    getWishlistData();
  }

  var isloading = false.obs;
  Future getAllCategories() async {
    try {
      isloading.value = true;
      getMainCategories = await categoriesRepository.getMainCategories();
      update();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      print(e);
    }
  }

  GetSubCategories getSubCategories = GetSubCategories();
  Future getSubCategoriess() async {
    try {
      getSubCategories = await categoriesRepository.getsubCategories();
    } catch (e) {
      print(e);
    }
  }

  int a = 0;
  List<Activity> featuredActivities = <Activity>[].obs;
  void getFeaturedActivities() {
    // Clear the list before adding new activities to avoid duplicates
    featuredActivities.clear();
    listOfActivitiesForSearch.clear();
    // Add all matching activities to the list
    for (int i = 0; i < getSubCategories.allCategory!.length; i++) {
      for (int j = 0;
          j < getSubCategories.allCategory![i].activity!.length;
          j++) {
        listOfActivitiesForSearch
            .add(getSubCategories.allCategory![i].activity![j]);

        if (getSubCategories.allCategory![i].activity![j].mostPopularActivity ==
            1) {
          featuredActivities.add(getSubCategories.allCategory![i].activity![j]);
        }
      }
    }
  }

  RxList<GetWishListData> wishList = <GetWishListData>[].obs;
  final DatabaseHelper dbHelper = DatabaseHelper();

  // Fetch all wishlist data from the database
  void getWishlistData() async {
    final data = await dbHelper.fetchWishlistDataFromDatabase();
    wishList.assignAll(data); // Updates the list reactively
  }

  // Add an activity to the wishlist
  void addToWishList(GetWishListData getwishlistdata, context) async {
    await dbHelper.addToWishList(getwishlistdata);

    final data = await dbHelper.fetchWishlistDataFromDatabase();
    getWishlistData();
    wishlistController.wishList.assignAll(data);
    SnackbarHelper.showSnackbar(
      context: context,
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

  RxList<Activity> listOfActivitiesForSearch = <Activity>[].obs;
  RxList<Activity> searchedActivities = <Activity>[].obs;
}
