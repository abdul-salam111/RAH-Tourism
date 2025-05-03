import 'dart:math';

import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getwishListData.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart' as html;
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/redhatDisplay.dart' as style;
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/activitydetails_controller.dart';

class ActivitydetailsView extends GetView<ActivitydetailsController> {
  const ActivitydetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          backgroundColor: whitecolor,
          body: Stack(
            children: [
              _buildBackgroundImage(context, controller.index!, height, width,
                  controller.activity!),
              _buildBottomContainer(
                  context, height, width, controller.activity!),
            ],
          ),
        ),
        buildBottomButton(context, height, width, () {
          Get.toNamed(Routes.CHOOSEPACKAGE, arguments: controller.activity!);
        })
      ],
    );
  }

  Widget _buildBackgroundImage(BuildContext context, int index, double height,
      double width, Activity activity) {
    return Align(
      alignment: Alignment.topCenter,
      child: Obx(
        () => Stack(
          children: [
            Hero(
              tag: 'btn$index',
              child: Container(
                height: height * 0.42,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      activity.activityImages![controller.selectedimage.value]
                          .imageUrl!,
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.8,
                  ),
                  color: blackcolor,
                ),
              ),
            ),
            Column(
              children: [
                _buildHeaderRow(context, height, width),
                SizedBox(height: height * 0.18),
                Center(
                    child:
                        _buildImageSelector(context, height, width, activity)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderRow(BuildContext context, double height, double width) {
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.07,
        top: height * 0.05,
        right: width * 0.07,
      ),
      child: Row(
        mainAxisAlignment: mainbetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Iconsax.arrow_square_left4,
              color: whitecolor,
              size: 35,
            ),
          ),
          GestureDetector(
            onTap: () {
              bool isInWishList = controller.homeController.wishList.any(
                (wishItem) => wishItem.activity!.id == controller.activity!.id,
              );

              if (isInWishList) {
                // Get the activity ID from the featuredActivities
                final activityId = controller.activity!.id;

                // Remove from wishlist by activity ID
                controller.homeController.removeFromWishList(activityId!);
              } else {
                // Add to wishlist
                controller.homeController.addToWishList(
                  GetWishListData(
                    id: controller.activity!.id,
                    activity: controller.activity,
                  ),
                  context,
                );
              }
            },
            child: Obx(() {
              bool isInWishList = controller.homeController.wishList.any(
                (wishItem) => wishItem.activity!.id == controller.activity!.id,
              );

              return Icon(
                isInWishList ? Iconsax.heart5 : Iconsax.heart,
                size: 30,
                color: primarycolor,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSelector(
      BuildContext context, double height, double width, Activity activity) {
    return Padding(
      padding: EdgeInsets.only(right: width * 0.08, left: width * 0.08),
      child: Center(
        child: SizedBox(
          height: height * 0.07,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: activity.activityImages!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.selectedimage.value = index;
                  },
                  child: _buildImageSelectorItem(index, height, activity),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildImageSelectorItem(int index, double height, Activity activity) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: whitecolor,
          width: controller.selectedimage.value == index ? 3 : 2,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: SizedBox(
          width: controller.selectedimage.value == index
              ? height * 0.07
              : height * 0.06,
          height: controller.selectedimage.value == index
              ? height * 0.07
              : height * 0.06,
          child: CachedNetworkImage(
            imageUrl: activity.activityImages![index].imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomContainer(
      BuildContext context, double height, double width, Activity activity) {
    return Align(
      alignment: bottomcenter,
      child: ClipPath(
        clipper: BottomRoundedClipper(radius: 20),
        child: Container(
          decoration: const BoxDecoration(
            color: whitecolor,
          ),
          height: height * 0.61,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
              top: height * 0.01,
              right: width * 0.02,
              left: width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
                _buildBestsellerTag(),
                heightbox5,
                _buildTitleAndPriceRow(context, height, width, activity),
                heightbox5,
                _buildLocationAndRatingRow(
                  context,
                  height,
                  width,
                  activity,
                ),
                _buildGiftButton(context, height, width),
                _buildTabBarSection(context, height, width, activity),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBestsellerTag() {
    return Container(
      decoration: BoxDecoration(
        color: primarycolor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          "Bestseller",
          style: style.style(fontSize: 8, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildTitleAndPriceRow(
      BuildContext context, double height, double width, Activity activity) {
    return Row(
      crossAxisAlignment: crosstart,
      children: [
        cardTitle(width * 0.6, activity.name, 2, fontsize: 15.0),
        const Spacer(),
        Text(
          "AED ${activity.packages!.first.adultPrice}",
          style: style.style(
              color: primarycolor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildLocationAndRatingRow(
      BuildContext context, double height, double width, Activity activity) {
    return Row(
      crossAxisAlignment: crosscenter,
      mainAxisAlignment: maincenter,
      children: [
        locationwidget("DUBAI, UAE"),
        const Spacer(),
        rating(activity.averageRating, activity.numberOfReviews),
        const SizedBox(width: 5),
        activity.reviews!.isNotEmpty
            ? SizedBox(
                height: height * 0.041,
                width: width * 0.20,
                child: Stack(
                  children: [
                    for (int i = 0; i < min(activity.reviews!.length, 3); i++)
                      Positioned(
                        left: (i * (1 - .5) * 40).toDouble(),
                        top: 0,
                        child: CircleAvatar(
                          backgroundColor: primarycolor,
                          radius: 13,
                          child: CachedNetworkImage(
                            imageUrl: activity.reviews![i].user!.profilePicUrl!,
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 12,
                              backgroundImage: imageProvider,
                            ),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }

  Widget _buildGiftButton(BuildContext context, double height, double width) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.SENDGIFT);
      },
      child: Container(
        height: height * 0.06,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(
            children: [
              SizedBox(width: width * 0.01),
              const Icon(
                Iconsax.gift,
                color: primarycolor,
              ),
              const SizedBox(width: 10),
              Text(
                gifttext,
                style: style.style(
                    color: primarycolor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: primarycolor,
                size: 17,
              ),
              SizedBox(width: width * 0.03),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBarSection(
      BuildContext context, double height, double width, Activity activity) {
    return Flexible(
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: TabBar(
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.only(left: 0, right: width * 0.05),
                labelColor: primarycolor,
                unselectedLabelColor: unselectedtabcolor,
                indicatorColor: primarycolor,
                indicatorSize: TabBarIndicatorSize.label,
                labelStyle:
                    style.style(fontSize: 14, fontWeight: FontWeight.w800),
                unselectedLabelStyle:
                    style.style(fontSize: 13, fontWeight: FontWeight.w600),
                tabs: [
                  Tab(text: ovrviewtab),
                  Tab(text: tourplantab),
                  Tab(text: essentialstab),
                  Tab(text: reviewstab),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                      child: Column(
                    children: [
                      heightbox10,
                      Container(
                        width: double.infinity,
                        padding:
                            defaultpad, // Replace with your custom EdgeInsets
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(
                              8), // Equivalent to .roundedSM
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 16,
                          runSpacing: 10,
                          children: [
                            activity.features!.any((e) =>
                                    e.name == Feature.INSTANT_CONFIRMATION.name)
                                ? Aboutwidget(
                                    height: height,
                                    width: width,
                                    iconname: Iconsax.tick_circle,
                                    text: instantconf,
                                  )
                                : const SizedBox.shrink(),
                            Aboutwidget(
                              height: height,
                              width: width,
                              iconname: Iconsax.clock,
                              text: "Start Time: ${activity.startTime}",
                            ),
                            Aboutwidget(
                              height: height,
                              width: width,
                              iconname: Iconsax.clock,
                              text:
                                  "Duration: ${(int.parse(activity.duration!) > 12) ? {
                                      ("${activity.duration!} Days".tr)
                                    } : ("${activity.duration!} Hours")}",
                            ),
                            activity.features!.any(
                                    (e) => e.name == Feature.HOTEL_PICK_UP.name)
                                ? Aboutwidget(
                                    height: height,
                                    width: width,
                                    iconname: Iconsax.location,
                                    text: hotelpickup,
                                  )
                                : const SizedBox.shrink(),
                            activity.features!.any((e) =>
                                    e.name ==
                                    Feature.PRIVATE_GROUP_AVAILABLE.name)
                                ? Aboutwidget(
                                    height: height,
                                    width: width,
                                    iconname: Iconsax.people,
                                    text: "Private Group Available",
                                  )
                                : const SizedBox.shrink(),
                            activity.features!
                                    .any((e) => e.name == Feature.ENGLISH.name)
                                ? Aboutwidget(
                                    height: height,
                                    width: width,
                                    iconname: Iconsax.global,
                                    text: "Language: English",
                                  )
                                : const SizedBox.shrink(),
                            activity.features!.any((e) =>
                                    e.name ==
                                    Feature
                                        .PRESENT_MOBILE_OR_PRINTED_VOUCHER.name)
                                ? Aboutwidget(
                                    height: height,
                                    width: width,
                                    iconname: Iconsax.printer,
                                    text: "Present Mobile or Printed Voucher",
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      _buildTabContent(height, width, activity),
                    ],
                  )),
                  SingleChildScrollView(
                      child: _buildTabContenttourplan(height, width, activity)),
                  SingleChildScrollView(
                      child:
                          _buildTabContentessentails(height, width, activity)),
                  SingleChildScrollView(
                      child: reviewstabs(height, width, activity)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(double height, double width, Activity activity) {
    return Padding(
      padding: pad14,
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          Text(
            description,
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          html.HtmlWidget(
            activity.description!,
            textStyle: style.style(fontSize: 12),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildTabContenttourplan(
      double height, double width, Activity activity) {
    return Padding(
      padding: pad14,
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          Text(
            itinrary,
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          html.HtmlWidget(
            activity.itinerary!,
            textStyle: style.style(fontSize: 12),
          ),
          heightbox10,
          Text(
            highlights,
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          html.HtmlWidget(
            activity.highlights!,
            textStyle: style.style(fontSize: 12),
          ),
          heightbox10,
          Text(
            included,
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          html.HtmlWidget(
            activity.whatsIncluded!,
            textStyle: style.style(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Text(
            excluded,
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          html.HtmlWidget(
            activity.whatsNotIncluded!,
            textStyle: style.style(fontSize: 12),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _buildTabContentessentails(
      double height, double width, Activity activity) {
    return Padding(
      padding: pad14,
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          heightbox10,
          Text(
            "Instructions",
            style: style.style(
                color: blackcolor, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Column(
            children: List.generate(activity.instructions!.length, (index) {
              return ExpansionTile(
                dense: true,
                tilePadding: EdgeInsets.zero,
                childrenPadding: EdgeInsets.zero,
                title: Text(
                  activity.instructions![index].instructionTitle!,
                  style:
                      style.style(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                children: [
                  html.HtmlWidget(
                    activity.instructions![index].instructionDescription!,
                    textStyle: style.style(fontSize: 12),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget reviewstabs(height, width, Activity activity) {
    return SingleChildScrollView(
      child: Padding(
          padding: screenpad,
          child: Column(
              crossAxisAlignment: crosstart,
              children: List.generate(activity.reviews!.length, (index) {
                return Container(
                  padding: defaultpad,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: radius10,
                    color: whitecolor,
                  ),
                  child: Row(
                    crossAxisAlignment: crosstart,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                            activity.reviews![index].user!.profilePicUrl!),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 12, top: 5),
                          child: Column(
                            crossAxisAlignment: crosstart,
                            children: [
                              Text(
                                "${activity.reviews![index].user!.firstName!} ${activity.reviews![index].user!.lastName!}",
                                style: style.style(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: blackcolor),
                              ),
                              heightbox5,
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(
                                        activity.reviews![index].rating!,
                                        (index) {
                                      return const Icon(
                                        Icons.star,
                                        color: primarycolor,
                                        size: 12,
                                      );
                                    }),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    activity.reviews![index].createdAt!
                                        .toString(),
                                    style: style.style(
                                        fontSize: 10,
                                        color: blackcolor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                width: width * 0.60,
                                child: Text(
                                  activity.reviews![index].comment!,
                                  textAlign: justify,
                                  style: style.style(
                                      fontSize: 11,
                                      color: textfieldgrey,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                );
              }))),
    );
  }
}

class BottomRoundedClipper extends CustomClipper<Path> {
  final double radius;

  BottomRoundedClipper({required this.radius});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ),
    );
    path.addRect(
        Rect.fromLTRB(0, size.height - radius, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Bullets extends StatelessWidget {
  const Bullets({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0, right: 7),
            child: Container(
              decoration: BoxDecoration(
                  color: primarycolor, borderRadius: BorderRadius.circular(50)),
              height: 7,
              width: 7,
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: style.style(color: const Color(0xff4f545A), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Included extends StatelessWidget {
  const Included({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 7),
            child: SizedBox(
              height: 15,
              width: 15,
              child: Icon(
                Iconsax.tick_square,
                color: Color.fromARGB(255, 31, 81, 61),
                size: 15,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.justify,
              style: style.style(color: const Color(0xff4f545A), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Excluded extends StatelessWidget {
  const Excluded({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: mainstart,
        crossAxisAlignment: crosstart,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 7),
            child: SizedBox(
              height: 15,
              width: 15,
              child: Icon(
                Iconsax.close_square,
                color: redColor,
                size: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              textAlign: justify,
              style: style.style(color: const Color(0xff4f545A), fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Aboutwidget extends StatelessWidget {
  const Aboutwidget({
    super.key,
    required this.height,
    required this.width,
    required this.iconname,
    required this.text,
  });

  final double width;
  final double height;
  final IconData iconname;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero, // Add some padding for better spacing

      child: Row(
        mainAxisSize:
            MainAxisSize.min, // Ensures the Row takes only needed space
        children: [
          Icon(
            iconname,
            color: primarycolor,
            size: 15,
          ),
          const SizedBox(width: 10), // Use SizedBox for spacing
          Text(
            text,
            style: GoogleFonts.dmSans(
              color: darkgrey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
