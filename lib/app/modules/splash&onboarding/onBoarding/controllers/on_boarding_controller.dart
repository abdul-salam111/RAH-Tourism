import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else if (currentPage.value >= 2) {
      sharedPrefbox.write(isOnboardingDone, true);
      Get.offAllNamed(Routes.NAVBAR);
    }
  }

  final RxList<Map<String, String>> onboardingData = [
    {
      // 'title': "assets/images/intro1.png",
      'image': 'assets/icons/intro1.png',
    },
    {
      // 'title': "assets/images/introtext2.png",
      'image': 'assets/icons/intro2.png',
    },
    {
      //  'title': "assets/images/introtext3.png",
      'image': 'assets/icons/intro3.png',
    },
  ].obs;
}
