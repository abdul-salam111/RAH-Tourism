import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelText extends StatelessWidget {
  final String label;
  const LabelText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: GoogleFonts.poppins(
          color: authtextfieldborder,
          fontSize: 14,
          fontWeight: FontWeight.w400),
    );
  }
}
