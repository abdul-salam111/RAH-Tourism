import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../res/exports.dart';

Widget backButton({Color? color = textfieldgrey}) {
  return GestureDetector(
    onTap: () {
      Get.back();
    },
    child: Icon(
      Iconsax.arrow_square_left4,
      color: color,
      size: 35,
    ),
  );
}
