import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../res/exports.dart';
import 'exports.dart';



AppBar customAppBar({required String title, required bool center}) {
  return AppBar(
    leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.arrow_back_ios)),
    automaticallyImplyLeading: true,
    iconTheme: const IconThemeData(color: blackcolor),
    title: CustomText(
      text: title,
      color: blackcolor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    centerTitle: center,
  );
}
