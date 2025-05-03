import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
          child: Image.asset(
        logo,
        width: width * 0.45,
        height: height * 0.2,
      )),
    );
  }
}
