import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../res/exports.dart';
import '../controllers/changepassword_controller.dart';

class ChangepasswordView extends GetView<ChangepasswordController> {
  const ChangepasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final heightbox002 = SizedBox(height: height * 0.02);
    return Scaffold(
      body: Padding(
        padding: screenpad,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            appbar("CHANGE PASSWORD", width * 0.1),
            heightbox002,
            _buildPasswordManagementSection(height),
          ],
        ),
      ),
    );
  }

  // Password management form section
  Widget _buildPasswordManagementSection(double height) {
    return Container(
      padding: pad14,
      decoration: BoxDecoration(
        color: whitecolor,
        borderRadius: radius10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle("Password Management"),
          heightbox10,
          _buildDescriptionText(
              "Please enter your current password, in order to change your password."),
          SizedBox(height: height * 0.02),
          _buildInputLabel("Current Password"),
          heightbox10,
          _buildEmailInputField(),
          SizedBox(height: height * 0.01),
          _buildSendCodeButton(height),
          SizedBox(height: height * 0.03),
        ],
      ),
    );
  }

  // Section Title (e.g., "Password Management")
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: style(
        color: primarycolor,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Description Text under the title
  Widget _buildDescriptionText(String description) {
    return Text(
      description,
      style: style(
        color: textfieldgrey,
        fontSize: 12,
      ),
    );
  }

  // Input Label for fields like "Email Address"
  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: style(
        color: blackcolor,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }

  // Email input field with the controller
  Widget _buildEmailInputField() {
    return TextFormField(
      controller: controller.emailController.value,
      style: GoogleFonts.poppins(color: blackcolor, fontSize: 13),
      decoration: InputDecoration(
        hintText: "Enter your current password",
        hintStyle: GoogleFonts.poppins(color: textfieldgrey, fontSize: 11),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primarycolor, width: 2),
          borderRadius: radius10,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greyColor),
          borderRadius: radius10,
        ),
        contentPadding: const EdgeInsets.only(left: 10),
      ),
    );
  }

  // Send Code Button
  Widget _buildSendCodeButton(double height) {
    return CustomButton(
      text: "Change Password",
      onPressed: () {
        Get.toNamed(Routes.OTPSCREEN);
      },
      height: height * 0.07,
      width: double.infinity,
    );
  }
}
