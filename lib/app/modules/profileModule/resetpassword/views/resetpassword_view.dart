import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
        child: ListView(
          children: [
            Row(
              children: [
                backButton(color: textfieldgrey),
                const Spacer(),
                Text(
                  'RESET PASSWORD',
                  style: GoogleFonts.redHatDisplay(
                    fontWeight: FontWeight.bold,
                    color: blackcolor,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(height: height * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Reset Password",
                  style: GoogleFonts.redHatDisplay(
                    color: primarycolor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "At least 8 characters, with uppercase and lowercase letters.",
                  style: GoogleFonts.redHatDisplay(
                    color: textfieldgrey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: height * 0.02),
                Obx(() => CustomTextField(
                      label: passwordLabel,
                      hintText: "************",
                      controller: controller.lastpasswordcontroler.value,
                      prefixIcon: Icons.lock_outline,
                      obscureText: controller.isObsecure.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isObsecure.toggle(),
                        child: controller.isObsecure.value
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: primarycolor,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: primarycolor,
                              ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return value.length >= 8
                            ? null
                            : 'Password must be at least 8 characters long';
                      },
                    )),
                SizedBox(height: height * 0.03),
                const LabelText(label: 'New Password'),
                SizedBox(height: height * 0.01),
                Obx(() => CustomTextField(
                      label: passwordLabel,
                      hintText: "************",
                      controller: controller.newpasswordcontroler.value,
                      prefixIcon: Icons.lock_outline,
                      obscureText: controller.isObsecure.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isObsecure.toggle(),
                        child: controller.isObsecure.value
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: primarycolor,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: primarycolor,
                              ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return value.length >= 8
                            ? null
                            : 'Password must be at least 8 characters long';
                      },
                    )),
                const SizedBox(height: 10),
                const LabelText(label: 'Confirm Password'),
                SizedBox(height: height * 0.01),
                Obx(() => CustomTextField(
                      label: passwordLabel,
                      hintText: "************",
                      controller: controller.confirmpasswordcontroler.value,
                      prefixIcon: Icons.lock_outline,
                      obscureText: controller.isObsecure.value,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.isObsecure.toggle(),
                        child: controller.isObsecure.value
                            ? const Icon(
                                Icons.visibility_outlined,
                                color: primarycolor,
                              )
                            : const Icon(
                                Icons.visibility_off_outlined,
                                color: primarycolor,
                              ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return value.length >= 8
                            ? null
                            : 'Password must be at least 8 characters long';
                      },
                    )),
                SizedBox(height: height * 0.1),
                CustomButton(
                  text: "Save",
                  onPressed: () {
                    Get.dialog(
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Container(
                            width: double.infinity,
                            height: height * 0.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: whitecolor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(height: height * 0.06),
                                  Image.asset(
                                    "assets/icons/done.png",
                                    width: width * 0.4,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Password Changed",
                                    style: GoogleFonts.redHatDisplay(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: blackcolor,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Your password has been changed successfully!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.redHatDisplay(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: textfieldgrey,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, right: 16, bottom: 7),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: height * 0.06,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: primarycolor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Text(
                                              "Done",
                                              style: GoogleFonts.redHatDisplay(
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w700,
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
                          ),
                        ),
                      ),
                    );
                  },
                  height: height * 0.07,
                  width: double.infinity,
                ),
                SizedBox(height: height * 0.03),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
