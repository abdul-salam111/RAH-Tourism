import 'package:bookdubaisafari/app/repositories/authRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../../../data/postModels/verifyOtpModel.dart';

class OtpscreenController extends GetxController {
  OtpTimerButtonController controller = OtpTimerButtonController();

  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  
  var isloading = false.obs;
AuthRepostiory authRepostiory = AuthRepostiory();
  Future verifyUser(otp) async {
    try {
      isloading.value = true;
      var email = Get.arguments;
      await authRepostiory.verifyUser(VerifyOtpModel(
        otp: otp,
        email: email,
      ));
      isloading.value = false;
    } catch (e) {
      print(e);
      isloading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void onClose() {
    pinController.dispose();
    focusNode.dispose();

    super.onClose();
  }

  // Method to handle completed OTP entry

  // Method to validate form
  void validateForm() {
    focusNode.unfocus();
    formKey.currentState?.validate();
  }
}
