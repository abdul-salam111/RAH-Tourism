import 'package:bookdubaisafari/app/data/getModels/getUserInfo.dart';
import 'package:bookdubaisafari/app/data/postModels/updateUserProfile.dart';
import 'package:bookdubaisafari/app/repositories/authRepo.dart';
import 'package:bookdubaisafari/app/res/storageServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PersonalinformationController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstName.value.text =
        GetUserInfo.fromJson(sharedPrefbox.read(userInformation))
                .payload!
                .firstName ??
            "";
    lastName.value.text =
        GetUserInfo.fromJson(sharedPrefbox.read(userInformation))
                .payload!
                .lastName ??
            "";
    phoneController.value.text =
        GetUserInfo.fromJson(sharedPrefbox.read(userInformation))
                .payload!
                .phone ??
            " ";
  }

  final firstName = TextEditingController().obs;
  final lastName = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  var isloading = false.obs;

  AuthRepostiory authRepostiory = AuthRepostiory();

  Rx<XFile?> selectImage =
      Rx<XFile?>(null); // Use Rx<XFile?> to handle null values

  Future<void> updateProfile() async {
    try {
      isloading.value = true;

      await authRepostiory.updateUserProfile(
        UpdateUserProfile(
            firstName: firstName.value.text.trim(),
            lastName: lastName.value.text.trim(),
            phone: phoneController.value.text.trim(),
            profileImage: selectImage.value),
      );

      isloading.value = false;
    } catch (e) {
      print(e);
      isloading.value = false;
    }
  }
}
