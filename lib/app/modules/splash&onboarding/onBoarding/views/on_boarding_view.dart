import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:bookdubaisafari/app/widgets/robotfont.dart';
import 'package:bookdubaisafari/app/widgets/skipbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/exports.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: [
          Column(
            crossAxisAlignment: crosscenter,
            children: [
              skipButton(height * 0.08),
              SizedBox(
                height: (height * 0.12),
              ),
              Column(
                mainAxisAlignment: maincenter,
                children: [
                  Center(
                    child: Image.asset(
                      intro1,
                      width: width * 0.5, // Replace with your asset path
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  SizedBox(
                    width: width * 0.78,
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        Text(travebooking,
                            style: robotoFontStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.w900,
                                color: primarycolor)),
                        SizedBox(height: height * 0.01),
                        Text(
                          intro1description,
                          textAlign: justify,
                          style: style(
                            color: primarycolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.nextPage();
                          },
                          child: Container(
                            width: width * 0.8,
                            height: height * 0.06,
                            decoration: const BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.3, right: width * 0.3),
                              child: Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  Text(
                                    "Next",
                                    textAlign: justify,
                                    style: style(
                                      color: whitecolor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: whitecolor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    controller.nextPage();
                  },
                  child: Image.asset(
                    intro2, // Replace with your asset path
                  ),
                ),
              ),
              Positioned(
                top: height * 0.15,
                left: width * 0.1,
                child: Center(
                  child: Image.asset(
                    img2, // Replace with your asset path
                    width: width * 0.55,
                  ),
                ),
              ),
              skipButton(height * 0.08)
            ],
          ),
          Column(
            crossAxisAlignment: crosscenter,
            children: [
              skipButton(height * 0.08),
              SizedBox(
                height: (height * 0.17),
              ),
              Column(
                mainAxisAlignment: maincenter,
                children: [
                  Center(
                    child: Image.asset(
                      location, // Replace with your asset path

                      width: width * 0.7,
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: width * 0.7,
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        Text(
                          bestplace,
                          style: robotoFontStyle(
                            color: primarycolor,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          intro3Description,
                          textAlign: justify,
                          style: style(
                            color: primarycolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            controller.nextPage();
                          },
                          child: Container(
                            width: width * 0.8,
                            height: height * 0.06,
                            decoration: const BoxDecoration(
                                color: primarycolor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 0.2, right: width * 0.2),
                              child: Row(
                                mainAxisAlignment: mainbetween,
                                children: [
                                  Text(
                                    "Get Start",
                                    textAlign: justify,
                                    style: style(
                                      color: whitecolor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward,
                                    color: whitecolor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class OnboardingPage extends StatelessWidget {
//   // final String title;

//   final String image;

//   OnboardingPage({
//     // required this.title,
//     required this.image,
//   });
//   final controller = Get.put(OnBoardingController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 200,
//       child: Image.asset(
//         image,
//         fit: BoxFit.cover,
//       ),
//     );
//     // Container(
//     //     height: 100,
//     //     width: 100,
//     //     decoration: BoxDecoration(
//     //       image: DecorationImage(
//     //         image: AssetImage(
//     //           image,
//     //         ),
//     //         fit: BoxFit.cover,
//     //       ),
//     //     ),
//     //     child: Padding(
//     //       padding: const EdgeInsets.all(8.0),
//     //       child: Column(
//     //         mainAxisAlignment: mainend,
//     //         children: [
//     //           Image.asset(title),
//     //           context.heightbox(20),
//     //           Row(
//     //             mainAxisAlignment: MainAxisAlignment.center,
//     //             children: List.generate(
//     //               controller.onboardingData.length,
//     //               (index) => buildDot(index),
//     //             ),
//     //           ),
//     //           SizedBox(height: context.height / 12),
//     //           Obx(
//     //             () => CustomButton(
//     //               width: context.width / 1.2,
//     //               text: controller.currentPage < 2 ? "Next" : "Get Started  ",
//     //               onPressed: controller.nextPage,
//     //               height: 50,
//     //               radius: 10,
//     //             ),
//     //           ),
//     //           context.heightbox(40),
//     //         ],
//     //       ),
//     //     ));
//   }

//   Widget buildDot(int index) {
//     return Obx(
//       () => Container(
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         height: 10,
//         width: controller.currentPage.value == index ? 30 : 10,
//         decoration: BoxDecoration(
//           color: controller.currentPage.value == index
//               ? primarycolor
//               : Colors.grey,
//           borderRadius: BorderRadius.circular(5),
//         ),
//       ),
//     );
//   }

//}
