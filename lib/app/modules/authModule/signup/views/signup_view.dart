import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({super.key});
  final GlobalKey<FormState> signupformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(authbg))),
      child: Obx(
        () => OverlayLoaderWithAppIcon(
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
            backgroundColor: transparent,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Column(
                  children: [
                    const HeaderText(
                      title: welcomeText,
                      subtitle: createAccountText,
                    ),
                    Form(
                      key: signupformKey,
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          CustomTextField(
                            label: "Full Name",
                            hintText: "Full Name",
                            controller: controller.fullnameController.value,
                            prefixIcon: Icons.person_outline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return entername;
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          CustomTextField(
                            label: emailLabel,
                            hintText: emailHintText,
                            controller: controller.emailController.value,
                            prefixIcon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return emailError;
                              }
                              final emailRegex =
                                  RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                              return emailRegex.hasMatch(value)
                                  ? null
                                  : emailInvalidError;
                            },
                          ),
                          SizedBox(height: height * 0.02),
                          Obx(
                            () => CustomTextField(
                              label: passwordLabel,
                              hintText: passwordHint,
                              controller: controller.passwordController.value,
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
                                  return enterpassword;
                                }
                                return value.length >= 8
                                    ? null
                                    : passwordLengthError;
                              },
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.SIGNIN);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: bysigining,
                                    style: style(
                                        color: authtextfieldborder,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12)),
                                TextSpan(
                                    text: termsandcondition,
                                    style: style(
                                        color: primarycolor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12)),
                                TextSpan(
                                    text: and,
                                    style: style(
                                        color: authtextfieldborder,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16)),
                                TextSpan(
                                    text: " Privacy Policy.",
                                    style: style(
                                        color: primarycolor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12))
                              ]))),
                          SizedBox(height: height * 0.04),
                          Center(
                            child: CustomButton(
                              width: width * 0.9,
                              text: registerbutton,
                              onPressed: () {
                                if (signupformKey.currentState!.validate()) {
                                  controller.signupUser(context);
                                }
                              },
                              height: height * 0.06,
                              radius: 10,
                            ),
                          ),
                          SizedBox(height: height * 0.05),
                          Center(
                            child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.SIGNIN);
                                },
                                child: RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: haveaccount,
                                      style: style(
                                          color: authtextfieldborder,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18)),
                                  TextSpan(
                                      text: signinbtn,
                                      style: style(
                                          color: primarycolor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ]))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
