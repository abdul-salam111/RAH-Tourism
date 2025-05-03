import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../res/exports.dart';
import '../controllers/cities_actvities_controller.dart';

class CitiesActvitiesView extends GetView<CitiesActvitiesController> {
  const CitiesActvitiesView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(CitiesActvitiesController());
    return Scaffold(
        body: Padding(
            padding: screenpad,
            child: Column(
              children: [
                appbar("ACTIVITIES", width * 0.1),
                heightbox10,
                SizedBox(
                  height: height * 0.20,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 12),
                        child: Obx(() => GestureDetector(
                              onTap: () {
                                controller.selectedIndex.value = index;
                              },
                              child: Container(
                                height: height * 0.20,
                                width: width * 0.5,
                                decoration: BoxDecoration(
                                  borderRadius: radius10,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      index == 0
                                          ? "assets/images/4.webp"
                                          : index == 1
                                              ? "assets/images/5.webp"
                                              : "assets/images/3.jpeg",
                                    ),
                                    fit: BoxFit.cover,
                                    opacity: 0.7,
                                    colorFilter: const ColorFilter.mode(
                                      blackcolor,
                                      BlendMode.dstATop,
                                    ),
                                  ),
                                  border: Border.all(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? primarycolor
                                            : Colors.transparent,
                                    width: 3,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                      radius10, // To match the border radius
                                  child: Column(
                                    mainAxisAlignment:
                                        mainbetween, // mainbetween equivalent
                                    children: [
                                      Align(
                                        alignment: topright,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 5, bottom: 10),
                                          child: Container(
                                            padding:  pad5,
                                            decoration: BoxDecoration(
                                              color: primarycolor,
                                              borderRadius: radius10,
                                            ),
                                            margin:  pad5,
                                            child: Text(
                                              "46+ TOURS & 80+ Activities",
                                              textAlign: center,
                                              style: style(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 5, bottom: 10),
                                          child: Text(
                                            index == 0
                                                ? "Dubai"
                                                : index == 1
                                                    ? "Abu Dhabi"
                                                    : "Sharjah",
                                            textAlign: center,
                                            style: style(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: (height * 0.02),
                ),
                Row(
                  mainAxisAlignment: mainbetween,
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
                        borderRadius: radius10, // To make it rounded full
                      ),
                      child: const Icon(
                       Iconsax.filter,
                        color: primarycolor,
                        size: 20,
                      ),
                    )
                  ],
                ),
                heightbox10,
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: 10,
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
                                        height: height * 0.25,
                                        width: double.infinity,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/1.jpg",
                                                ),
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
                                      const Align(
                                        alignment: topright,
                                        child: Padding(
                                          padding: defaultpad,
                                          child: Icon(
                                           Iconsax.heart,
                                            color: whitecolor,
                                          ),
                                        ),
                                      )
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
                                          width * 0.7,
                                          "Dubai Half-Day City Tour ok how are your",
                                          2),
                                      heightbox3,
                                      Row(
                                        children: [
                                          rating(4, 4),
                                          const Spacer(),
                                          locationwidget("DUBAI, UAE")
                                        ],
                                      ),
                                      const Divider(color: greyColor),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(
                                            Iconsax.timer,
                                            size: 20,
                                            color: primarycolor,
                                          ),
                                          heightbox5,
                                          Text(
                                            "5 days",
                                            style: style(
                                                fontSize: 12,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            width: (width * 0.06),
                                          ),
                                          const Icon(
                                            Iconsax.people,
                                            size: 20,
                                            color: primarycolor,
                                          ),
                                          widthbox5,
                                          Text(
                                            "per person",
                                            style: style(
                                                fontSize: 12,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const Spacer(),
                                          Text(
                                            "From ",
                                            style: style(
                                                fontSize: 12,
                                                color: textfieldgrey,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          widthbox10,
                                          Text(
                                            "AED 110.0",
                                            style: style(
                                                fontSize: 15,
                                                color: primarycolor,
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ],
                                      ),
                                      heightbox10,
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
                )
              ],
            )));
  }
}
