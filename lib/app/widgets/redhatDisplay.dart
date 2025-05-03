import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle style({
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.redHatDisplay(
    decoration: TextDecoration.none,
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
