import 'package:bookdubaisafari/app/widgets/backbutton.dart';
import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';
import '../res/exports.dart';

Widget appbar(String appbartext, double rightwidth) {
  return Padding(
    padding: const EdgeInsets.only(top: 50),
    child: SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          backButton(),
          const Spacer(),
          Text(
            appbartext,
            style: style(
                fontWeight: FontWeight.bold, color: darkgrey, fontSize: 20),
          ),
          const Spacer(),
          SizedBox(
            width: rightwidth,
          )
        ],
      ),
    ),
  );
}
