import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/activitycardWidgets/divder.dart';
import 'package:bookdubaisafari/app/widgets/activitycardWidgets/pricetag.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../../../../widgets/exports.dart';
import '../../../homeModule/activitydetails/views/activitydetails_view.dart';
import '../controllers/bookingconfirmation_controller.dart';

class BookingconfirmationView extends GetView<BookingconfirmationController> {
  const BookingconfirmationView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Widget sizedbox002 = SizedBox(
      height: (size.height * 0.02),
    );
    const pad20leftright = EdgeInsets.only(left: 20, right: 20);
    Widget cardheading(text) {
      return Text(
        text,
        style: style(
            color: textfieldgrey, fontSize: 12, fontWeight: FontWeight.w600),
      );
    }

    Widget cardInfo(text) {
      return Text(
        text,
        style: style(
            color: blackcolor, fontSize: 14, fontWeight: FontWeight.normal),
      );
    }

    final textfieldstyle = style(color: const Color(0xffA4A0B6), fontSize: 13);
    Widget cardsuperheading(text) => Text(
          text,
          style: style(
            fontWeight: FontWeight.bold,
            color: primarycolor,
            fontSize: 12,
          ),
        );
    final borders = OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1.5),
      borderRadius: radius10,
    );

    return Obx(
      () => OverlayLoaderWithAppIcon(
        isLoading: controller.isLoading.value,
        overlayBackgroundColor: blackcolor,
        circularProgressColor: primarycolor,
        appIcon: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        child: Stack(
          alignment: bottomcenter,
          children: [
            Scaffold(
                body: ListView(
              padding: screenpad,
              children: [
                appbar(bookingconfirmation, size.width * 0.03),
                sizedbox002,
                Container(
                  padding: defaultpad,
                  decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: radius10,
                  ),
                  child: Row(
                    crossAxisAlignment: crosstart,
                    children: [
                      ClipRRect(
                        borderRadius: radius10,
                        child: CachedNetworkImage(
                          imageUrl: controller.activity.imageUrl!,
                          width: size.width * 0.4,
                          height: size.height * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),
                      widthbox10,
                      Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          heightbox7,
                          locationwidget("DUBAI, UAE"),
                          heightbox5,
                          cardTitle(
                              size.width * 0.45, controller.activity.name, 2),
                          rating(controller.activity.averageRating,
                              controller.activity.numberOfReviews),
                          customdivider(size.width * 0.45),
                          Row(
                            children: [
                              Text(
                                "Per Person",
                                style: style(color: primarycolor),
                              ),
                              SizedBox(
                                width: context.width * 0.02,
                              ),
                              pricetag(controller
                                  .activity.packages!.first.adultPrice!),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                heightbox10,
                cardsuperheading(yourbooking),
                Container(
                  padding: pad14,
                  decoration:
                      BoxDecoration(color: whitecolor, borderRadius: radius10),
                  child: Column(
                    crossAxisAlignment: crosstart,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              cardheading("Date"),
                              heightbox3,
                              controller.paymentFlow == Routes.CHOOSEPACKAGE
                                  ? Obx(
                                      () => cardInfo(controller
                                          .packagecontroller.selectedDate.value
                                          .toString()),
                                    )
                                  : cardInfo(controller.getCartDataModel.date)
                            ],
                          ),
                          const Spacer(),
                          controller.paymentFlow == Routes.CHOOSEPACKAGE
                              ? GestureDetector(
                                  onTap: () {
                                    controller.isEditDate.value =
                                        !controller.isEditDate.value;
                                  },
                                  child: Obx(() => Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: greyColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                          controller.isEditDate.value
                                              ? Iconsax.tick_square
                                              : Iconsax.edit,
                                          color: whitecolor,
                                          size: 20,
                                        ),
                                      )),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                      Obx(() => controller.isEditDate.value
                          ? heightbox10
                          : const SizedBox.shrink()),
                      Obx(
                        () => controller.isEditDate.value
                            ? TextFormField(
                                controller: TextEditingController(
                                    text: controller
                                        .packagecontroller.selectedDate.value),
                                readOnly: true,
                                style: textfieldstyle,
                                decoration: InputDecoration(
                                  hintText: "mm/dd/yyyy",
                                  hintStyle: textfieldstyle,
                                  focusedBorder: borders,
                                  enabledBorder: borders,
                                  suffixIcon: const Icon(
                                    Iconsax.calendar,
                                    color: Color(0xffA4A0B6),
                                    size: 16,
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, top: 17, bottom: 20),
                                ),
                                onTap: () => controller.packagecontroller
                                    .selectDate(context),
                              )
                            : const SizedBox.shrink(),
                      ),
                      const Divider(
                        color: greyColor,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              cardheading(
                                "Guest",
                              ),
                              heightbox3,
                              controller.paymentFlow == Routes.CHOOSEPACKAGE
                                  ? Obx(() => cardInfo(
                                      "${controller.packagecontroller.selectedAdults.value != 0 ? "${controller.packagecontroller.selectedAdults.value} Adults" : ""}, ${controller.packagecontroller.selectedChilds.value != 0 ? "${controller.packagecontroller.selectedChilds.value} Childs" : ""}, ${controller.packagecontroller.selectedInfants.value != 0 ? "${controller.packagecontroller.selectedInfants.value} Infants" : ""}"))
                                  : cardInfo(
                                      "${int.parse(controller.getCartDataModel.adults!) != 0 ? "${controller.getCartDataModel.adults!} Adults" : ""}, ${int.parse(controller.getCartDataModel.childs!) != 0 ? "${controller.getCartDataModel.childs!} Childs" : ""}, ${int.parse(controller.getCartDataModel.infants!) != 0 ? "${controller.getCartDataModel.infants!} Infants" : ""}"),
                              Obx(
                                () => controller.isEditGuest.value
                                    ? SizedBox(
                                        height: size.height * 0.25,
                                        width: size.width * 0.7,
                                        child: Column(
                                          children: [
                                            Obx(
                                              () => QuantitySelector(
                                                label: "Adult",
                                                price: controller
                                                    .packagecontroller
                                                    .adultprice
                                                    .value,
                                                selectedQuantity: controller
                                                    .packagecontroller
                                                    .selectedAdults,
                                                onCalculateTotal: () {
                                                  controller.packagecontroller
                                                      .calculateTotal();
                                                },
                                                height: size.height *
                                                    0.06, // Adjust as needed
                                                width: size.width *
                                                    0.08, // Adjust as needed
                                              ),
                                            ),
                                            heightbox10,
                                            Obx(
                                              () => QuantitySelector(
                                                label: "Child",
                                                price: controller
                                                    .packagecontroller
                                                    .childprice
                                                    .value,
                                                selectedQuantity: controller
                                                    .packagecontroller
                                                    .selectedChilds,
                                                onCalculateTotal: () {
                                                  controller.packagecontroller
                                                      .calculateTotal();
                                                },
                                                height: size.height *
                                                    0.06, // Adjust as needed
                                                width: size.width *
                                                    0.08, // Adjust as needed
                                              ),
                                            ),
                                            heightbox10,
                                            Obx(
                                              () => QuantitySelector(
                                                label: "Infants",
                                                price: controller
                                                    .packagecontroller
                                                    .infantprice
                                                    .value,
                                                selectedQuantity: controller
                                                    .packagecontroller
                                                    .selectedInfants,
                                                onCalculateTotal: () {
                                                  controller.packagecontroller
                                                      .calculateTotal();
                                                },
                                                height: size.height *
                                                    0.06, // Adjust as needed
                                                width: size.width *
                                                    0.08, // Adjust as needed
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              )
                            ],
                          ),
                          const Spacer(),
                          controller.paymentFlow == Routes.CHOOSEPACKAGE
                              ? GestureDetector(
                                  onTap: () {
                                    controller.isEditGuest.value =
                                        !controller.isEditGuest.value;
                                  },
                                  child: Obx(() => Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            color: greyColor,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                          controller.isEditGuest.value
                                              ? Iconsax.tick_square
                                              : Iconsax.edit,
                                          color: whitecolor,
                                          size: 20,
                                        ),
                                      )),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    ],
                  ),
                ),
                heightbox10,
                cardsuperheading('Pickup Location'),
                Container(
                  padding: pad12,
                  decoration:
                      BoxDecoration(borderRadius: radius10, color: whitecolor),
                  child: Row(
                    crossAxisAlignment: crosstart,
                    children: [
                      Column(
                        mainAxisAlignment: mainstart,
                        crossAxisAlignment: crosstart,
                        children: [
                          cardheading("Your location"),
                          heightbox5,
                          Obx(
                            () => SizedBox(
                              width: size.width * 0.7,
                              child: Text(
                                controller.bookinginformationController
                                    .pickupLocation.value.text,
                                style: style(
                                    color: blackcolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Obx(() => controller.isEditlocation.value
                              ? SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    controller: controller
                                        .bookinginformationController
                                        .pickupLocation
                                        .value,
                                    style: style(
                                        color: Colors.black, fontSize: 13),
                                    decoration: InputDecoration(
                                      hintText: "Enter your location here...",
                                      hintStyle: style(
                                          color: Colors.grey, fontSize: 13),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primarycolor, width: 2),
                                        borderRadius: radius10,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: authtextfieldborder,
                                            width: 2),
                                        borderRadius: radius10,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 12),
                                      fillColor: whitecolor,
                                      filled: true,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink())
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.isEditlocation.value =
                              !controller.isEditlocation.value;
                        },
                        child: Obx(() => Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                controller.isEditlocation.value
                                    ? Iconsax.tick_square
                                    : Iconsax.edit,
                                color: whitecolor,
                                size: 20,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                heightbox10,
                cardsuperheading('Note'),
                Container(
                  padding: pad12,
                  decoration:
                      BoxDecoration(borderRadius: radius10, color: whitecolor),
                  child: Row(
                    crossAxisAlignment: crosstart,
                    children: [
                      Column(
                        mainAxisAlignment: mainstart,
                        crossAxisAlignment: crosstart,
                        children: [
                          cardheading("Your Note"),
                          heightbox5,
                          Obx(
                            () => SizedBox(
                              width: size.width * 0.7,
                              child: Text(
                                controller.bookinginformationController
                                    .noteController.value.text,
                                style: style(
                                    color: blackcolor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                          Obx(() => controller.isEditNote.value
                              ? SizedBox(
                                  width: size.width * 0.7,
                                  child: TextFormField(
                                    controller: controller
                                        .bookinginformationController
                                        .noteController
                                        .value,
                                    style: style(
                                        color: Colors.black, fontSize: 13),
                                    decoration: InputDecoration(
                                      hintText: "Enter your note here...",
                                      hintStyle: style(
                                          color: Colors.grey, fontSize: 13),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: primarycolor, width: 2),
                                        borderRadius: radius10,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: authtextfieldborder,
                                            width: 2),
                                        borderRadius: radius10,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 12),
                                      fillColor: whitecolor,
                                      filled: true,
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink())
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.isEditNote.value =
                              !controller.isEditNote.value;
                          controller.update();
                        },
                        child: Obx(() => Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: greyColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Icon(
                                controller.isEditNote.value
                                    ? Iconsax.tick_square
                                    : Iconsax.edit,
                                color: whitecolor,
                                size: 20,
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                heightbox10,
                controller.paymentFlow == Routes.CHOOSEPACKAGE
                    ? cardsuperheading('Payment Information')
                    : const SizedBox.shrink(),
                controller.paymentFlow == Routes.CHOOSEPACKAGE
                    ? Container(
                        padding: pad14,
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: radius10,
                        ),
                        child: Column(
                          crossAxisAlignment: crosstart,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    cardheading("Per Person Cost"),
                                    heightbox3,
                                    Obx(() => cardInfo(
                                        "AED ${controller.packagecontroller.adultprice.value} X ${controller.packagecontroller.selectedAdults.value} = AED ${(controller.packagecontroller.adultprice.value * controller.packagecontroller.selectedAdults.value)}")),
                                  ],
                                ),
                              ],
                            ),
                            heightbox10,
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    cardheading("Per Child Cost"),
                                    heightbox3,
                                    Obx(() => cardInfo(
                                        "AED ${controller.packagecontroller.childprice.value} X ${controller.packagecontroller.selectedChilds.value} = AED ${(controller.packagecontroller.childprice.value * controller.packagecontroller.selectedChilds.value)} ")),
                                  ],
                                ),
                              ],
                            ),
                            const Divider(
                              color: greyColor,
                            ),
                            Row(
                              mainAxisAlignment: mainbetween,
                              children: [
                                cardheading("Total Cost"),
                                Obx(
                                  () => Text(
                                    'AED ${controller.packagecontroller.totalprice.value}',
                                    style: style(
                                      fontWeight: FontWeight.bold,
                                      color: primarycolor,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        padding: pad14,
                        decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: radius10,
                        ),
                        child: Row(
                          mainAxisAlignment: mainbetween,
                          children: [
                            cardheading("Total Cost"),
                            Text(
                              'AED ${controller.getCartDataModel.totalPrice}',
                              style: style(
                                fontWeight: FontWeight.bold,
                                color: primarycolor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                SizedBox(
                  height: (size.height * 0.1),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 7),
              child: GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightbox10,
                            Text(
                              'Cancellation Policy',
                              style: GoogleFonts.redHatDisplay(
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .orange, // Replace with your primary color
                                fontSize: 14,
                              ),
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
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Booking Rules',
                              style: GoogleFonts.redHatDisplay(
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .orange, // Replace with your primary color
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.all(
                                  16), // Replace with your default padding
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: const Column(
                                children: [
                                  Bullets(
                                    text:
                                        "A deposit or full payment is needed to secure your booking.",
                                  ),
                                  Bullets(
                                    text:
                                        "Bookings are confirmed once payment is received.",
                                  ),
                                  Bullets(
                                    text:
                                        "Cancellations made 30+ days before the tour receive a refund.",
                                  ),
                                  Bullets(
                                    text:
                                        "Changes or cancellations within 15-30 days may incur fees.",
                                  ),
                                  Bullets(
                                    text:
                                        "No refunds for cancellations within 15 days of the tour.",
                                  ),
                                  Bullets(
                                    text:
                                        "Availability is subject to confirmation and may change.",
                                  ),
                                  Bullets(
                                    text:
                                        "The agency reserves the right to cancel or reschedule tours.",
                                  ),
                                ],
                              ),
                            ),
                            heightbox10,
                            Row(
                              children: [
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      controller.isChecked.value =
                                          !controller.isChecked.value;
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: controller.isChecked.value
                                            ? Colors
                                                .orange // Replace with your primary color
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: Colors
                                              .orange, // Replace with your primary color
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
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 14),
                                      children: [
                                        TextSpan(
                                          text:
                                              "By Clicking Pay Now you agree that you have read and understood ",
                                          style: GoogleFonts.redHatDisplay(
                                            color: Colors
                                                .grey, // Replace with your text field grey color
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "our Terms and Conditions",
                                          style: GoogleFonts.redHatDisplay(
                                            color: Colors
                                                .orange, // Replace with your primary color
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            heightbox10,
                            heightbox10,
                            Center(
                              child: CustomButton(
                                text: "PAY NOW",
                                onPressed: () {
                                  Get.back();
                                  controller.makePayment(
                                      amount: controller.paymentFlow ==
                                              Routes.CHOOSEPACKAGE
                                          ? controller.packagecontroller
                                              .totalprice.value
                                          : double.parse(controller
                                              .getCartDataModel.totalPrice!));
                                },
                                color: primarycolor,
                                textcolor: whitecolor,
                                width: Get.context!.width * 0.9,
                                height: 45,
                              ),
                            ),
                            heightbox10,
                          ],
                        ),
                      ),
                    ),
                    isScrollControlled:
                        true, // Allow the bottom sheet to expand
                    enableDrag:
                        true, // Allow dragging to close the bottom sheet
                  );
                },
                child: Container(
                  height: size.height * 0.06,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primarycolor, // Adjust the color as needed
                    borderRadius: radius10, // Adjust the radius as needed
                  ),
                  child: Center(
                    child: Padding(
                      padding: pad20leftright,
                      child: Text(
                        "CONFIRM",
                        style: style(
                          color: Colors.white,
                          fontSize: 18.0, // Adjust the font size as needed
                          fontWeight: FontWeight
                              .w700, // Adjust the font weight as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantitySelector extends StatelessWidget {
  final String label;
  final double price;
  final RxInt selectedQuantity;
  final VoidCallback onCalculateTotal;
  final double height;
  final double width;

  const QuantitySelector({
    super.key,
    required this.label,
    required this.price,
    required this.selectedQuantity,
    required this.onCalculateTotal,
    this.height = 60.0,
    this.width = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: radius10,
        border: Border.all(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Text(
              "$label (AED $price)",
              style: style(
                color: Colors.grey[800],
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (label == "Child") {
                  if (selectedQuantity.value > 0) {
                    selectedQuantity.value--;
                    onCalculateTotal();
                  }
                }
                if (label == "Infants") {
                  if (selectedQuantity.value > 0) {
                    selectedQuantity.value--;
                    onCalculateTotal();
                  }
                }
                if (selectedQuantity.value > 1) {
                  selectedQuantity.value--;
                  onCalculateTotal();
                }
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: textfieldgrey),
                  borderRadius: radius5,
                ),
                child: const Icon(
                  Icons.remove,
                  color: textfieldgrey,
                  size: 20,
                ),
              ),
            ),
            Obx(
              () => SizedBox(
                width: width,
                child: Center(
                  child: Text(
                    selectedQuantity.value < 10
                        ? '0${selectedQuantity.value}'
                        : '${selectedQuantity.value}',
                    style: style(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                selectedQuantity.value++;
                onCalculateTotal();
              },
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  border: Border.all(color: textfieldgrey),
                  borderRadius: radius5,
                ),
                child: const Icon(
                  Icons.add,
                  color: textfieldgrey,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
