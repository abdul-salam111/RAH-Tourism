import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';
import '../../res/exports.dart';

Widget cardTitle(size, text, maxlines, {fontsize = 12.0}) {
  return SizedBox(
    width: size,
    child: Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      style: style(
        fontSize: fontsize,
        color: blackcolor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
