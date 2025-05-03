import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/bookingdetails_controller.dart';

class BookingdetailsView extends GetView<BookingdetailsController> {
  const BookingdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments[1];
    final size = MediaQuery.of(context).size;

    final sizebox002 = SizedBox(height: size.height * 0.02);
    final sizebox001 = SizedBox(height: size.height * 0.01);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: backButton(),
        backgroundColor: const Color(0xfff7f7f7),
        title: Text(
          "BOOKING DETAILS",
          style: style(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: const Color(0xff4e4e4e)),
        ),
      ),
      body: Padding(
        padding: screenpad,
        child: ListView(
          children: [
            sizebox002,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'btn$index',
                  child: ClipRRect(
                    borderRadius: radius10,
                    child: CachedNetworkImage(
                      imageUrl: controller.mybooking.orderItems!.first.package!
                          .activity!.imageUrl!,
                      fit: BoxFit.cover,
                      height: size.height * 0.25,
                      width: double.infinity,
                    ),
                  ),
                ),
                sizebox002,
                Row(
                  children: [
                    cardTitle(
                        size.width * 0.6, controller.mybooking.activityName, 2,
                        fontsize: 14.0),
                    const Spacer(),
                    locationwidget("DUBAI, UAE"),
                  ],
                ),
                heightbox5,
                Row(
                  children: [
                    rating(
                        controller.mybooking.orderItems!.first.package!
                            .activity!.averageRating!,
                        controller.mybooking.orderItems!.first.package!
                            .activity!.numberOfReviews!),
                    const SizedBox(width: 10),
                    Text("Order Id:",
                        style: style(
                            fontSize: 12,
                            color: textfieldgrey,
                            fontWeight: FontWeight.w500)),
                    widthbox5,
                    Text(controller.mybooking.referenceId!,
                        style: style(
                            fontSize: 12,
                            color: const Color(0xff4e4e4e),
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                heightbox10,
                Container(
                  padding: defaultpad,
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    color: const Color.fromARGB(255, 248, 248, 248),
                    borderRadius: radius10,
                  ),
                  child: Column(
                    children: [
                      sizebox002,
                      const Text("Booking Information",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4e4e4e),
                              fontWeight: FontWeight.w600)),
                      heightbox10,
                      InfoRow(
                        icon: Iconsax.user,
                        label: "Full Name",
                        value: controller.mybooking.firstName!,
                      ),
                      InfoRow(
                        icon: Iconsax.sms,
                        label: "Email",
                        value: controller.mybooking.email!,
                      ),
                      InfoRow(
                        icon: Iconsax.call,
                        label: "Mobile Number",
                        value: controller.mybooking.phone!,
                      ),
                      InfoRow(
                        icon: Iconsax.global,
                        label: "Country",
                        value: controller.mybooking.nationality!,
                      ),
                      InfoRow(
                        icon: Iconsax.calendar,
                        label: "Date",
                        value: DateFormat('yyyy-MM-dd')
                            .format(controller.mybooking.date!),
                      ),
                      InfoRow(
                        icon: Iconsax.people,
                        label: "Participants",
                        value:
                            "${int.parse(controller.mybooking.orderItems!.first.adult.toString()) != 0 ? "${controller.mybooking.orderItems!.first.adult.toString()} ${"Adults".tr}" : ""}, ${int.parse(controller.mybooking.orderItems!.first.child.toString()) != 0 ? "${int.parse(controller.mybooking.orderItems!.first.adult.toString())} ${"Childs".tr}" : ""}, ${int.parse(controller.mybooking.orderItems!.first.infant.toString()) != 0 ? "${int.parse(controller.mybooking.orderItems!.first.infant.toString())} Infants" : ""}",
                      ),
                    ],
                  ),
                ),
                sizebox001,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildButton(
                      size: size,
                      text: "Print Now",
                      icon: Iconsax.printer,
                      color: whitecolor,
                      textColor: primarycolor,
                      borderColor: primarycolor,
                    ),
                    _buildButton(
                      size: size,
                      text: "Download PDF",
                      icon: Iconsax.arrow_down,
                      color: primarycolor,
                      textColor: whitecolor,
                    ),
                  ],
                ),
                heightbox10,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required Size size,
    required String text,
    required IconData icon,
    required Color color,
    required Color textColor,
    Color? borderColor,
  }) {
    return GestureDetector(
      onTap: () async {
        final pdf = await controller.createPdf();
        final file = await controller.savePdf(pdf);
        await controller.openPdf(file);
      },
      child: Container(
        height: size.height * 0.07,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(7),
          border: borderColor != null ? Border.all(color: borderColor) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: textColor, size: 20),
            const SizedBox(width: 5),
            Text(
              text,
              style: style(
                  fontSize: 14, fontWeight: FontWeight.w700, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final Color labelColor;
  final Color valueColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double spacing;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor = primarycolor,
    this.labelColor = textfieldgrey,
    this.valueColor = blackcolor,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.w600,
    this.spacing = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
            SizedBox(width: spacing),
            Text(
              "$label:",
              style: style(color: labelColor),
            ),
            const Spacer(),
            Text(
              value,
              style: style(
                color: const Color(0xff4F545A),
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Divider(color: greyColor),
        heightbox5,
      ],
    );
  }
}
