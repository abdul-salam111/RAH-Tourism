import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetpasswordController extends GetxController {
  final lastpasswordcontroler = TextEditingController().obs;
  final newpasswordcontroler = TextEditingController().obs;
  final confirmpasswordcontroler = TextEditingController().obs;
  var isObsecure = true.obs;
  final formKey = GlobalKey<FormState>();
}
