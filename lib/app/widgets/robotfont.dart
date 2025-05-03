import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


TextStyle robotoFontStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return GoogleFonts.roboto(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}
