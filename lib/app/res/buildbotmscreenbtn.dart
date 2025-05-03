import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/exports.dart';
import 'exports.dart';

Widget buildBottomButton(
    BuildContext context, double height, double width, VoidCallback ontap) {
  return Align(
    alignment: bottomcenter,
    child: Padding(
      padding: EdgeInsets.only(
          left: width * 0.04, right: width * 0.04, bottom: height * 0.015),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: height * 0.06,
          width: double.infinity,
          decoration: BoxDecoration(
            color: primarycolor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Row(
                mainAxisAlignment: mainbetween,
                children: [
                  Text(
                    continuebutton,
                    style: style(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Icon(
                    Iconsax.arrow_right_14,
                    color: whitecolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
