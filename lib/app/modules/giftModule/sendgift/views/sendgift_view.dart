import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/res/paddings.dart';
import 'package:bookdubaisafari/app/res/texts.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/sendgift_controller.dart';

class SendgiftView extends GetView<SendgiftController> {
  const SendgiftView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
            // appBar: AppBar(
            //   backgroundColor: const Color(0xfff7f7f7),
            //   title: Text(
            //     'Send Gift',
            //     style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.w800),
            //   ),
            //   centerTitle: true,
            //   leading: backButton(),
            //   leadingWidth: 40,
            // ),
            body: ListView(
          padding: screenpad,
          children: [
            appbar('Send Gift'.tr, context.width * 0.1),
            SizedBox(
              height: context.height * 0.02,
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              decoration: BoxDecoration(
                  color: primarycolor, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "Give the ones you love unforgettable travel experiences and make memories to last a lifetime with a RAH Tours gift card.🎁".tr,
                  style: GoogleFonts.redHatDisplay(fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(
                  "Choose a value for gift card".tr,
                  style: GoogleFonts.redHatDisplay(
                      color: blackcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Color(0xffd4d4d4),
                  ),
                ),
                const Wrap(
                  direction: Axis.horizontal,
                  spacing: 2,
                  runSpacing: 10,
                  children: [
                    Boxes(
                      price: "AED 50.0",
                    ),
                    Boxes(
                      price: "AED 100.0",
                    ),
                    Boxes(
                      price: "AED 150.0",
                    ),
                    Boxes(
                      price: "AED 200.0",
                    ),
                    Boxes(
                      price: "AED 250.0",
                    ),
                    Boxes(
                      price: "AED 300.0",
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discount".tr,
                      style: GoogleFonts.poppins(
                          color: textfieldgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: controller.messageController.value,
                      obscureText: false,
                      style:
                          GoogleFonts.poppins(color: blackcolor, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: "Enter discount".tr,
                        hintStyle: GoogleFonts.poppins(
                            color: textfieldgrey, fontSize: 13),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primarycolor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Recipient Email".tr,
                      style: GoogleFonts.poppins(
                          color: textfieldgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      controller: controller.messageController.value,
                      obscureText: false,
                      style:
                          GoogleFonts.poppins(color: blackcolor, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: emailHint.tr,
                        hintStyle: GoogleFonts.poppins(
                            color: textfieldgrey, fontSize: 13),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primarycolor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding: const EdgeInsets.only(left: 10),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Text(
                      "Personal Message".tr,
                      style: GoogleFonts.poppins(
                          color: textfieldgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: height * 0.01),
                    TextFormField(
                      maxLines: 5,
                      controller: controller.messageController.value,
                      obscureText: false,
                      style:
                          GoogleFonts.poppins(color: blackcolor, fontSize: 13),
                      decoration: InputDecoration(
                        hintText: "eg. write your personal message".tr,
                        hintStyle: GoogleFonts.poppins(
                            color: textfieldgrey, fontSize: 13),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primarycolor, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 10, top: 10),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.GIFTPRVIEW);
                },
                child: Container(
                  height: height * .06,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    color: primarycolor, // Adjust the color as needed
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                  ),
                  child: Center(
                    child: Text(
                      "Preview Card".tr,
                      style: GoogleFonts.redHatDisplay(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 14.0, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.w500, // Adjust the font weight as needed
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * .06,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    color: whitecolor,
                    border: Border.all(color: primarycolor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: GoogleFonts.redHatDisplay(
                        color: primarycolor,
                        decoration: TextDecoration.none,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Boxes extends StatelessWidget {
  const Boxes({super.key, required this.price});
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.30,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primarycolor),
      ),
      child: Center(
        child: Text(
          price,
          style: GoogleFonts.redHatDisplay(
              decoration: TextDecoration.none,
              color: primarycolor,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ),
    );
  }
}
