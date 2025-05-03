import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/snakbar.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/choosepackage_controller.dart';

class ChoosepackageView extends GetView<ChoosepackageController> {
  const ChoosepackageView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        bottomNavigationBar: SizedBox(
          height: context.height * 0.15,
          child: Padding(
            padding: defaultpad,
            child: Column(
              mainAxisAlignment: mainend,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.insertActivityData(controller.activity!);
                  },
                  child: Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primarycolor, // Button orange color
                      borderRadius: radius10, // Rounded edges
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          addtocartbtn,
                          style: style(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        widthbox10,
                        Obx(
                          () => Text(
                            'AED ${controller.totalprice.value}',
                            style: style(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: const Color(0XffF7F7F7),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                heightbox5,
                GestureDetector(
                  onTap: () {
                    if (sharedPrefbox.read(isLoggedin) == true) {
                      Get.toNamed(
                        Routes.ENTERBOOKINGINFORMATION,
                        arguments: [
                          Routes.CHOOSEPACKAGE,
                          controller.activity,
                          controller.activity!
                              .packages![controller.selectedPkg.value].id!,
                          controller
                                      .activity!
                                      .packages![controller.selectedPkg.value]
                                      .category!
                                      .name ==
                                  "SHARING"
                              ? controller
                                  .activity!
                                  .packages![controller.selectedPkg.value]
                                  .adultPrice
                              : controller
                                  .activity!
                                  .packages![controller.selectedPkg.value]
                                  .price,
                        ],
                      );
                    } else {
                      SnackbarHelper.showSnackbar(
                        context: context,
                        message: 'You need to signin before you make booking.',
                        actionLabel: 'Sign In',
                        textcolor: redColor,
                        onActionPressed: () {
                          Get.toNamed(Routes.SIGNIN, arguments: true);
                        },
                        backgroundColor: whitecolor,
                      );
                    }
                  },
                  child: Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: primarycolor, width: 2),
                      color: whitecolor, // Button orange color
                      borderRadius: radius10, // Rounded edges
                    ),
                    child: Center(
                      child: Text(
                        booknowbtn,
                        style: style(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: primarycolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: screenpad,
          children: [
            appbar(chosepkg, width * 0.04),
            SizedBox(
              height: (height * 0.01),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: height * 0.02,
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.02),
              decoration:
                  BoxDecoration(color: whitecolor, borderRadius: radius10),
              child: Column(
                children: [
                  Text(
                    "Select Package",
                    style: style(
                        fontWeight: FontWeight.bold,
                        color: darkgrey,
                        fontSize: 16),
                  ),
                  Container(
                    width: double.infinity,
                    padding: defaultpad,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffE5E5E5)),
                      borderRadius: radius10,
                    ),
                    child: Column(
                      children: List.generate(
                          controller.activity!.packages!.length, (index) {
                        return Container(
                          margin: defaultpad,
                          width: double.infinity,
                          padding: defaultpad,
                          decoration: BoxDecoration(
                              border: Border.all(color: darkGreyColor),
                              borderRadius: radius10),
                          child: Row(
                            mainAxisAlignment: mainaround,
                            crossAxisAlignment: crosstart,
                            children: [
                              SizedBox(
                                width: context.width * 0.6,
                                child: Column(
                                  crossAxisAlignment: crosstart,
                                  children: [
                                    Text(
                                      controller
                                          .activity!.packages![index].title!,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: style(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Package Type: ${controller.activity!.packages![index].category!.name}",
                                      style: style(fontSize: 12),
                                    ),
                                    controller.activity!.packages![index]
                                                .category!.name ==
                                            "SHARING"
                                        ? Column(
                                            crossAxisAlignment: crosstart,
                                            children: [
                                              Text(
                                                "Adult Price: AED ${controller.activity!.packages![index].adultPrice}",
                                                style: style(fontSize: 12),
                                              ),
                                              Text(
                                                "Child Price: AED ${controller.activity!.packages![index].childPrice}",
                                                style: style(fontSize: 12),
                                              ),
                                            ],
                                          )
                                        : Text(
                                            "Package Price: AED ${controller.activity!.packages![index].price}",
                                            style: style(fontSize: 12),
                                          ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.selectedPkg.value = index;
                                  if (controller.activity!.packages![index]
                                          .category!.name ==
                                      "SHARING") {
                                    controller.adultprice.value = double.parse(
                                        controller.activity!.packages![index]
                                            .adultPrice!);

                                    controller.childprice.value = double.parse(
                                        controller.activity!.packages![index]
                                            .childPrice!);
                                    controller.calculateTotal();
                                  } else {
                                    controller.adultprice.value = double.parse(
                                        controller
                                            .activity!.packages![index].price!);

                                    controller.childprice.value = double.parse(
                                        controller
                                            .activity!.packages![index].price!);
                                    controller.calculateTotal();
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: controller.selectedPkg.value == index
                                        ? const CircleAvatar(
                                            radius: 8,
                                            backgroundColor: primarycolor,
                                            child: Icon(
                                              Icons.check,
                                              color: whitecolor,
                                              size: 10,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                  heightbox10,
                  Text(
                    selectpersonanddate,
                    style: style(
                        fontWeight: FontWeight.bold,
                        color: darkgrey,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: (height * 0.02),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.calendar,
                        color: primarycolor,
                        size: 15,
                      ),
                      widthbox5,
                      Text(
                        selectdate,
                        style: style(
                            color: darkgrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  heightbox7,
                  Obx(
                    () => TextFormField(
                      controller: TextEditingController(
                          text: controller.selectedDate.value),
                      readOnly: true,
                      style: style(
                          color: darkgrey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        hintText: "mm/dd/yyyy",
                        hintStyle: style(
                            color: darkgrey,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffE5E5E5), width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xffE5E5E5), width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        suffixIcon: const Icon(
                          Iconsax.calendar,
                          color: Color(0xffA4A0B6),
                          size: 20,
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: 10, top: 17, bottom: 12),
                      ),
                      onTap: () => controller.selectDate(context),
                    ),
                  ),
                  heightbox10,
                  Row(
                    children: [
                      const Icon(
                        Iconsax.people,
                        color: primarycolor,
                        size: 15,
                      ),
                      widthbox5,
                      Text(
                        selectepersons,
                        style: style(
                            color: darkgrey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  heightbox7,
                  Container(
                    height: height * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: radius10,
                        border: Border.all(
                            color: const Color(0xffE5E5E5), width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                              "${'Adults'.tr} (AED ${controller.adultprice})",
                              style: style(
                                  color: darkgrey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (controller.selectedAdults.value != 1) {
                                controller.selectedAdults.value =
                                    controller.selectedAdults.value - 1;
                                controller.calculateTotal();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                          Obx(
                            () => SizedBox(
                              width: width * 0.08,
                              child: Center(
                                child: Text(
                                  "${controller.selectedAdults < 10 ? '0${controller.selectedAdults}' : controller.selectedAdults}",
                                  style: style(
                                      color: blackcolor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedAdults.value =
                                  controller.selectedAdults.value + 1;
                              controller.calculateTotal();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightbox10,
                  Container(
                    height: height * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: radius10,
                        border: Border.all(
                            color: const Color(0xffE5E5E5), width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: [
                          Obx(
                            () => Text(
                                "${'Childs'.tr} (AED ${controller.childprice})",
                                style: style(
                                    color: darkgrey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (controller.selectedChilds.value != 0) {
                                controller.selectedChilds.value =
                                    controller.selectedChilds.value - 1;
                                controller.calculateTotal();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                          Obx(
                            () => SizedBox(
                              width: width * 0.08,
                              child: Center(
                                child: Text(
                                  "${controller.selectedChilds < 10 ? '0${controller.selectedChilds}' : controller.selectedChilds}",
                                  style: style(
                                      color: blackcolor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedChilds.value =
                                  controller.selectedChilds.value + 1;
                              controller.calculateTotal();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightbox10,
                  Container(
                    height: height * 0.065,
                    decoration: BoxDecoration(
                        borderRadius: radius10,
                        border: Border.all(
                            color: const Color(0xffE5E5E5), width: 1.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8),
                      child: Row(
                        children: [
                          Text(
                            infantprice,
                            style: style(
                                color: darkgrey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (controller.selectedInfants.value != 0) {
                                controller.selectedInfants.value =
                                    controller.selectedInfants.value - 1;
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.remove,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                          Obx(
                            () => SizedBox(
                              width: width * 0.08,
                              child: Center(
                                child: Text(
                                  "${controller.selectedInfants < 10 ? '0${controller.selectedInfants}' : controller.selectedInfants}",
                                  style: style(
                                      color: blackcolor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.selectedInfants.value =
                                  controller.selectedInfants.value + 1;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(7)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  heightbox10,
                  const Divider(
                    color: greyColor,
                  ),
                  Row(
                    children: [
                      Text(
                        totalprice,
                        style: style(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: blackcolor),
                      ),
                      const Spacer(),
                      Text(
                        "AED",
                        style: style(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: primarycolor),
                      ),
                      widthbox5,
                      Obx(
                        () => Text(
                          controller.totalprice.value.toString(),
                          style: style(
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: primarycolor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: (height * 0.02),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: height * 0.02,
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.02),
              decoration:
                  BoxDecoration(color: whitecolor, borderRadius: radius10),
              child: Column(
                children: [
                  SizedBox(
                    height: (height * 0.01),
                  ),
                  Text(
                    bookingdetails,
                    style: style(
                        fontWeight: FontWeight.bold,
                        color: blackcolor,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: (height * 0.03),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.calendar,
                        color: primarycolor,
                        size: 20,
                      ),
                      widthbox10,
                      Text(
                        bookingdate,
                        style: style(
                            color: const Color(0xff4E4E4E),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          controller.selectedDate.value,
                          style: style(
                              color: const Color(0xff4E4E4E),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  widthbox10,
                  const Divider(
                    color: greyColor,
                  ),
                  widthbox10,
                  Row(
                    children: [
                      const Icon(
                        Iconsax.people,
                        color: primarycolor,
                        size: 20,
                      ),
                      widthbox10,
                      Text(
                        persons,
                        style: style(
                            color: const Color(0xff4E4E4E),
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Obx(
                        () => Text(
                          "${controller.selectedAdults.value != 0 ? "${controller.selectedAdults.value} ${"Adults".tr}" : ""}, ${controller.selectedChilds.value != 0 ? "${controller.selectedChilds.value} ${"Childs".tr}" : ""}, ${controller.selectedInfants.value != 0 ? "${controller.selectedInfants.value} Infants" : ""}",
                          style: style(
                              color: const Color(0xff4E4E4E),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  widthbox10,
                ],
              ),
            ),
            SizedBox(
              height: height * 0.2,
            ),
          ],
        ));
  }
}
