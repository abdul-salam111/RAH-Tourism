import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/notificatiosettings_controller.dart';

class NotificatiosettingsView extends GetView<NotificatiosettingsController> {
  const NotificatiosettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
      child: ListView(
        children: [
          SizedBox(
            height: (height * 0.01),
          ),
          Row(
            children: [
              backButton(color: textfieldgrey),
              const Spacer(),
              Text(
                'NOTIFICATIONS SETTINGS'.tr,
                style: GoogleFonts.redHatDisplay(
                    fontWeight: FontWeight.bold,
                    color: blackcolor,
                    fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: (height * 0.03),
          ),
          Text(
            "Special for you".tr,
            style: GoogleFonts.redHatDisplay(
                color: primarycolor, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: defaultpad,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "You can never have too much of limited-time discount, exclusive offers, tips and info new feature.".tr,
                  style: GoogleFonts.redHatDisplay(color: blackcolor),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Email Toggle
                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email".tr,
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textfieldgrey,
                          ),
                        ),
                        Transform.scale(
                          scale:
                              0.8, // Adjust this value for desired size (default is 1.0)
                          child: Switch(
                            value: controller.isEmailEnabled.value,
                            onChanged: (value) => controller.toggleEmail(),
                            activeColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Push Notifications Toggle
                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Push Notifications".tr,
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textfieldgrey,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: controller.isPushEnabled.value,
                            onChanged: (value) => controller.togglePush(),
                            activeColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: (height * 0.03),
          ),
          Text(
            "Reminder".tr,
            style: GoogleFonts.redHatDisplay(
                color: primarycolor, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: defaultpad,
            decoration: BoxDecoration(
              color: whitecolor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "Get inportant travel news and info, payment reminders, check-in reminder and more.".tr,
                  style: GoogleFonts.redHatDisplay(color: blackcolor),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Email Toggle
                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email".tr,
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textfieldgrey,
                          ),
                        ),
                        Transform.scale(
                          scale:
                              0.8, // Adjust this value for desired size (default is 1.0)
                          child: Switch(
                            value: controller.isEmailEnabled.value,
                            onChanged: (value) => controller.toggleEmail(),
                            activeColor: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Push Notifications Toggle
                Obx(
                  () => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Push Notifications".tr,
                          style: GoogleFonts.redHatDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: textfieldgrey,
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: Switch(
                            value: controller.isPushEnabled.value,
                            onChanged: (value) => controller.togglePush(),
                            activeColor: Colors.orange,
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
    ));
  }
}
