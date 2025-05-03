import 'package:bookdubaisafari/app/data/getModels/MyBookings.dart';

import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/bookings_controller.dart';

class BookingsView extends GetView<BookingsController> {
  const BookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Get.put(BookingsController());
    final sizebox002 = SizedBox(height: size.height * 0.02);

    return Obx(() => OverlayLoaderWithAppIcon(
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
            body: sharedPrefbox.read(isLoggedin) != true
                ? Center(
                    child: Text(
                    "No Tour Booked Yet",
                    style: style(),
                  ))
                : Padding(
                    padding: screenpad,
                    child: Column(
                      children: [
                        appbar("BOOKINGS".tr, size.width * 0.1),
                        heightbox10,
                        Obx(() => controller.isloading.value
                            ? const Center()
                            : controller.myBookingModel.value.mybookings != null
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6.0),
                                      child: Column(
                                        crossAxisAlignment: crosstart,
                                        children: [
                                          _buildSearchField(),
                                          SizedBox(height: size.height * 0.015),
                                          _buildTabBar(size),
                                          sizebox002,
                                          Obx(() => _buildContent(size)),
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Center(
                                      child: Text(
                                        "No Tour is not Booked Yet",
                                        style: style(),
                                      ),
                                    ),
                                  )),
                      ],
                    ),
                  ),
          ),
        ));
  }

  Widget _buildSearchField() {
    return TextField(
      style: GoogleFonts.poppins(color: blackcolor, fontSize: 13),
      onChanged: (search) {
        if (controller.selectedTab.value == 0) {
          controller.recentBookingsSearch.value = controller.recentBookings
              .where((e) =>
                  e.activityName!.toLowerCase().contains(search.toLowerCase()))
              .toList();
        } else {
          controller.historyBookingsSearch.value = controller.historyBookings
              .where((e) =>
                  e.activityName!.toLowerCase().contains(search.toLowerCase()))
              .toList();
        }
      },
      decoration: InputDecoration(
        hintText: "Search your bookings".tr,
        hintStyle: GoogleFonts.poppins(color: textfieldgrey, fontSize: 13),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Iconsax.search_normal, color: textfieldgrey, size: 16),
        ),
        fillColor: whitecolor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: whitecolor, width: 2),
          borderRadius: radius10,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: whitecolor),
          borderRadius: radius10,
        ),
        contentPadding: const EdgeInsets.only(left: 10),
      ),
    );
  }

  Widget _buildTabBar(Size size) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: whiteand10borderradius,
        child: Row(
          mainAxisAlignment: mainbetween,
          children: [
            _buildTab(size, "Recently", 0),
            _buildTab(size, "History", 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(Size size, String label, int index) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = index,
      child: Container(
        width: controller.selectedTab.value == index
            ? size.width * 0.55
            : size.width * 0.24,
        height: size.height * 0.055,
        decoration: BoxDecoration(
          color:
              controller.selectedTab.value == index ? primarycolor : whitecolor,
          borderRadius: radius10,
          boxShadow: controller.selectedTab.value == index
              ? [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(index == 0 ? 6 : -6, 0),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          label.tr,
          style: style(
            fontSize: 16,
            fontWeight: controller.selectedTab.value == index
                ? FontWeight.bold
                : FontWeight.normal,
            color: controller.selectedTab.value == index
                ? Colors.white
                : const Color(0xffBABABA),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Size size) {
    return controller.selectedTab.value == 0
        ? _buildBookingListOfSuccess(size,
            isHistory: false,
            mybooking: controller.recentBookingsSearch.isNotEmpty
                ? controller.recentBookingsSearch
                : controller.recentBookings)
        : _buildBookingListOfHistory(size,
            isHistory: true,
            mybooking: controller.historyBookingsSearch.isNotEmpty
                ? controller.historyBookingsSearch
                : controller.historyBookings);
  }

  Widget _buildBookingListOfSuccess(Size size,
      {required bool isHistory, required List<Mybooking> mybooking}) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: mybooking.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: _buildBookingCard(size, index, isHistory, mybooking),
          );
        },
      ),
    );
  }

  Widget _buildBookingListOfHistory(Size size,
      {required bool isHistory, required List<Mybooking> mybooking}) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        itemCount: mybooking.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: _buildBookingCard(size, index, isHistory, mybooking),
          );
        },
      ),
    );
  }

  Widget _buildBookingCard(
      Size size, int index, bool isHistory, List<Mybooking> mybooking) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 9),
          ),
        ],
        color: whitecolor,
        borderRadius: radius20,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: radius20,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.BOOKINGDETAILS,
                        arguments: [mybooking[index], index]);
                  },
                  child: Hero(
                    tag: 'btn$index',
                    child: Container(
                      height: size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(mybooking[index]
                              .orderItems!
                              .first
                              .package!
                              .activity!
                              .imageUrl!),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: radius10,
                          gradient: const LinearGradient(
                            begin: topright,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (!isHistory) _buildCancelButton(size, mybooking, index),
                if (isHistory)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: whitecolor,
                        borderRadius: radius10,
                      ),
                      child: Text(
                        mybooking[index].status!,
                        style: GoogleFonts.redHatDisplay(
                          fontSize: 13,
                          color: mybooking[index].status! == "canceled"
                              ? redColor
                              : const Color(0xff4DA528),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (!isHistory)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.EDITBOOKINGS,
                            arguments: mybooking[index]);
                      }, // Add your edit functionality here
                      child: Container(
                        padding: defaultpad,
                        decoration: BoxDecoration(
                          color: whitecolor.withOpacity(0.3),
                          shape: BoxShape.circle,
                          border: Border.all(color: whitecolor),
                        ),
                        child: const Icon(
                          Iconsax.edit,
                          color: whitecolor,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () =>
                  Get.toNamed(Routes.ACTIVITYDETAILS, arguments: index),
              child: Column(
                crossAxisAlignment: crosstart,
                mainAxisAlignment: mainend,
                children: [
                  cardTitle(size.width * 0.9, mybooking[index].activityName, 1),
                  heightbox3,
                  Row(
                    children: [
                      rating(
                          mybooking[index]
                              .orderItems!
                              .first
                              .package!
                              .activity!
                              .averageRating,
                          mybooking[index]
                              .orderItems!
                              .first
                              .package!
                              .activity!
                              .numberOfReviews),
                      const Spacer(),
                      locationwidget("DUBAI, UAE"),
                    ],
                  ),
                  const Divider(color: greyColor),
                  Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Text("Order Id:".tr,
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 12,
                              color: textfieldgrey,
                              fontWeight: FontWeight.w500)),
                      widthbox5,
                      Text(mybooking[index].referenceId!,
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 12,
                              color: blackcolor,
                              fontWeight: FontWeight.w700)),
                      const Spacer(),
                      Text("AED ${mybooking[index].totalAmount}",
                          style: GoogleFonts.redHatDisplay(
                              fontSize: 15,
                              color: primarycolor,
                              fontWeight: FontWeight.w900)),
                    ],
                  ),
                  heightbox10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelButton(Size size, List<Mybooking> mybooking, index) {
    return Align(
      alignment: topright,
      child: Padding(
        padding: defaultpad,
        child: GestureDetector(
          onTap: () {
            Get.dialog(
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: whitecolor, borderRadius: radius20),
                    width: double.infinity,
                    height: size.height * 0.27,
                    child: Column(
                      children: [
                        heightbox10,
                        const Icon(Icons.info_outline_rounded,
                            size: 50, color: primarycolor),
                        const SizedBox(height: 10),
                        Text(
                          "Are you sure you want to cancel \nyour booking?".tr,
                          textAlign: center,
                          style: GoogleFonts.redHatDisplay(
                            decoration: TextDecoration.none,
                            color: textfieldgrey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: mainaround,
                            children: [
                              CustomButton(
                                text: "Yes, Cancel".tr,
                                onPressed: () async {
                                  Get.back();
                                  await controller.cancelBooking(
                                      mybooking[index].referenceId);
                                },
                                color: redColor,
                                width: size.width * 0.3,
                                height: 40,
                                fontsize: 13,
                              ),
                              CustomButton(
                                text: "Not Now".tr,
                                textcolor: textfieldgrey,
                                onPressed: () {
                                  Get.back();
                                },
                                color: greyColor,
                                width: size.width * 0.3,
                                height: 40,
                                fontsize: 13,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: whitecolor.withOpacity(0.3),
              shape: BoxShape.circle,
              border: Border.all(color: whitecolor),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.close, color: whitecolor, size: 20),
          ),
        ),
      ),
    );
  }
}
