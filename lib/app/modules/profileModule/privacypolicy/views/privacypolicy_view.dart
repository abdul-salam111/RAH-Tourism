import 'package:bookdubaisafari/app/res/alignments.dart';
import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/res/paddings.dart';
import 'package:bookdubaisafari/app/widgets/backbutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/privacypolicy_controller.dart';

class PrivacypolicyView extends GetView<PrivacypolicyController> {
  const PrivacypolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: ListView(
        children: [
          SizedBox(
            height: (height * 0.03),
          ),
          Row(
            children: [
              backButton(),
              const Spacer(),
              Text(
                'TERMS & PRIVACY POLICY',
                style: GoogleFonts.redHatDisplay(
                  fontWeight: FontWeight.bold,
                  color: blackcolor,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: (height * 0.02),
          ),
          Container(
            padding: pad14,
            decoration: const BoxDecoration(color: whitecolor),
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
                Text(
                  "1)Introduction",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Describes the app’s commitment to user privacy and the types of personal information it collects.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "2)Information Collection",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Personal Information: Details of the personal data collected, including name, email address, payment details, travel preferences, location data, and other relevant information. Non-Personal Information: Includes data collected automatically such as device type, operating system, and browsing behavior.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "3)How Information is Used",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Explains the purposes for which the app collects data, such as:To provide personalized tour recommendations. To process payments. To communicate with users about bookings, updates, and promotions. To improve the app’s functionality and user experience.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "4)Data Sharing",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "States whether the app shares user data with third parties, such as tour operators, payment processors, or marketing partners. Explains if data is shared for legal or security reasons.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "5)Cookies and Tracking Technologies",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Details the use of cookies or similar technologies to enhance user experience, track usage, and provide relevant advertising.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "6)Security Measures",
                  style: GoogleFonts.redHatDisplay(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: blackcolor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "Outlines the steps the app takes to protect user data from unauthorized access, misuse, or theft (e.g., encryption, secure payment processing).",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: textfieldgrey),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
