// ignore_for_file: deprecated_member_use

import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/activitycardWidgets/cardfooter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../widgets/exports.dart';
import '../controllers/categories_activities_controller.dart';

class CategoriesActivitiesView extends GetView<CategoriesActivitiesController> {
  const CategoriesActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(CategoriesActivitiesController());
    GetSubCategories getSubCategories = GetSubCategories();
    getSubCategories = Get.arguments;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            appbar("ACTIVITIES", width * 0.1),
            SizedBox(
              height: height * 0.20,
              child: ListView.builder(
                itemCount: getSubCategories.allCategory!.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 14, right: 10),
                    child: Obx(() {
                      return GestureDetector(
                        onTap: () {
                          controller.filteredActivities.clear();
                          controller.categoryId.value =
                              getSubCategories.allCategory![index].id!;
                          if (controller.categoryId.value ==
                              getSubCategories.allCategory![index].id) {
                            int length = getSubCategories
                                .allCategory![index].activity!.length;
                            for (int i = 0; i < length; i++) {
                              controller.filteredActivities.add(getSubCategories
                                  .allCategory![index].activity![i]);
                            }
                          }

                          controller.selectedIndex.value = index;
                        },
                        child: Container(
                          height: height * 0.20,
                          width: width * 0.34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                getSubCategories.allCategory![index].image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                              color: controller.selectedIndex.value == index
                                  ? primarycolor
                                  : Colors.transparent,
                              width: controller.selectedIndex.value == index
                                  ? 3
                                  : 0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black54,
                                      Colors.black
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, bottom: 10),
                                  child: Text(
                                    getSubCategories.allCategory![index].name
                                        .toString(),
                                    textAlign: center,
                                    style: style(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            _RecommendedHeader(width, height),
            heightbox10,
            Obx(
              () => Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 0),
                  itemCount: controller.filteredActivities.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            Routes.ACTIVITYDETAILS,
                            arguments: [
                              index,
                              getSubCategories
                                  .allCategory![index].activity![index]
                            ],
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whitecolor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Container(
                                      height: height * 0.25,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              controller
                                                  .filteredActivities[index]
                                                  .imageUrl!),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: topright,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.black54,
                                              Colors.transparent
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        bool isInWishList =
                                            controller.wishList.any(
                                          (wishItem) =>
                                              wishItem.activity!.id ==
                                              controller
                                                  .filteredActivities[index].id,
                                        );

                                        if (isInWishList) {
                                          // Get the activity ID from the featuredActivities
                                          final activityId = controller
                                              .filteredActivities[index].id;

                                          // Remove from wishlist by activity ID
                                          controller
                                              .removeFromWishList(activityId!);
                                        } else {
                                          // Add to wishlist
                                          controller.addToWishList(
                                            GetWishListData(
                                                activity: controller
                                                    .filteredActivities[index]),
                                          );
                                        }
                                      },
                                      child: Obx(() {
                                        bool isInWishList =
                                            controller.wishList.any(
                                          (wishItem) =>
                                              wishItem.activity!.id ==
                                              controller
                                                  .filteredActivities[index].id,
                                        );

                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                            alignment: topright,
                                            child: Icon(
                                              isInWishList
                                                  ? Iconsax.heart5
                                                  : Iconsax.heart,
                                              size: 30,
                                              color: primarycolor,
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: defaultpad,
                                child: Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    cardTitle(
                                        width * 0.9,
                                        controller
                                            .filteredActivities[index].name,
                                        2,
                                        fontsize: 14.0),
                                    heightbox3,
                                    Row(
                                      children: [
                                        rating(
                                            controller.filteredActivities[index]
                                                        .averageRating ==
                                                    0
                                                ? 4
                                                : controller
                                                    .filteredActivities[index]
                                                    .averageRating,
                                            controller.filteredActivities[index]
                                                        .numberOfReviews ==
                                                    0
                                                ? 5
                                                : controller
                                                    .filteredActivities[index]
                                                    .numberOfReviews),
                                        const Spacer(),
                                        locationwidget(getSubCategories
                                            .allCategory![
                                                controller.selectedIndex.value]
                                            .name),
                                      ],
                                    ),
                                    const Divider(color: greyColor),
                                    cardFooter(
                                        price: controller
                                            .filteredActivities[index]
                                            .packages!
                                            .first
                                            .adultPrice
                                            .toString(),
                                        days: controller
                                            .filteredActivities[index].duration
                                            .toString(),
                                        fontsize: 12,
                                        iconsize: 20)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // Category List View (Horizontal)
  // Widget _CategoryListView(
  //   double width,
  //   double height,
  // ) {
  //   return SizedBox(
  //     height: height * 0.20,
  //     child: ListView.builder(
  //       itemCount: 10,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: const EdgeInsets.only(top: 14, right: 10),
  //           child: Obx(() {
  //             return _ActivityCategory(
  //               index: index,
  //               width: width,
  //               height: height,
  //             );
  //           }),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Recommended Section Header
  Widget _RecommendedHeader(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommended',
          style: style(
            fontWeight: FontWeight.bold,
            color: primarycolor,
            fontSize: 16,
          ),
        ),
        Container(
          width: width * 0.1,
          height: height * 0.05,
          decoration: BoxDecoration(
            color: primarycolor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Iconsax.filter,
            color: primarycolor,
            size: 20,
          ),
        ),
      ],
    );
  }
}
