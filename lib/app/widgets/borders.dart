import 'package:flutter/material.dart';

OutlineInputBorder bannertextfieldBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white.withOpacity(0.5),
      width: 1,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(10)),
  );
}
