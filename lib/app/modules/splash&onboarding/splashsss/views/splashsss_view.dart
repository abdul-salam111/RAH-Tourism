import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splashsss_controller.dart';

class SplashsssView extends GetView<SplashsssController> {
  const SplashsssView({super.key});
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Application'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            data,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
