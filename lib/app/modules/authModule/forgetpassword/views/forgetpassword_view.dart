import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  ForgetpasswordView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: pad14,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: crosstart,
                children: [
                  SizedBox(height: screenHeight * 0.02),
                  const HeaderText(
                    title: forgetpassword,
                    subtitle: enteremail,
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        CustomTextField(
                          label: emailLabel,
                          hintText: emailHint,
                          controller: controller.emailController.value,
                          prefixIcon: Iconsax.sms,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return emailError;
                            }
                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                            return emailRegex.hasMatch(value)
                                ? null
                                : emailInvalidError;
                          },
                        ),
                        SizedBox(height: screenHeight * 0.08),
                        Center(
                          child: CustomButton(
                            width: context.width,
                            text: continuebutton,
                            onPressed: () {
                              Get.toNamed(Routes.VERIFICATIONSCREEN);
                            },
                            height: screenHeight * 0.06,
                            radius: 10,
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
    );
  }
}
