import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/giftprview_controller.dart';

class GiftprviewView extends GetView<GiftprviewController> {
  const GiftprviewView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/giftcardbg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
                child: Row(
                  children: [
                    backButton(color: whitecolor),
                    const Spacer(),
                    Text(
                      'Gift Card',
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.bold,
                        color: whitecolor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.1,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: width * 0.6,
                  child: Text(
                    "Book unforgettable experiences & Activities Type",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.redHatDisplay(
                      color: whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: (height * 0.03),
              ),
              Container(
                padding: defaultpad,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: mainend,
                  children: [
                    SizedBox(
                      height: (height * 0.01),
                    ),
                    Text(
                      "Redeemable for the Value of",
                      style: GoogleFonts.redHatDisplay(
                        color: primarycolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: (height * 0.01),
                    ),
                    Text(
                      "AED 50",
                      style: GoogleFonts.redHatDisplay(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                        color: primarycolor,
                      ),
                    ),
                    SizedBox(
                      height: (height * 0.02),
                    ),
                    Container(
                      margin: defaultpad,
                      padding: defaultpad,
                      decoration: BoxDecoration(
                        color: primarycolor,
                        border: Border.all(width: 2, color: primarycolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Lucky You!",
                            style: GoogleFonts.redHatDisplay(
                              color: primarycolor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You can book any tour activity, or attraction you like to",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.redHatDisplay(
                              color: blackcolor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: (20),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: crosstart,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                    10), // Top-left corner rounded
                                topRight: Radius.circular(
                                    10), // Top-right corner rounded
                              ),
                              child: Image.asset(
                                "assets/images/1.jpg", // Image path
                                fit: BoxFit
                                    .cover, // Ensure the image covers the space
                              ),
                            ),
                            const SizedBox(
                              height: (20),
                            ),
                            Text(
                              "Redeemable for the Value of",
                              style: GoogleFonts.redHatDisplay(
                                color: textfieldgrey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: (height * 0.01),
                            ),
                            const SizedBox(
                              height: (10),
                            ),
                            Text(
                              "Experience the thrill of adventure with ATV Quad Bike Tour. Explore the breathtaking beauty of the open desert as you traverse rugged terrain and conquer challenging obstacles. Meet your experienced tour guide and set off on your adventure. Whether you’re an adrenaline junkie or simply looking for a unique outdoor experience, the ATV Quad Bike Tour is the perfect choice. Ride a 400cc quad bike through the desert, following your guide as you navigate the dunes. Feel the adrenaline as you speed through the open desert. Take a break to try sandboarding and camel riding. Enjoy a refreshing bottle of mineral water before returning to the starting point.",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.redHatDisplay(
                                color: blackcolor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
