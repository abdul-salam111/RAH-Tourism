// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:bookdubaisafari/app/data/getModels/getUserInfo.dart';
import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';

// import 'package:bookdubaisafari/app/modules/homeModule/activitydetails/controllers/activitydetails_controller.dart';
// import 'package:bookdubaisafari/app/modules/homeModule/citiesActvities/views/cities_actvities_view.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/activitycardWidgets/cardfooter.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../res/exports.dart';
import '../../CategoriesActivities/controllers/categories_activities_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var sizedbox001 = SizedBox(
      height: height * 0.01,
    );
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: height * 0.5,
            leadingWidth: width * 0.5,
            actions: [
              Padding(
                  padding: EdgeInsets.only(
                    right: width * 0.05,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.NOTIFICATIONS);
                    },
                    child: Container(
                      padding: pad5,
                      decoration: BoxDecoration(
                          color: whitecolor.withAlpha((0.4 * 255).toInt()),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: whitecolor)),
                      child: const Icon(
                        Iconsax.notification,
                        color: whitecolor,
                      ),
                    ),
                  ))
            ],
            leading: sharedPrefbox.read(isLoggedin) == true
                ? Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.015, left: width * 0.05),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: CircleAvatar(
                            backgroundImage: GetUserInfo.fromJson(
                                            sharedPrefbox.read(userInformation))
                                        .payload!
                                        .profileImage ==
                                    null
                                ? const AssetImage(image1)
                                : CachedNetworkImageProvider(
                                    GetUserInfo.fromJson(
                                            sharedPrefbox.read(userInformation))
                                        .payload!
                                        .profileImage!),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: crosstart,
                          children: [
                            Text(
                              "Hi, ${GetUserInfo.fromJson(sharedPrefbox.read(userInformation)).payload!.firstName}",
                              style: style(
                                  color: whitecolor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              welcomebck.tr,
                              style: style(color: whitecolor, fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Swiper(
                    duration: 500,
                    autoplay: true,
                    itemBuilder: (BuildContext context, int index) {
                      return SliderWidget(
                        height: height,
                        width: width,
                        sliderImage: index == 0
                            ? banner1
                            : index == 1
                                ? banner2
                                : banner3,
                      );
                    },
                    itemCount: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Column(
                      crossAxisAlignment: crosstart,
                      mainAxisAlignment: mainend,
                      children: [
                        Text(bannerheading.tr,
                            style: style(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                        sizedbox001,
                        Text(
                          bannerDescription.tr,
                          style: style(
                            color: whitecolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: justify,
                        ),
                        sizedbox001,
                        Row(
                          children: [
                            Text(
                              learnMore.tr,
                              style: style(
                                color: primarycolor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            widthbox10,
                            const Icon(
                              Iconsax.arrow_right5,
                              size: 12,
                              color: primarycolor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: bottomcenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: height * 0.03,
                        left: width * 0.04,
                        right: width * 0.04,
                      ),
                      child: SizedBox(
                        height: height * 0.06,
                        child: Stack(
                          children: [
                            // BackdropFilter for glassmorphism blur effect
                            ClipRRect(
                              borderRadius: radius10,
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 10.0, sigmaY: 10.0),
                                child: Container(
                                  color: whitecolor.withAlpha((0.1 * 255)
                                      .toInt()), // Transparent overlay
                                ),
                              ),
                            ),
                            // TextField with transparent fill color
                            TextField(
                              onTap: () {
                                showZoomTransitionBottomSheet(context);
                              },
                              readOnly: true,
                              style: GoogleFonts.poppins(
                                color: blackcolor,
                                fontSize: 13,
                              ),
                              decoration: InputDecoration(
                                hintText: bannersearchtext.tr,
                                hintStyle: GoogleFonts.poppins(
                                  color: whitecolor,
                                  fontSize: 13,
                                ),
                                prefixIcon: const Padding(
                                  padding: pad12,
                                  child: Icon(
                                    Iconsax.search_normal,
                                    color: whitecolor,
                                    size: 16,
                                  ),
                                ),
                                fillColor:
                                    whitecolor.withAlpha((0.2 * 255).toInt()),
                                filled: true,
                                focusedBorder: bannertextfieldBorder(),
                                enabledBorder: bannertextfieldBorder(),
                                contentPadding:
                                    EdgeInsets.only(left: width * 0.01),
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
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              physics: neverscroll,
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    SizedBox(
                      height: height * 0.20,
                      child: GetBuilder<HomeController>(builder: (cont) {
                        return ListView.builder(
                          itemCount: cont.getMainCategories.allCategory == null
                              ? 5
                              : cont.getMainCategories.allCategory!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final actualIndex = index;
                            return Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.04, top: height * 0.02),
                                child: GestureDetector(
                                  onTap: () {
                                    var categorycontroller = Get.put(
                                        CategoriesActivitiesController());
                                    categorycontroller.filteredActivities
                                        .clear();
                                    categorycontroller.categoryId.value =
                                        controller.getSubCategories
                                            .allCategory![index].id!;

                                    if (categorycontroller.categoryId.value ==
                                        controller.getSubCategories
                                            .allCategory![index].id) {
                                      //print("you are good to go");
                                      int length = controller.getSubCategories
                                          .allCategory![index].activity!.length;
                                      // print(length);
                                      for (int i = 0; i < length; i++) {
                                        categorycontroller.filteredActivities
                                            .add(controller
                                                .getSubCategories
                                                .allCategory![index]
                                                .activity![i]);
                                      }
                                    }
                                    categorycontroller.selectedIndex.value =
                                        index;
                                    Get.toNamed(
                                      Routes.CATEGORIES_ACTIVITIES,
                                      arguments: controller.getSubCategories,
                                    );
                                  },
                                  child: controller.isloading.value == true
                                      ? HorizontalSkeleton(
                                          height: context.height,
                                          width: context.width,
                                        )
                                      : Container(
                                          height: height * 0.20,
                                          width: width * 0.34,
                                          decoration: BoxDecoration(
                                            borderRadius: radius10,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  controller
                                                      .categoriesImages[index]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              // Gradient overlay
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: radius10,
                                                  gradient:
                                                      const LinearGradient(
                                                    begin: topcenter,
                                                    end: bottomcenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.transparent,
                                                      Colors.black38,
                                                      Colors.black,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              // Text content
                                              Align(
                                                alignment: bottomcenter,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5,
                                                          bottom: 10),
                                                  child: Text(
                                                      cont
                                                          .getMainCategories
                                                          .allCategory![
                                                              actualIndex]
                                                          .name
                                                          .toString(),
                                                      textAlign: center,
                                                      style: style(
                                                          fontSize: 11,
                                                          color: whitecolor,
                                                          fontWeight:
                                                              FontWeight.w900)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ));
                          },
                          scrollDirection: Axis.horizontal,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.04, right: width * 0.04),
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          Text(
                            exploreworld.tr,
                            style: GoogleFonts.yeonSung(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: primarycolor),
                          ),
                          seeAll(
                              headingtext: travelersfavchoice.tr,
                              ontap: () {
                                showZoomTransitionBottomSheet(context);
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height > 900 ? height * 0.29 : height * 0.29,
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.featuredActivities.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.01,
                                    left: width * 0.04,
                                    bottom: 5),
                                child: Container(
                                  width: width * 0.6,
                                  decoration: BoxDecoration(
                                    color: whitecolor,
                                    borderRadius: radius20,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.black
                                    //         .withOpacity(0.2), // Shadow color
                                    //     spreadRadius: 5, // Spread the shadow
                                    //     blurRadius: 15, // Blur radius
                                    //     offset: const Offset(0,
                                    //         5), // Offset of the shadow (X, Y)
                                    //   ),
                                    // ],
                                  ),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                Routes.ACTIVITYDETAILS,
                                                arguments: [
                                                  index,
                                                  controller
                                                      .featuredActivities[index]
                                                ],
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: radius10,
                                              child: Hero(
                                                tag: 'btn$index',
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                      .featuredActivities[index]
                                                      .imageUrl!,
                                                  height: height * 0.16,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: defaultpad,
                                              child: Row(
                                                mainAxisAlignment: mainbetween,
                                                children: [
                                                  Container(
                                                    padding: pad5,
                                                    decoration: BoxDecoration(
                                                        color: primarycolor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      "Featured".tr,
                                                      style: style(
                                                          color: whitecolor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      bool isInWishList =
                                                          controller.wishList
                                                              .any(
                                                        (wishItem) =>
                                                            wishItem
                                                                .activity!.id ==
                                                            controller
                                                                .featuredActivities[
                                                                    index]
                                                                .id,
                                                      );

                                                      if (isInWishList) {
                                                        // Get the activity ID from the featuredActivities
                                                        final activityId =
                                                            controller
                                                                .featuredActivities[
                                                                    index]
                                                                .id;

                                                        // Remove from wishlist by activity ID
                                                        controller
                                                            .removeFromWishList(
                                                                activityId!);
                                                      } else {
                                                        // Add to wishlist
                                                        controller
                                                            .addToWishList(
                                                          GetWishListData(
                                                            activity: controller
                                                                    .featuredActivities[
                                                                index],
                                                          ),
                                                          context,
                                                        );
                                                      }
                                                    },
                                                    child: Obx(() {
                                                      bool isInWishList =
                                                          controller.wishList
                                                              .any(
                                                        (wishItem) =>
                                                            wishItem
                                                                .activity!.id ==
                                                            controller
                                                                .featuredActivities[
                                                                    index]
                                                                .id,
                                                      );

                                                      return Icon(
                                                        isInWishList
                                                            ? Iconsax.heart5
                                                            : Iconsax.heart,
                                                        size: 30,
                                                        color: primarycolor,
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: defaultpad,
                                        child: Column(
                                          crossAxisAlignment: crosstart,
                                          children: [
                                            cardTitle(
                                                width * 0.6,
                                                controller
                                                    .featuredActivities[index]
                                                    .name,
                                                1,
                                                fontsize: 13.0),
                                            Row(
                                              children: [
                                                rating(
                                                    controller
                                                        .featuredActivities[
                                                            index]
                                                        .averageRating,
                                                    controller
                                                        .featuredActivities[
                                                            index]
                                                        .numberOfReviews),
                                                const Spacer(),
                                                locationwidget("DUBAI, UAE"),
                                              ],
                                            ),
                                            const Divider(
                                              color: greyColor,
                                            ),
                                            cardFooter(
                                              price: controller
                                                  .featuredActivities[index]
                                                  .packages!
                                                  .first
                                                  .adultPrice!,
                                              days: controller
                                                  .featuredActivities[index]
                                                  .duration!
                                                  .toString(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (height * 0.015),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.only(left: width * 0.04),
                    //   child: Column(
                    //     crossAxisAlignment: crosstart,
                    //     children: [
                    //       Text(
                    //         exploreUAE.tr,
                    //         style: GoogleFonts.yeonSung(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w400,
                    //             color: primarycolor),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(right: width * 0.04),
                    //         child: seeAll(
                    //             headingtext: "UAE City Tours".tr, ontap: () {}),
                    //       ),
                    //       SizedBox(
                    //         height: height * 0.20,
                    //         child: ListView.builder(
                    //           padding: EdgeInsets.zero,
                    //           itemCount: 10,
                    //           shrinkWrap: true,
                    //           itemBuilder: (context, index) {
                    //             return Padding(
                    //                 padding: EdgeInsets.only(
                    //                     right: width * 0.02,
                    //                     top: height * 0.01),
                    //                 child: GestureDetector(
                    //                   onTap: () {
                    //                     Get.to(
                    //                       const CitiesActvitiesView(),
                    //                       transition: Transition.rightToLeft,
                    //                     );
                    //                   },
                    //                   child: Container(
                    //                     height: height * 0.20,
                    //                     width: width * 0.5,
                    //                     decoration: BoxDecoration(
                    //                       borderRadius: radius10,
                    //                       image: DecorationImage(
                    //                           image: AssetImage(
                    //                             index == 0
                    //                                 ? image4
                    //                                 : index == 1
                    //                                     ? image5
                    //                                     : image3,
                    //                           ),
                    //                           fit: BoxFit.cover,
                    //                           opacity: 0.7,
                    //                           colorFilter:
                    //                               const ColorFilter.mode(
                    //                                   blackcolor,
                    //                                   BlendMode.dstATop)),
                    //                     ),
                    //                     child: Column(
                    //                       mainAxisAlignment: mainbetween,
                    //                       children: [
                    //                         Align(
                    //                           alignment: topright,
                    //                           child: Padding(
                    //                               padding: EdgeInsets.only(
                    //                                   top: 5,
                    //                                   left: width * 0.04,
                    //                                   right: width * 0.01,
                    //                                   bottom: height * 0.01),
                    //                               child: Container(
                    //                                 padding: pad5,
                    //                                 decoration: BoxDecoration(
                    //                                   color: primarycolor,
                    //                                   borderRadius: radius10,
                    //                                 ),
                    //                                 child: Text(
                    //                                   "46+ TOURS & 80+ Activities",
                    //                                   textAlign: center,
                    //                                   style: style(
                    //                                       fontSize: 9,
                    //                                       fontWeight:
                    //                                           FontWeight.w600,
                    //                                       color:
                    //                                           whitecolor // Ensure text is visible over the gradient
                    //                                       ),
                    //                                 ),
                    //                               )),
                    //                         ),
                    //                         Align(
                    //                           alignment: bottomleft,
                    //                           child: Padding(
                    //                             padding: EdgeInsets.only(
                    //                                 left: width * 0.04,
                    //                                 right: width * 0.01,
                    //                                 bottom: height * 0.01),
                    //                             child: Text(
                    //                               index == 0
                    //                                   ? "Dubai"
                    //                                   : index == 1
                    //                                       ? "Abu Dhabi"
                    //                                       : "Sharjah",
                    //                               textAlign: center,
                    //                               style: style(
                    //                                 fontSize: 14,
                    //                                 fontWeight: FontWeight.w700,
                    //                                 color: Colors
                    //                                     .white, // Ensure text is visible over the gradient
                    //                               ),
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ],
                    //                     ),
                    //                   ),
                    //                 ));
                    //           },
                    //           scrollDirection: Axis.horizontal,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 70,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.height,
    required this.width,
    required this.sliderImage,
  });
  final double height;
  final double width;
  final String sliderImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: AssetImage(sliderImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

void showZoomTransitionBottomSheet(
  BuildContext context,
) {
  final FocusNode searchFocusNode = FocusNode();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return GestureDetector(
        onTap: () =>
            FocusScope.of(context).unfocus(), // Dismiss keyboard on tap outside
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.2), // Slight dark overlay
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.99,
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.2), // Semi-transparent background
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Custom draggable indicator
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: radius10,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  GetBuilder<HomeController>(builder: (cont) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: TextField(
                        onChanged: (search) {
                          cont.searchedActivities.value = cont
                              .listOfActivitiesForSearch
                              .where((e) => e.name!
                                  .toLowerCase()
                                  .contains(search.toLowerCase()))
                              .toList();
                          cont.update();
                        },
                        focusNode: searchFocusNode, // Attach FocusNode
                        autofocus: true, // Automatically focuses when opened
                        style: GoogleFonts.poppins(
                            color: whitecolor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          hintText: bannersearchtext,
                          hintStyle: GoogleFonts.poppins(
                              color: whitecolor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                          prefixIcon: const Padding(
                            padding: pad12,
                            child: Icon(
                              Iconsax.search_normal,
                              color: whitecolor,
                              size: 16,
                            ),
                          ),
                          fillColor: Colors.white.withOpacity(0.6),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white.withOpacity(0.8),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.6),
                              width: 1,
                            ),
                            borderRadius: radius10,
                          ),
                          contentPadding: const EdgeInsets.only(left: 10),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Row(
                      mainAxisAlignment: mainbetween,
                      children: [
                        Text(
                          'Recommended',
                          style: style(
                            fontWeight: FontWeight.bold,
                            color: whitecolor,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          width: 40, // Width of the container
                          height: 30, // Height of the container
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                                0.2), // Background color with opacity
                            borderRadius: radius20, // Rounded corners
                          ),
                          child: const Center(
                            child: Icon(
                              Iconsax.filter, // The icon to display
                              color: Colors.white, // Icon color
                              size: 20, // Icon size
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  heightbox10,
                  GetBuilder<HomeController>(
                    builder: (con) => Expanded(
                      child: Padding(
                        padding: screenpad,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: con.searchedActivities.isNotEmpty
                              ? con.searchedActivities.length
                              : con.listOfActivitiesForSearch.length,
                          itemBuilder: (context, index) {
                            // Select the correct activity based on the search condition
                            final activity = con.searchedActivities.isNotEmpty
                                ? con.searchedActivities[index]
                                : con.listOfActivitiesForSearch[index];

                            final imageUrl = activity.imageUrl ??
                                ''; // Default to an empty string if null
                            final name = activity.name ?? 'Unknown Activity';
                            final ratingg = activity.averageRating ?? 0.0;
                            final reviews = activity.numberOfReviews ?? 0;
                            final packages = activity.packages;
                            final adultPrice = packages!.first.adultPrice!;
                            final duration = activity.duration ?? 'N/A';

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.ACTIVITYDETAILS,
                                    arguments: [
                                      index,
                                      con.searchedActivities.isNotEmpty
                                          ? con.searchedActivities[index]
                                          : con.listOfActivitiesForSearch[index]
                                    ],
                                  );
                                },
                                child: Hero(
                                  tag: 'btn$index',
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.03),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(2, 2),
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
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.25,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            imageUrl),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: radius10,
                                                    gradient:
                                                        const LinearGradient(
                                                      begin: topright,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        Colors.black54,
                                                        Colors.transparent,
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: topright,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    bool isInWishList =
                                                        con.wishList.any(
                                                      (wishItem) =>
                                                          wishItem
                                                              .activity!.id ==
                                                          activity.id,
                                                    );

                                                    if (isInWishList) {
                                                      // Get the activity ID from the featuredActivities
                                                      final activityId =
                                                          activity.id;

                                                      // Remove from wishlist by activity ID
                                                      con.removeFromWishList(
                                                          activityId!);
                                                    } else {
                                                      // Add to wishlist
                                                      con.addToWishList(
                                                          GetWishListData(
                                                              activity:
                                                                  activity),
                                                          context);
                                                    }
                                                  },
                                                  child: Obx(() {
                                                    bool isInWishList =
                                                        con.wishList.any(
                                                      (wishItem) =>
                                                          wishItem
                                                              .activity!.id ==
                                                          activity.id,
                                                    );

                                                    return Padding(
                                                      padding: defaultpad,
                                                      child: Icon(
                                                        isInWishList
                                                            ? Iconsax.heart5
                                                            : Iconsax.heart,
                                                        size: 30,
                                                        color: primarycolor,
                                                      ),
                                                    );
                                                  }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: defaultpad,
                                          child: Column(
                                            crossAxisAlignment: crosstart,
                                            mainAxisAlignment: mainend,
                                            children: [
                                              cardTitle(
                                                context.mediaQuery.size.width *
                                                    0.9,
                                                name,
                                                1,
                                                fontsize: 14.0,
                                              ),
                                              heightbox3,
                                              Row(
                                                children: [
                                                  rating(ratingg, reviews),
                                                  const Spacer(),
                                                  locationwidget("DUBAI, UAE"),
                                                ],
                                              ),
                                              const Divider(color: greyColor),
                                              cardFooter(
                                                price: adultPrice,
                                                days: duration,
                                                iconsize: 15,
                                                fontsize: 12,
                                              ),
                                              heightbox10,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );

  // Focus the TextField when the bottom sheet is opened
  WidgetsBinding.instance.addPostFrameCallback((_) {
    searchFocusNode.requestFocus();
  });
}

class HorizontalSkeleton extends StatelessWidget {
  final double height;
  final double width;

  const HorizontalSkeleton(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height * 0.20,
        width: width * 0.34,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Gradient overlay skeleton
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.grey,
                    Colors.grey,
                    Colors.grey,
                    Colors.black,
                  ],
                ),
              ),
            ),
            // Text skeleton
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 10),
                child: Container(
                  height: 10,
                  width: width * 0.3,
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
