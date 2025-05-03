// ignore_for_file: deprecated_member_use
import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:bookdubaisafari/app/res/paddings.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';

import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: screenpad,
        children: [
          appbar("SETTINGS".tr, size.width * 0.1),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SettingOption(
                  icon: Iconsax.global,
                  label: "Language".tr,
                  onTap: () => Get.toNamed(Routes.LANGUAGES),
                ),
                heightbox10,
                SettingOption(
                  icon: Iconsax.notification,
                  label: "Notifications".tr,
                  onTap: () => Get.toNamed(Routes.NOTIFICATIOSETTINGS),
                ),
                heightbox10,
                SettingOption(
                  icon: Iconsax.card,
                  label: "Payment Method Settings".tr,
                  onTap: () => Get.toNamed(Routes.ADDNEWPAYMENT),
                ),
                heightbox10,
                SettingOption(
                  icon: Iconsax.lock_1,
                  label: "Security".tr,
                  onTap: () => Get.toNamed(Routes.SECURITYPAGE),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SettingOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: size.height * 0.07,
        padding: defaultpad,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: primarycolor),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.redHatDisplay(
                color: textfieldgrey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Iconsax.arrow_right_14, color: textfieldgrey),
          ],
        ),
      ),
    );
  }
}
