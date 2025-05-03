import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/exports.dart';

Widget skipButton(double height) {
  return Padding(
    padding: EdgeInsets.only(top: height, right: 30),
    child: Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          sharedPrefbox.write(isOnboardingDone, true);
          Get.toNamed(Routes.NAVBAR);
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(30), // for roundedFull
          ),
          child: const Center(
            child: Text(
              "Skip",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    ),
  );
}
