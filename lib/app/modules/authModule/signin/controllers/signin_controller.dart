import 'package:bookdubaisafari/app/data/postModels/signinUser.dart';
import 'package:bookdubaisafari/app/repositories/authRepo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  var isObsecure = true.obs;
  final formKey = GlobalKey<FormState>();
  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  AuthRepostiory authRepostiory = AuthRepostiory();
  var isloading = false.obs;
  void signin() async {
    try {
      var isUserBooking = Get.arguments;
      isloading.value = true;
      await Future.delayed(const Duration(seconds: 5), () {});
      await authRepostiory.signInUser(
          SignInModel(
              email: emailController.value.text.trim(),
              password: passwordController.value.text.trim()),
          isUserBooking);
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
      print(e);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }
}
