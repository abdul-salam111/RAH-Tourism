import 'package:flutter/material.dart';

import '../../res/exports.dart';
import '../exports.dart';

Widget locationwidget(location) {
 return Row(
    mainAxisAlignment: mainstart,
    children: [
      locationicon,
      Text(
        location,
        style: style(
            fontSize: 10, color: textfieldgrey, fontWeight: FontWeight.w500),
      ),
    ],
  );
}
