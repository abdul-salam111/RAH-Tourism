import 'package:bookdubaisafari/app/modules/homeModule/activitydetails/views/activitydetails_view.dart';
import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/paymentmethods_controller.dart';

class PaymentmethodsView extends GetView<PaymentmethodsController> {
  const PaymentmethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      alignment: bottomcenter,
      children: [
        Scaffold(
            body: ListView(
          padding: screenpad,
          children: [
            appbar('PAYMENT METHOD'.tr, width * 0.04),
            SizedBox(height: height * 0.02),
            Center(
              child: Text(
                'Select your Payment Method'.tr,
                style: GoogleFonts.redHatDisplay(
                    fontWeight: FontWeight.bold,
                    color: blackcolor,
                    fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: pad16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Obx(
                    () => controller.carddetailsList.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: controller.carddetailsList.length,
                            itemBuilder: (context, index) {
                              final card = controller.carddetailsList[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedPaymentMethod.value =
                                      index;
                                },
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          card.cardType == "visa"
                                              ? "assets/icons/visa.png"
                                              : "assets/icons/master.png",
                                          width: 50,
                                          height: 50,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              "${card.cardType} **** ${card.cardNumber.substring(14, 19)}",
                                              style: GoogleFonts.redHatDisplay(
                                                  color: blackcolor,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            Text("Exp: ${card.expiryDate}",
                                                style:
                                                    GoogleFonts.redHatDisplay(
                                                        color: textfieldgrey,
                                                        fontSize: 12)),
                                          ],
                                        ),
                                        const Spacer(),
                                        Obx(
                                          () => Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              color: controller
                                                          .selectedPaymentMethod
                                                          .value ==
                                                      index
                                                  ? primarycolor
                                                  : whitecolor,
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: controller
                                                        .selectedPaymentMethod
                                                        .value ==
                                                    index
                                                ? const Icon(
                                                    Icons.check,
                                                    color: whitecolor,
                                                    size: 10,
                                                  )
                                                : const SizedBox.shrink(),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      child: Divider(
                                        color: greyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.CARDDETAILS);
                    },
                    child: Container(
                      width: width,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: greyColor),
                        borderRadius: radius10,
                      ),
                      alignment: bottomcenter,
                      child: Center(
                        child: Text(
                          "ADD PAYMENT METHOD",
                          style: GoogleFonts.redHatDisplay(
                            color: blackcolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Text(
              'Cancellation Policy',
              style: GoogleFonts.redHatDisplay(
                  fontWeight: FontWeight.bold,
                  color: primarycolor,
                  fontSize: 14),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Cancellations 30+ days before the tour receive a full refund. 15-30 days prior get 50%, and less than 15 days are non-refundable. If the agency cancels, a full refund or rescheduling is offered.",
                textAlign: TextAlign.justify,
                style: GoogleFonts.redHatDisplay(
                    color: blackcolor,
                    fontWeight: FontWeight.w600,
                    fontSize: 11),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Booking Rules',
              style: GoogleFonts.redHatDisplay(
                  fontWeight: FontWeight.bold,
                  color: primarycolor,
                  fontSize: 14),
            ),
            const SizedBox(height: 5),
            Container(
              padding: defaultpad,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: whitecolor),
              child: const Column(
                children: [
                  Bullets(
                      text:
                          "A deposit or full payment is needed to secure your booking."),
                  Bullets(
                      text: "Bookings are confirmed once payment is received."),
                  Bullets(
                      text:
                          "Cancellations made 30+ days before the tour receive a refund."),
                  Bullets(
                      text:
                          "Changes or cancellations within 15-30 days may incur fees."),
                  Bullets(
                      text:
                          "No refunds for cancellations within 15 days of the tour."),
                  Bullets(
                      text:
                          "Availability is subject to confirmation and may change."),
                  Bullets(
                      text:
                          "The agency reserves the right to cancel or reschedule tours.")
                ],
              ),
            ),
            SizedBox(height: height * 0.01),
            Row(
              children: [
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.isChecked.value = !controller.isChecked.value;
                    },
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: controller.isChecked.value
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: Colors.orange,
                          width: 2,
                        ),
                      ),
                      child: controller.isChecked.value
                          ? const Icon(
                              Icons.check,
                              size: 18,
                              color: Colors.white,
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                    child: RichText(
                        text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text:
                          "By Clicking Pay Now you agree that you have read and understood ",
                      style: GoogleFonts.redHatDisplay(
                          color: textfieldgrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    TextSpan(
                      text: "our Terms and Conditions",
                      style: GoogleFonts.redHatDisplay(
                          color: primarycolor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          fontSize: 11),
                    ),
                  ],
                )))
              ],
            ),
            SizedBox(height: height * 0.2),
          ],
        )),
        buildBottomButton(context, height, width, () {
          if (controller.isChecked.value) {
            if (Get.arguments[0] == Routes.CHOOSEPACKAGE) {
              Get.toNamed(Routes.BOOKINGCONFIRMATION, arguments: [
                Routes.CHOOSEPACKAGE,
                controller.activity,
                Get.arguments[2],
                Get.arguments[3],
              ]);
            } else {
              Get.toNamed(Routes.BOOKINGCONFIRMATION, arguments: [
                Routes.CART,
                controller.activity,
                Get.arguments[2]
              ]);
            }
          } else if (controller.carddetailsList.isEmpty) {
            Get.snackbar("Error", "Please add a payment method",
                snackPosition: SnackPosition.BOTTOM);
          } else {
            Get.snackbar("Error", "Please agree to the terms and conditions",
                snackPosition: SnackPosition.BOTTOM);
          }
        })
      ],
    );
  }
}
