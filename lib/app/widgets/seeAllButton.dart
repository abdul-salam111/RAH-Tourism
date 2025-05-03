import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../res/exports.dart';
import 'exports.dart';

Widget seeAll({String? headingtext, VoidCallback? ontap}) {
  return Row(
    mainAxisAlignment: mainbetween,
    children: [
      Text(
        headingtext!,
        style:
            style(fontSize: 17, fontWeight: FontWeight.w800, color: blackcolor),
      ),
      GestureDetector(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: primarycolor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Text(
                "See All".tr,
                style: style(
                    color: primarycolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11),
              ),
              const SizedBox(
                width: 2,
              ),
              const Icon(
                Iconsax.arrow_right_1,
                size: 15,
                color: primarycolor,
              )
            ],
          ),
        ),
      )
    ],
  );
}
