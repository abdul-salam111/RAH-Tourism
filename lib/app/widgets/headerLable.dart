import 'package:bookdubaisafari/app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/exports.dart';

class HeaderText extends StatelessWidget {
  final String title, subtitle;
  const HeaderText({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(height: height * 0.04),
        logowidget(height),
        Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
                color: primarycolor, fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ),
        Center(
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: textfieldgrey,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(height: height * 0.04),
      ],
    );
  }
}
