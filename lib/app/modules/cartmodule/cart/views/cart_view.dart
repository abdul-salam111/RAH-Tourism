// ignore_for_file: deprecated_member_use

import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../../res/exports.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = Get.put(CartController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // Common spacer
    final sizedbox002 = SizedBox(height: height * 0.02);

    return Scaffold(
      body: Obx(
        () => controller.activityList.isEmpty
            ? Center(
                child: Lottie.asset('lottiefile/emptycart.json'),
              )
            : controller.activityList.length == 1
                ? Padding(
                    padding: screenpad,
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        appbar("CART".tr, width * 0.1),
                        sizedbox002,
                        Obx(
                          () => controller.activityList.length == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Checkout your booking now'.tr,
                                      style: style(
                                        fontWeight: FontWeight.bold,
                                        color: primarycolor,
                                        fontSize: 16,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.deleteActivity(
                                            controller.activityList.first.id);
                                        controller.update();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primarycolor.withOpacity(0.1),
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: primarycolor),
                                        ),
                                        padding: defaultpad,
                                        child: const Icon(
                                          Iconsax.trash,
                                          color: primarycolor,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                        sizedbox002,
                        Obx(
                          () => controller.activityList.length == 1
                              ? Container(
                                  padding: defaultpad,
                                  decoration: BoxDecoration(
                                      color: whitecolor,
                                      borderRadius: radius20),
                                  child: Column(
                                    crossAxisAlignment: crosstart,
                                    children: [
                                      ClipRRect(
                                        borderRadius: radius10,
                                        child: CachedNetworkImage(
                                          imageUrl: controller.activityList
                                              .first.activity!.imageUrl!,
                                          fit: BoxFit.cover,
                                          height: height * 0.25,
                                          width: double.infinity,
                                        ),
                                      ),
                                      sizedbox002,
                                      Row(
                                        children: [
                                          cardTitle(
                                              width * 0.6,
                                              controller.activityList.first
                                                  .activity!.name,
                                              2,
                                              fontsize: 14.0),
                                          const Spacer(),
                                          locationwidget("DUBAI, UAE"),
                                        ],
                                      ),
                                      heightbox5,
                                      rating(5, 3),
                                      sizedbox002,
                                      _infoRow(
                                          "Date:",
                                          controller.activityList.first.date!,
                                          Iconsax.calendar),
                                      const Divider(color: greyColor),
                                      _infoRow(
                                          "Duration:",
                                          "${(int.parse(controller.activityList.first.activity!.duration!) > 12) ? {
                                              ("${controller.activityList.first.activity!.duration!} Days"
                                                  .tr)
                                            } : ("${controller.activityList.first.activity!.duration!} Hours")}",
                                          Iconsax.clock),
                                      const Divider(color: greyColor),
                                      _infoRow(
                                          "Persons:",
                                          "${int.parse(controller.activityList.first.adults!) != 0 ? "${controller.activityList.first.adults} ${"Adults".tr}" : ""}, ${int.parse(controller.activityList.first.childs!) != 0 ? "${int.parse(controller.activityList.first.childs!)} ${"Childs".tr}" : ""}, ${int.parse(controller.activityList.first.infants!) != 0 ? "${int.parse(controller.activityList.first.infants!)} Infants" : ""}",
                                          Iconsax.people),
                                      const Divider(color: greyColor),
                                      _infoRow(
                                          "Cancellation Before:",
                                          "${controller.activityList.first.activity!.cancellationDuration} Hours",
                                          Iconsax.close_circle),
                                      const Divider(color: greyColor),
                                    ],
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                        heightbox10,
                        Obx(
                          () => controller.activityList.length == 1
                              ? _costSummary(
                                  width,
                                  height,
                                  controller.activityList.first.totalPrice,
                                  cartcontroller)
                              : const SizedBox.shrink(),
                        ),
                        sizedbox002,
                      ],
                    ),
                  )
                : Padding(
                    padding: screenpad,
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        appbar("CART", width * 0.02),
                        sizedbox002,
                        Obx(
                          () => controller.activityList.length > 1
                              ? RichText(
                                  text: TextSpan(children: [
                                  TextSpan(
                                      text: "Click on button",
                                      style: style(
                                          color: primarycolor,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                      text: " View More",
                                      style: style(
                                          color: primarycolor,
                                          fontWeight: FontWeight.w800)),
                                  TextSpan(
                                      text: " For more details.",
                                      style: style(
                                          color: primarycolor,
                                          fontWeight: FontWeight.w600)),
                                ]))
                              : const SizedBox.shrink(),
                        ),
                        sizedbox002,
                        Obx(
                          () => controller.activityList.length > 1
                              ? Expanded(
                                  child: ListView.builder(
                                      padding: EdgeInsets.zero,
                                      itemCount: controller.activityList.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          padding: defaultpad,
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          decoration: BoxDecoration(
                                              color: whitecolor,
                                              borderRadius: radius10),
                                          child: Row(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              Hero(
                                                tag: controller
                                                    .activityList[index]
                                                    .activity!
                                                    .id
                                                    .toString(),
                                                child: Container(
                                                  width: width * 0.4,
                                                  height: height * 0.20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                          image:
                                                              CachedNetworkImageProvider(
                                                            controller
                                                                .activityList[
                                                                    index]
                                                                .activity!
                                                                .imageUrl!,
                                                          ),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ),
                                              widthbox10,
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0, right: 8),
                                                child: Column(
                                                  crossAxisAlignment: crosstart,
                                                  mainAxisAlignment:
                                                      mainbetween,
                                                  children: [
                                                    cardTitle(
                                                        width * 0.42,
                                                        controller
                                                            .activityList[index]
                                                            .activity!
                                                            .name,
                                                        2,
                                                        fontsize: 13.0),
                                                    widthbox5,
                                                    locationwidget(
                                                        "DUBAI, UAE"),
                                                    heightbox5,
                                                    rating(5, 5),
                                                    heightbox10,
                                                    Text(
                                                      "AED ${controller.activityList[index].totalPrice!}",
                                                      style: style(
                                                          fontSize: 15,
                                                          color: primarycolor,
                                                          fontWeight:
                                                              FontWeight.w900),
                                                    ),
                                                    heightbox5,
                                                    Container(
                                                      width: width * 0.4,
                                                      height: 1,
                                                      color: greyColor,
                                                    ),
                                                    heightbox5,
                                                    Row(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.toNamed(
                                                              Routes
                                                                  .CARTDETAILS,
                                                              arguments: controller
                                                                      .activityList[
                                                                  index],
                                                            );
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    primarycolor,
                                                                borderRadius:
                                                                    radius10),
                                                            child: Center(
                                                              child: Padding(
                                                                padding:
                                                                    defaultpad,
                                                                child: Text(
                                                                  "View More",
                                                                  style: style(
                                                                      color:
                                                                          whitecolor),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.1,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            controller.deleteActivity(
                                                                controller
                                                                    .activityList[
                                                                        index]
                                                                    .id);
                                                            controller.update();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: primarycolor
                                                                  .withOpacity(
                                                                      0.1),
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color:
                                                                      primarycolor),
                                                            ),
                                                            padding: defaultpad,
                                                            child: const Icon(
                                                              Iconsax.trash,
                                                              color:
                                                                  primarycolor,
                                                              size: 15,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              : const SizedBox.shrink(),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}

// Reusable Widget for Information Rows
Widget _infoRow(String label, String value, IconData icon) {
  return Row(
    children: [
      Icon(icon, color: primarycolor),
      widthbox5,
      Text(label.tr, style: style(color: textfieldgrey)),
      const Spacer(),
      Text(
        value,
        style: style(
          color: const Color(0xff4f545a),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

// Reusable Widget for Cost Summary Section
Widget _costSummary(
    double width, double height, totalPrice, CartController cartcontroller) {
  return Container(
    decoration: BoxDecoration(
      color: whitecolor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Cost".tr,
                style: style(
                  color: textfieldgrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "AED $totalPrice",
                style: style(
                  color: primarycolor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (sharedPrefbox.read(isLoggedin)) {
              Get.toNamed(Routes.ENTERBOOKINGINFORMATION,
                  arguments: [Routes.CART, cartcontroller.activityList[0]]);
            }
          },
          child: Container(
            height: height * 0.07,
            padding: defaultpad,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-4, 0),
                  blurRadius: 10,
                  spreadRadius: 0.5,
                ),
              ],
              color: primarycolor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Text(
                  "Checkout".tr,
                  style: style(
                    fontSize: 16,
                    color: whitecolor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: width * 0.16),
                rightarricon,
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

    //  Padding(
    //           padding: const EdgeInsets.only(left: 18, right: 18),
    //           child:
    //           ListView(
    //             children: [
    //               (height * 0.02).heightBox,
    //               Row(children: [
    //                 backButton(),
    //                 const Spacer(),
    //                 Text(
    //                   'CART',
    //                   style: GoogleFonts.redHatDisplay(
    //                       fontWeight: FontWeight.bold, color: blackcolor, fontSize: 18),
    //                 ),
    //                 WidthBox(width * 0.1),
    //                 const Spacer(),
    //               ]),
    //               (height * 0.02).heightBox,
    //               RichText(
    //                   text: TextSpan(children: [
    //                 TextSpan(
    //                     text: "Click on button",
    //                     style: GoogleFonts.redHatDisplay(
    //                         color: primarycolor, fontWeight: FontWeight.w600)),
    //                 TextSpan(
    //                     text: " View More",
    //                     style: GoogleFonts.redHatDisplay(
    //                         color: primarycolor, fontWeight: FontWeight.w800)),
    //                 TextSpan(
    //                     text: " For more details.",
    //                     style: GoogleFonts.redHatDisplay(
    //                         color: primarycolor, fontWeight: FontWeight.w600)),
    //               ])),
    //               (height * 0.02).heightBox,
    //               Row(
    //                 crossAxisAlignment: crosstart,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: Container(
    //                       width: width * 0.4,
    //                       height: height * 0.18,
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(10),
    //                           image: const DecorationImage(
    //                               image: AssetImage(
    //                                 "assets/images/1.jpg",
    //                               ),
    //                               fit: BoxFit.cover)),
    //                     ),
    //                   ),
    //                   10.widthBox,
    //                   Padding(
    //                     padding: const EdgeInsets.only(top: 8.0, right: 8),
    //                     child: Column(
    //                       crossAxisAlignment: crosstart,
    //                       mainAxisAlignment: mainbetween,
    //                       children: [
    //                         SizedBox(
    //                           width: width * 0.4,
    //                           child: Text(
    //                             "Dubai Half-Day City Tour ok how are your",
    //                             overflow: TextOverflow.ellipsis,
    //                             maxLines: 2,
    //                             style: GoogleFonts.redHatDisplay(
    //                               fontSize: 14,
    //                               color: blackcolor,
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                         ),
    //                         5.heightBox,
    //                         Row(
    //                           children: [
    //                             const Icon(
    //                               IconlyBold.location,
    //                               color: primarycolor,
    //                               size: 15,
    //                             ),
    //                             5.widthBox,
    //                             Text(
    //                               "DUBAI, UAE",
    //                               style: GoogleFonts.redHatDisplay(
    //                                   fontSize: 12,
    //                                   color: textfieldgrey,
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                           ],
    //                         ),
    //                         5.heightBox,
    //                         Row(
    //                           children: [
    //                             Row(
    //                               children: List.generate(5, (index) {
    //                                 return const Icon(
    //                                   Icons.star,
    //                                   color: primarycolor,
    //                                   size: 16,
    //                                 );
    //                               }),
    //                             ),
    //                             Text(
    //                               "(3 Reviews)",
    //                               style: GoogleFonts.redHatDisplay(
    //                                   fontSize: 10,
    //                                   color: blackcolor,
    //                                   fontWeight: FontWeight.w500),
    //                             ),
    //                           ],
    //                         ),
    //                         10.heightBox,
    //                         Text(
    //                           "AED 110.00",
    //                           style: GoogleFonts.redHatDisplay(
    //                               fontSize: 15,
    //                               color: primarycolor,
    //                               fontWeight: FontWeight.w900),
    //                         ),
    //                         10.heightBox,
    //                         Container(
    //                           width: width * 0.4,
    //                           height: 1,
    //                           color: greyColor,
    //                         )
    //                       ],
    //                     ),
    //                   )
    //                 ],
    //               ).box.white.roundedSM.make()
    //             ],
    //           ),
    //         )

