import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/exports.dart';
import '../exports.dart';

Widget rating(rating, totalreviews) {
  return Row(
    children: [
      Row(
        children: List.generate(rating, (index) {
          return const Icon(
            Icons.star,
            color: primarycolor,
            size: 13,
          );
        }),
      ),
      Text(
        "($totalreviews Reviews)".tr,
        style:
            style(fontSize: 10, color: blackcolor, fontWeight: FontWeight.w500),
      ),
    ],
  );
}
