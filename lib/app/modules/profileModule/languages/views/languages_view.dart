import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/languages_controller.dart';

class LanguagesView extends GetView<LanguagesController> {
  const LanguagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: screenpad,
        children: [
          appbar("Language".tr, size.width * 0.1),
          SizedBox(
            height: (size.height * 0.02),
          ),
          // Language Selection with Radio Buttons and Icons
          Obx(
            () => Column(
              children: controller.languages.map((language) {
                return Padding(
                    padding: defaultpad,
                    child: Container(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(
                          Iconsax.global, // Icon on the left side
                          color: primarycolor,
                        ),
                        title: Text(
                          language,
                          style: GoogleFonts.redHatDisplay(
                            color: language == controller.selectedLanguage.value
                                ? primarycolor
                                : textfieldgrey,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Radio<String>(
                          value: language,
                          groupValue: controller.selectedLanguage.value,
                          activeColor: primarycolor,
                          onChanged: (value) {
                            controller.selectLanguage(value!);
                          },
                        ),
                      ),
                    ));
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
