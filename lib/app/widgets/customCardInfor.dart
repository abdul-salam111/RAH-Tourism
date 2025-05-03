import 'package:flutter/material.dart';

import '../res/exports.dart';
import 'exports.dart';


class CustomInfoCard extends StatelessWidget {
  final Color backgroundColor;
  final String headerText;
  final String bodyText;
  final String imageUrl;

  const CustomInfoCard({
    super.key,
    required this.backgroundColor,
    required this.headerText,
    required this.bodyText,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: pad10,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: crosstart,
            children: [
              CustomText(
                text: headerText,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              CustomText(
                text: bodyText,
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
