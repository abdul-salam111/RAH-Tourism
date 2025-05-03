import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/exports.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  Color? color;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double radius;
  final double fontsize;
  final Color textcolor;

  CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = primarycolor,
      this.height = 45,
      this.width = double.infinity,
      this.radius = 10,
      this.fontsize = 18.0,
      this.textcolor = whitecolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color, // Adjust the color as needed
          borderRadius:
              BorderRadius.circular(radius), // Adjust the radius as needed
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              decoration: TextDecoration.none,
              color: textcolor,
              fontSize: fontsize, // Adjust the font size as needed
              fontWeight: FontWeight.w500, // Adjust the font weight as needed
            ),
          ),
        ),
      ),
    );
  }
}
