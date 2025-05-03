import 'package:bookdubaisafari/app/widgets/headerLable.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import 'package:pinput/pinput.dart';

import '../../../../res/exports.dart';
import '../controllers/verificationscreen_controller.dart';

class VerificationscreenView extends GetView<VerificationscreenController> {
  const VerificationscreenView({super.key});
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
                  SizedBox(height: height * 0.03),
                  const HeaderText(
                    title: verificationcode,
                    subtitle: entercode,
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
                          controller.verifyUser(val); // Call API directly
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
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
                    height: height * 0.06,
                  ),
                  OtpTimerButton(
                    controller: controller.controller,
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        controller.controller.startTimer();
                      });
                    },
                    text: const Text(
                      resendotp,
                      style: TextStyle(color: primarycolor),
                    ),
                    buttonType: ButtonType.outlined_button,
                    duration: 60,
                  ),
                ],
              ),
            ),
          )),
        ));
  }
}
