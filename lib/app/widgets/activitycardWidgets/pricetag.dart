import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';

import '../../res/colors.dart';

Widget pricetag(price) {
  return Text(
    "AED $price",
    style:
        style(color: primarycolor, fontSize: 16, fontWeight: FontWeight.bold),
  );
}
