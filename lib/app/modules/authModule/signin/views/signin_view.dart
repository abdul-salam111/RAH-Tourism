import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../../../../res/exports.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/exports.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  SigninView({super.key});
  final GlobalKey<FormState> signinformKey = GlobalKey<FormState>();
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
            padding: const EdgeInsets.all(5),
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
                      title: welcomeBackTitle,
                      subtitle: welcomeBackSubtitle,
                    ),
                    Form(
                      key: signinformKey,
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          CustomTextField(
                            label: email,
                            hintText: emailHint,
                            controller: controller.emailController.value,
                            prefixIcon: Iconsax.sms,
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
                          Obx(() => CustomTextField(
                                label: passwordLabel,
                                hintText: passwordHint,
                                controller: controller.passwordController.value,
                                prefixIcon: Iconsax.lock,
                                obscureText: controller.isObsecure.value,
                                suffixIcon: GestureDetector(
                                  onTap: () => controller.isObsecure.toggle(),
                                  child: controller.isObsecure.value
                                      ? const Icon(
                                          Iconsax.eye,
                                          color: primarycolor,
                                        )
                                      : const Icon(
                                          Iconsax.eye_slash,
                                          color: primarycolor,
                                        ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return passwordError;
                                  }
                                  return value.length >= 8
                                      ? null
                                      : passwordLengthError;
                                },
                              )),
                          _RememberMeSection(controller: controller),
                          SizedBox(height: height * 0.03),
                          Center(
                            child: CustomButton(
                              width: width * 0.9,
                              text: signin,
                              onPressed: () {
                                if (signinformKey.currentState!.validate()) {
                                  controller.signin();
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
                                Get.toNamed(Routes.SIGNUP);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: notregister,
                                  style: style(
                                    color:
                                        authtextfieldborder, // Color for the first part
                                    fontSize: 18, // Font size
                                  ),
                                  children: [
                                    TextSpan(
                                      text: signup,
                                      style: style(
                                        color:
                                            primarycolor, // Highlighted color
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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

class _RememberMeSection extends StatelessWidget {
  final SigninController controller;
  const _RememberMeSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() => Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: primarycolor,
              value: controller.isRemembered.value,
              onChanged: (value) => controller.toggleRememberMe(),
            )),
        Text(
          remember,
          style: style(
            color: authtextfieldborder,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.FORGETPASSWORD);
          },
          child: Text(
            forgotPassword,
            style: style(
                fontSize: 14, color: primarycolor, fontWeight: FontWeight.w800),
          ),
        )
      ],
    );
  }
}
