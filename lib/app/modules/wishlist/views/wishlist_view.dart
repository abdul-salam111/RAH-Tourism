import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/activitycardWidgets/cardfooter.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../res/exports.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(WishlistController());
    return Scaffold(
        body: Padding(
      padding: screenpad,
      child: Column(
        children: [
          appbar("WISHLIST".tr, context.width * 0.1),
          Obx(
            () => controller.wishList.isNotEmpty
                ? SizedBox(
                    height: (context.height * 0.02),
                  )
                : const SizedBox.shrink(),
          ),
          Obx(
            () => controller.wishList.isNotEmpty
                ? Row(
                    mainAxisAlignment: mainbetween,
                    children: [
                      Text(
                        'Today'.tr,
                        style: GoogleFonts.redHatDisplay(
                          fontWeight: FontWeight.bold,
                          color: primarycolor,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            color: primarycolor.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Icon(
                          Iconsax.filter,
                          color: primarycolor,
                          size: 20,
                        ),
                      )
                    ],
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => controller.wishList.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: controller.wishList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.ACTIVITYDETAILS,
                                arguments: index,
                              );
                            },
                            child: Hero(
                              tag: "'btn$index'",
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
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: context.height * 0.25,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            controller
                                                                .wishList[index]
                                                                .activity!
                                                                .imageUrl!),
                                                    fit: BoxFit.fill)),
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
                                          GestureDetector(
                                              onTap: () {
                                                final activityId = controller
                                                    .wishList[index]
                                                    .activity!
                                                    .id;

                                                // Remove from wishlist by activity ID
                                                controller.removeFromWishList(
                                                    activityId!);
                                              },
                                              child: const Align(
                                                alignment: topright,
                                                child: Padding(
                                                  padding: defaultpad,
                                                  child: Icon(
                                                    Iconsax.heart5,

                                                    size: 35,
                                                    color:
                                                        primarycolor, // Example color
                                                  ),
                                                ),
                                              )),
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
                                              context.width * 0.9,
                                              controller.wishList[index]
                                                  .activity!.name,
                                              1,
                                              fontsize: 15.0),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Row(
                                            children: [
                                              rating(
                                                  controller.wishList[index]
                                                      .activity!.averageRating,
                                                  controller
                                                      .wishList[index]
                                                      .activity!
                                                      .numberOfReviews),
                                              const Spacer(),
                                              locationwidget("DUBAI, UAE")
                                            ],
                                          ),
                                          const Divider(color: greyColor),
                                          cardFooter(
                                              price: controller
                                                  .wishList[index]
                                                  .activity!
                                                  .packages!
                                                  .first
                                                  .adultPrice!,
                                              days: controller.wishList[index]
                                                  .activity!.duration!,
                                              fontsize: 12,
                                              iconsize: 20),
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
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: maincenter,
                        children: [
                          Center(
                            child: Lottie.asset('lottiefile/emptycart2.json'),
                          )
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
    ));
  }
}
