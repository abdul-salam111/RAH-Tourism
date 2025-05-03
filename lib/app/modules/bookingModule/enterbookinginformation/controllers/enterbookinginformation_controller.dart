import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterbookinginformationController extends GetxController {
  final countryPicker = const FlCountryCodePicker();
  Activity activity = Activity();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (Get.arguments[0] == Routes.CHOOSEPACKAGE) {
      activity = Get.arguments[1];
    } else {
      activity = Get.arguments[1].activity;
    }
  }

  /// With custom params.
  final countryPickerWithParams = FlCountryCodePicker(
    localize: true,
    showDialCode: true,
    showSearchBar: true,
    searchBarTextStyle:
        style(fontSize: 14, fontWeight: FontWeight.w600, color: blackcolor),
    countryTextStyle:
        style(fontSize: 14, fontWeight: FontWeight.w600, color: blackcolor),
    dialCodeTextStyle:
        style(fontSize: 14, fontWeight: FontWeight.w600, color: blackcolor),
  );
  final selectedCountry =
      TextEditingController(text: "United Arab Emirates").obs;
  final selectedCountrycode = TextEditingController(text: "AE").obs;
  final mobilenumberController = TextEditingController().obs;
  final selectedcountrydialcodeController =
      TextEditingController(text: "+971").obs;
  final selectedcountrydialcodeControllerforMobile =
      TextEditingController(text: "+971").obs;
  final firstnameController = TextEditingController().obs;
  final titleController = TextEditingController().obs;
  final lasttnameController = TextEditingController().obs;
  final emailaddressController = TextEditingController().obs;
  final commentController = TextEditingController().obs;
  final pickupLocation = TextEditingController().obs;
  final noteController = TextEditingController().obs;
}
