import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';
import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/localdatabase/database.dart';
import 'package:bookdubaisafari/app/modules/cartmodule/cart/controllers/cart_controller.dart';
import 'package:bookdubaisafari/app/res/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

class ChoosepackageController extends GetxController {
  Activity? activity;
  var selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  var selectedAdults = 1.obs;
  var selectedChilds = 1.obs;
  var selectedInfants = 0.obs;

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      barrierColor: primarycolor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDate.value =
          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
    }
  }

  var adultprice = 00.00.obs;
  var childprice = 00.00.obs;
  var infantprice = 00.00.obs;
  var totalprice = 0.0.obs;

  void calculateTotal() {
    if (activity!.packages![selectedPkg.value].category!.name == "SHARING") {
      totalprice.value = ((adultprice.value * selectedAdults.value) +
          (childprice.value * selectedChilds.value));
    } else {
      totalprice.value =
          double.parse(activity!.packages![selectedPkg.value].price!);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    activity = Get.arguments;
    print(activity!.name);
    if (activity!.packages![selectedPkg.value].category!.name == "SHARING") {
      adultprice.value =
          double.parse(activity!.packages![selectedPkg.value].adultPrice!);
      childprice.value =
          double.parse(activity!.packages![selectedPkg.value].childPrice!);
    }
    calculateTotal();
  }

  final cartcontroller = Get.put(CartController());
  final DatabaseHelper dbHelper = DatabaseHelper();
  void insertActivityData(Activity activity) async {
    try {
      await dbHelper.insertactivity(
        GetCartDataModel(
          package: activity.packages![selectedPkg.value],
          date: selectedDate.value.toString(),
          adults: selectedAdults.value.toString(),
          childs: selectedChilds.value.toString(),
          infants: selectedInfants.value.toString(),
          packageType: activity.packages![selectedPkg.value].category!.name,
          totalPrice: totalprice.value.toString(),
          activity: activity,
        ),
      );
      cartcontroller.getActivityData();
      Get.snackbar("Added to cart", "The Tour has been added to the cart");
    } catch (e) {
      throw Exception();
    }
  }

  var selectedPkg = 0.obs;
}
