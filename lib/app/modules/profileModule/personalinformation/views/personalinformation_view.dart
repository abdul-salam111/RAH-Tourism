import 'dart:io';

import 'package:bookdubaisafari/app/data/getModels/getUserInfo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../../../../res/exports.dart';

import '../../../../utils/imagepicker.dart';
import '../../../../widgets/exports.dart';
import '../controllers/personalinformation_controller.dart';

class PersonalinformationView extends GetView<PersonalinformationController> {
  const PersonalinformationView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(PersonalinformationController());
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(() => OverlayLoaderWithAppIcon(
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
                  body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        backButton(),
                        const Spacer(),
                        Text(
                          'PERSONAL INFORMATION',
                          style: GoogleFonts.redHatDisplay(
                            fontWeight: FontWeight.bold,
                            color: blackcolor,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    SizedBox(
                      height: (height * 0.05),
                    ),
                    Container(
                      width: double.infinity,
                      padding: pad18,
                      decoration: BoxDecoration(
                          color: whitecolor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          Center(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Obx(
                                  () => ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        16.0), // Rounded Large equivalent
                                    child: (GetUserInfo.fromJson(sharedPrefbox
                                                        .read(userInformation))
                                                    .payload!
                                                    .profileImage ==
                                                null &&
                                            controller.selectImage.value ==
                                                null)
                                        ? Image.asset(
                                            "assets/images/1.jpg",
                                            fit: BoxFit.cover,
                                            width: width * 0.36,
                                            height: height * 0.15,
                                          )
                                        : controller.selectImage.value != null
                                            ? Obx(
                                                () => Image.file(
                                                  File(controller
                                                      .selectImage.value!.path),
                                                  fit: BoxFit.cover,
                                                  width: width * 0.36,
                                                  height: height * 0.15,
                                                ),
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: GetUserInfo.fromJson(
                                                        sharedPrefbox.read(
                                                            userInformation))
                                                    .payload!
                                                    .profileImage!,
                                                width: width * 0.36,
                                                height: height * 0.15,
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(
                                      5), 
                                  decoration: BoxDecoration(
                                    color: primarycolor,
                                    borderRadius: BorderRadius.circular(
                                        8.0), 
                                  ),
                                  child: GestureDetector(
                                    onTap: () async {
                                      var image = await Utils
                                          .pickImage();
                                      if (image != null) {
                                        controller.selectImage.value =
                                            image; 
                                      }
                                    },
                                    child: const Icon(
                                      Iconsax.edit,
                                      color: whitecolor,
                                      size: 18,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text("First Name",
                              style: GoogleFonts.redHatDisplay(
                                  color: blackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.firstName.value,
                            //  readOnly: true,

                            ///obscureText: obscureText,
                            style: GoogleFonts.poppins(
                                color: blackcolor, fontSize: 13),
                            decoration: InputDecoration(
                              hintText:
                                  "${GetUserInfo.fromJson(sharedPrefbox.read(userInformation)).payload!.firstName}",
                              hintStyle: GoogleFonts.poppins(
                                  color: textfieldgrey, fontSize: 11),
                              // prefixIcon: Padding(
                              //   padding: const EdgeInsets.all(12),
                              //   child: Icon(prefixIcon, color: primarycolor),
                              // ),
                              // suffixIcon: suffixIcon,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primarycolor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                            // validator: validator,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Last Name",
                              style: GoogleFonts.redHatDisplay(
                                  color: blackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.lastName.value,
                            //  readOnly: true,

                            ///obscureText: obscureText,
                            style: GoogleFonts.poppins(
                                color: blackcolor, fontSize: 13),
                            decoration: InputDecoration(
                              hintText:
                                  "${GetUserInfo.fromJson(sharedPrefbox.read(userInformation)).payload!.lastName}",
                              hintStyle: GoogleFonts.poppins(
                                  color: textfieldgrey, fontSize: 11),
                              // prefixIcon: Padding(
                              //   padding: const EdgeInsets.all(12),
                              //   child: Icon(prefixIcon, color: primarycolor),
                              // ),
                              // suffixIcon: suffixIcon,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primarycolor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                            // validator: validator,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Email Address",
                              style: GoogleFonts.redHatDisplay(
                                  color: blackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            //  controller: controller.emailController.value,
                            readOnly: true,

                            ///obscureText: obscureText,
                            style: GoogleFonts.poppins(
                                color: blackcolor, fontSize: 13),
                            decoration: InputDecoration(
                              hintText:
                                  "${GetUserInfo.fromJson(sharedPrefbox.read(userInformation)).payload!.email}",
                              hintStyle: GoogleFonts.poppins(
                                  color: textfieldgrey, fontSize: 11),
                              // prefixIcon: Padding(
                              //   padding: const EdgeInsets.all(12),
                              //   child: Icon(prefixIcon, color: primarycolor),
                              // ),
                              // suffixIcon: suffixIcon,
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primarycolor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                            // validator: validator,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("Phone Number",
                              style: GoogleFonts.redHatDisplay(
                                  color: blackcolor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            controller: controller.phoneController.value,
                            style: GoogleFonts.poppins(
                                color: blackcolor, fontSize: 13),
                            decoration: InputDecoration(
                              hintText:
                                  "${GetUserInfo.fromJson(sharedPrefbox.read(userInformation)).payload!.phone}"
                                  "",
                              hintStyle: GoogleFonts.poppins(
                                  color: textfieldgrey, fontSize: 11),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primarycolor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: greyColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                            // validator: validator,
                          ),
                          SizedBox(
                            height: (height * 0.04),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 5),
          child: CustomButton(
            text: "Save",
            onPressed: () {
              controller.updateProfile();
            },
            height: height * 0.07,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
