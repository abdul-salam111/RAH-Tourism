import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:pinput/pinput.dart';

import '../../../../res/exports.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/exports.dart';
import '../controllers/otpscreen_controller.dart';

class OtpscreenView extends GetView<OtpscreenController> {
  const OtpscreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const focusedBorderColor = primarycolor;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = textfieldgrey;

    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 22,
        color: textfieldgrey,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
    );
    return Obx(() => OverlayLoaderWithAppIcon(
          isLoading: controller.isloading.value,
          overlayBackgroundColor: blackcolor,
          circularProgressColor: primarycolor,
          appIcon: Padding(
            padding: pad5,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          child: Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              child: Column(
                children: [
                  SizedBox(height: height * 0.15),
                  Image.asset(
                    "assets/icons/lock.png",
                    height: height * 0.1,
                    width: height * 0.1,
                  ),
                  SizedBox(height: height * 0.03),
                  const HeaderText(
                    title: "Verification Code",
                    subtitle:
                        "Please, enter a 6 digit code, sent to your email.",
                  ),
                  SizedBox(height: height * 0.05),
                  Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        length: 6,
                        controller: controller.pinController,
                        focusNode: controller.focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(width: 8),
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (val) {
                          print("Entered PIN: $val"); // Debugging log
                          controller.verifyUser(val); // Call API directly
                        },
                        onSubmitted: (val) {
                          
                          print(
                              "Submitted PIN: $val"); // Log for additional callback
                        },
                        cursor: Column(
                          mainAxisAlignment: mainend,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 1,
                              color: focusedBorderColor,
                            ),
                          ],
                        ),
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  OtpTimerButton(
                    controller: controller.controller,
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        controller.controller.startTimer();
                      });
                    },
                    text: const Text(
                      'Resend OTP',
                      style: TextStyle(color: primarycolor),
                    ),
                    buttonType: ButtonType.outlined_button,
                    duration: 60,
                  ),
                  SizedBox(
                    height: (height * 0.06),
                  ),
                  CustomButton(
                    text: "Continue",
                    onPressed: () {
                      Get.toNamed(Routes.RESETPASSWORD);
                    },
                    height: height * 0.065,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: (height * 0.03),
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
