import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../res/exports.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final String label;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.prefixIcon,
    required this.label,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: crosstart,
      children: [
        LabelText(label: label),
        SizedBox(height: height * 0.001),
        TextFormField(
          textCapitalization: TextCapitalization.words,
          controller: controller,
          obscureText: obscureText,
          style: GoogleFonts.poppins(color: blackcolor, fontSize: 13),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
                color: authtextfieldhintcolor, fontSize: 13),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: Icon(
                prefixIcon,
                color: primarycolor,
                size: 20,
              ),
            ),
            suffixIcon: suffixIcon,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primarycolor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: authtextfieldborder),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            contentPadding: const EdgeInsets.only(left: 10),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
