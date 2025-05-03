import 'package:bookdubaisafari/app/data/getModels/getBookingsCount.dart';
import 'package:bookdubaisafari/app/data/getModels/getUserInfo.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/bookings/controllers/bookings_controller.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/bookings/views/bookings_view.dart';
import 'package:bookdubaisafari/app/modules/profileModule/personalinformation/views/personalinformation_view.dart';
import 'package:bookdubaisafari/app/modules/profileModule/settings/views/settings_view.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/snakbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(profileimage), fit: BoxFit.cover)),
      child: Obx(
        () => OverlayLoaderWithAppIcon(
          isLoading: controller.isloading.value,
          overlayBackgroundColor: blackcolor,
          circularProgressColor: primarycolor,
          appIcon: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset('assets/images/logo.png'),
          ),
          child: Scaffold(
            backgroundColor: transparent,
            body: Padding(
              padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
              child: ListView(
                children: [
                  Row(
                    children: [
                      backButton(color: whitecolor),
                      const Spacer(),
                      Text(
                        'PROFILE'.tr,
                        style: style(
                            fontWeight: FontWeight.bold,
                            color: whitecolor,
                            fontSize: 18),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(const SettingsView(),
                              transition: Transition.rightToLeft);
                        },
                        child: Image.asset(
                          settingicon,
                          width: width * 0.1,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  sharedPrefbox.read(isLoggedin) == true
                      ? Container(
                          width: double.infinity,
                          padding: pad16,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: const Offset(0, 2),
                                blurRadius: 16,
                                spreadRadius: 4,
                              ),
                            ],
                            color: whitecolor,
                            borderRadius: radius20,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: width * 0.27,
                                height: height * 0.12,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: _getProfileImage(),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: radius20,
                                ),
                              ),
                              heightbox10,
                              Text(
                                _getFullName(),
                                style: style(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: blackcolor),
                              ),
                              Text(
                                _getEmail(),
                                style:
                                    style(color: textfieldgrey, fontSize: 12),
                              ),
                              heightbox10,
                              const Divider(color: greyColor),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "Total Completed Bookings".tr,
                                        style: style(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 40, 104, 78)),
                                      ),
                                      heightbox5,
                                      Text(
                                        _getSuccessBookings(),
                                        style: style(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: const Color.fromARGB(
                                                255, 40, 104, 78)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: height * 0.05,
                                    color: greyColor,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Total Cancelled Bookings".tr,
                                        style: style(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xffFF494F)),
                                      ),
                                      heightbox5,
                                      Text(
                                        _getCancelledBookings(),
                                        style: style(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xffFF494F)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: defaultpad,
                    decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: radius20,
                    ),
                    child: Column(
                      children: [
                        heightbox10,
                        Text(
                          "Account Information".tr,
                          style: style(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: blackcolor),
                        ),
                        heightbox10,
                        const Divider(color: greyColor),
                        Column(
                          children: [
                            Listtile(
                              leadingIcon: Iconsax.user,
                              text: "Personal Information".tr,
                              onTap: () {
                                if (sharedPrefbox.read(isLoggedin) == true) {
                                  Get.to(const PersonalinformationView(),
                                      transition: Transition.rightToLeft);
                                } else {
                                  SnackbarHelper.showSnackbar(
                                    context: context,
                                    message: 'Please Login First',
                                    actionLabel: 'Sign In',
                                    onActionPressed: () {
                                      Get.toNamed(Routes.SIGNIN);
                                    },
                                    backgroundColor: whitecolor,
                                  );
                                }
                              },
                            ),
                            const Divider(color: greyColor),
                            Listtile(
                              leadingIcon: Iconsax.calendar,
                              text: "Bookings History".tr,
                              onTap: () {
                                if (sharedPrefbox.read(isLoggedin) == true) {
                                  Get.put(BookingsController());
                                  Get.to(const BookingsView(),
                                      transition: Transition.rightToLeft);
                                } else {
                                  SnackbarHelper.showSnackbar(
                                    context: context,
                                    message: 'Please Login First',
                                    actionLabel: 'Sign In',
                                    onActionPressed: () {
                                      Get.toNamed(Routes.SIGNIN);
                                    },
                                    backgroundColor: whitecolor,
                                  );
                                }
                              },
                            ),
                            const Divider(color: greyColor),
                            Listtile(
                              leadingIcon: Icons.privacy_tip_outlined,
                              text: "Terms & Privacy Policy".tr,
                              onTap: () {
                                Get.toNamed(Routes.PRIVACYPOLICY);
                              },
                            ),
                            const Divider(color: greyColor),
                            Listtile(
                              leadingIcon: Icons.help_outline,
                              text: "Support & Help".tr,
                              onTap: () {
                                Get.toNamed(Routes.SUPPORTANDHELP);
                              },
                            ),
                            const Divider(color: greyColor),
                            sharedPrefbox.read(isLoggedin) == true
                                ? Listtile(
                                    leadingIcon: Iconsax.logout,
                                    text: "LOGOUT".tr,
                                    onTap: () {
                                      Get.dialog(
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(25),
                                            child: Container(
                                              width: double.infinity,
                                              height: height * 0.4,
                                              decoration: BoxDecoration(
                                                borderRadius: radius20,
                                                color: whitecolor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                        height: height * 0.06),
                                                    const Icon(
                                                      Iconsax.logout,
                                                      color: Color(0xffff494f),
                                                      size: 70,
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.03),
                                                    Text(
                                                      "Are you sure, you want to Logout account"
                                                          .tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: style(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: textfieldgrey),
                                                    ),
                                                    SizedBox(
                                                        height: height * 0.04),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16,
                                                              right: 16,
                                                              bottom: 7),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () async {
                                                              Get.back();
                                                              await controller
                                                                  .logoutUser();
                                                            },
                                                            child: Container(
                                                              height:
                                                                  height * 0.05,
                                                              width:
                                                                  width * 0.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: const Color(
                                                                    0xffff494f),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                  child: Text(
                                                                    "Yes".tr,
                                                                    style:
                                                                        style(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Get.back();
                                                            },
                                                            child: Container(
                                                              height:
                                                                  height * 0.05,
                                                              width:
                                                                  width * 0.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        greyColor),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                              ),
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              20,
                                                                          right:
                                                                              20),
                                                                  child: Text(
                                                                    "Back".tr,
                                                                    style: GoogleFonts
                                                                        .redHatDisplay(
                                                                      decoration:
                                                                          TextDecoration
                                                                              .none,
                                                                      color:
                                                                          textfieldgrey,
                                                                      fontSize:
                                                                          13.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
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
                                      );
                                    },
                                  )
                                : Column(
                                    children: [
                                      Listtile(
                                        leadingIcon: Icons.login,
                                        text: "Login".tr,
                                        onTap: () {
                                          Get.toNamed(
                                            Routes.SIGNIN,
                                            arguments: false,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                            SizedBox(height: height * 0.1),
                          ],
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

  // Helper methods to handle null cases
  ImageProvider _getProfileImage() {
    final userInfoJson = sharedPrefbox.read(userInformation);
    if (userInfoJson == null) {
      return const AssetImage("assets/images/1.jpg");
    }
    final userInfo = GetUserInfo.fromJson(userInfoJson);
    return userInfo.payload?.profileImage != null
        ? CachedNetworkImageProvider(userInfo.payload!.profileImage!)
        : const AssetImage("assets/images/1.jpg");
  }

  String _getFullName() {
    final userInfoJson = sharedPrefbox.read(userInformation);
    if (userInfoJson == null) {
      return "Guest";
    }
    final userInfo = GetUserInfo.fromJson(userInfoJson);
    return "${userInfo.payload?.firstName ?? ''} ${userInfo.payload?.lastName ?? ''}"
        .trim();
  }

  String _getEmail() {
    final userInfoJson = sharedPrefbox.read(userInformation);
    if (userInfoJson == null) {
      return "";
    }
    final userInfo = GetUserInfo.fromJson(userInfoJson);
    return userInfo.payload?.email ?? "";
  }

  String _getSuccessBookings() {
    final bookingCountsJson = sharedPrefbox.read("bookingCounts");
    if (bookingCountsJson == null) {
      return "0";
    }
    final bookingCounts = GetBookingsCount.fromJson(bookingCountsJson);
    return bookingCounts.booking?.successbooking?.toString() ?? "0";
  }

  String _getCancelledBookings() {
    final bookingCountsJson = sharedPrefbox.read("bookingCounts");
    if (bookingCountsJson == null) {
      return "0";
    }
    final bookingCounts = GetBookingsCount.fromJson(bookingCountsJson);
    return bookingCounts.booking?.cancelledbooking?.toString() ?? "0";
  }
}

class Listtile extends StatelessWidget {
  final IconData leadingIcon;
  final String text;

  final VoidCallback onTap;

  const Listtile({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(),
          child: Row(
            children: [
              Icon(
                leadingIcon,
                color: primarycolor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                text,
                style: style(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textfieldgrey,
                ),
              ),
              const Spacer(),
              rightarriconblack,
            ],
          ),
        ),
      ),
    );
  }
}
