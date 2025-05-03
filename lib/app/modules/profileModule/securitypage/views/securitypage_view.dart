import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/securitypage_controller.dart';

class SecuritypageView extends GetView<SecuritypageController> {
  const SecuritypageView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: screenpad,
        children: [
          appbar("SECURITY SETTINGS".tr, size.width * 0.1),
          SizedBox(height: size.height * 0.02),
          _buildSectionTitle('Password Management'.tr),
          SizedBox(height: size.height * 0.01),
          _buildChangePasswordTile(),
          SizedBox(height: size.height * 0.02),
          _buildSectionTitle('Delete Account'.tr),
          SizedBox(height: size.height * 0.01),
          _buildDeleteAccountTile(),
        ],
      ),
    );
  }

  // Section title with style
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.redHatDisplay(
        color: primarycolor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Tile for changing password
  Widget _buildChangePasswordTile() {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.CHANGEPASSWORD),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'Change Password'.tr,
              style: GoogleFonts.redHatDisplay(
                color: textfieldgrey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              Iconsax.arrow_right,
              color: textfieldgrey,
            ),
          ],
        ),
      ),
    );
  }

  // Tile for deleting account
  Widget _buildDeleteAccountTile() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.DELETEACCOUNT);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'Delete Account'.tr,
              style: GoogleFonts.redHatDisplay(
                color: textfieldgrey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(
              Iconsax.arrow_right,
              color: textfieldgrey,
            ),
          ],
        ),
      ),
    );
  }
}
