import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/widgets/heightboxes.dart';
import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Widget cardFooter({
  required String price,
  required String days,
  double fontsize = 9,
  double iconsize = 10,
}) {
  return Row(
    children: [
      Icon(
        Iconsax.timer_1,
        size: iconsize,
        color: primarycolor,
      ),
      const SizedBox(
        width: 2,
      ),
      Text(
        "${(int.parse(days) > 12) ? {("$days Days".tr)} : ("$days Hours")}",
        style: style(
          fontSize: fontsize,
          color: textfieldgrey,
          fontWeight: FontWeight.w500,
        ),
      ),
      const Spacer(),
      Icon(
        Iconsax.people,
        size: iconsize,
        color: primarycolor,
      ),
      const SizedBox(
        width: 2,
      ),
      Text(
        "Per person".tr,
        style: style(
            fontSize: fontsize,
            color: textfieldgrey,
            fontWeight: FontWeight.w500),
      ),
      widthbox10,
      const Spacer(),
      Text(
        "From ".tr,
        style: style(
            fontSize: fontsize,
            color: textfieldgrey,
            fontWeight: FontWeight.w500),
      ),
      const SizedBox(
        width: 2,
      ),
      Text(
        "AED $price",
        style: style(
            fontSize: fontsize,
            color: primarycolor,
            fontWeight: FontWeight.w900),
      ),
    ],
  );
}
