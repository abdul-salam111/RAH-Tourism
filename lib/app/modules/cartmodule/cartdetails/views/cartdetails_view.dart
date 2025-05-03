import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/appExtensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/cartdetails_controller.dart';

class CartdetailsView extends GetView<CartdetailsController> {
  const CartdetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: screenpad,
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          appbar(
              "${controller.activity.activity!.name.toString().substring(0, 15)}..."
                  .tr,
              width * 0.1),
          context.heightbox(context.height * 0.02),
          Container(
            padding: defaultpad,
            decoration:
                BoxDecoration(color: whitecolor, borderRadius: radius20),
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
                ClipRRect(
                  borderRadius: radius10,
                  child: Hero(
                    tag: controller.activity.activity!.id.toString(),
                    child: CachedNetworkImage(
                      imageUrl: controller.activity.activity!.imageUrl!,
                      fit: BoxFit.cover,
                      height: height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                ),
                context.heightbox(context.height * 0.02),
                Row(
                  children: [
                    cardTitle(
                        width * 0.6, controller.activity.activity!.name, 2,
                        fontsize: 14.0),
                    const Spacer(),
                    locationwidget("DUBAI, UAE"),
                  ],
                ),
                heightbox5,
                rating(5, 3),
                context.heightbox(context.height * 0.02),
                _infoRow("Date:", controller.activity.date!, Iconsax.calendar),
                const Divider(color: greyColor),
                _infoRow(
                    "Duration:",
                    "${(int.parse(controller.activity.activity!.duration!) > 12) ? {
                        ("${controller.activity.activity!.duration!} Days".tr)
                      } : ("${controller.activity.activity!.duration!} Hours")}",
                    Iconsax.clock),
                const Divider(color: greyColor),
                _infoRow(
                    "Persons:",
                    "${int.parse(controller.activity.adults!) != 0 ? "${controller.activity.adults} ${"Adults".tr}" : ""}, ${int.parse(controller.activity.childs!) != 0 ? "${int.parse(controller.activity.childs!)} ${"Childs".tr}" : ""}, ${int.parse(controller.activity.infants!) != 0 ? "${int.parse(controller.activity.infants!)} Infants" : ""}",
                    Iconsax.people),
                const Divider(color: greyColor),
                _infoRow(
                    "Cancellation Before:",
                    "${controller.activity.activity!.cancellationDuration} Hours",
                    Iconsax.close_circle),
                const Divider(color: greyColor),
              ],
            ),
          ),
          const Spacer(),
          _costSummary(width, height, controller.activity.totalPrice,
              controller.activity),
          context.heightbox(context.height * 0.02),
        ],
      ),
    ));
  }
}

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
Widget _costSummary(double width, double height, totalPrice,
    GetCartDataModel getcartmodeldata) {
  return Container(
    decoration: BoxDecoration(
      color: whitecolor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: mainbetween,
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
                  arguments: [Routes.CART, getcartmodeldata]);
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
