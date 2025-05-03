import 'package:bookdubaisafari/app/data/postModels/signupmodel.dart';
import 'package:bookdubaisafari/app/repositories/authRepo.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final firstnameController = TextEditingController().obs;
  final fullnameController = TextEditingController().obs;
  final lastnameController = TextEditingController().obs;
  var isObsecure = true.obs;

  var isRemembered = false.obs;

  void toggleRememberMe() {
    isRemembered.value = !isRemembered.value;
  }

  AuthRepostiory authRepostiory = AuthRepostiory();
  var isloading = false.obs;
  void signupUser(context) async {
    try {
      isloading.value = true;
      firstnameController.value.text =
          fullnameController.value.text.split(' ').first;
      String fullName = fullnameController.value.text;
      List<String> nameParts = fullName.split(' ');

// Check if there's more than one part to avoid errors
      lastnameController.value.text = nameParts.length > 1
          ? nameParts
              .sublist(1)
              .join(' ') // Join the remaining parts as the last name
          : ''; // Set it to an empty string if no last name is present

      await authRepostiory.signupUser(SignUpModel(
          fullname: firstnameController.value.text.trim(),

          email: emailController.value.text.trim(),
          password: passwordController.value.text.trim()));
      isloading.value = false;
      emailController.value.clear();
      passwordController.value.clear();
      firstnameController.value.clear();
      lastnameController.value.clear();
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
    firstnameController.value.dispose();
    lastnameController.value.dispose();
  }
}
