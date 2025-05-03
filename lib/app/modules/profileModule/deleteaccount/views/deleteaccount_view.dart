import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/deleteaccount_controller.dart';

class DeleteaccountView extends GetView<DeleteaccountController> {
  const DeleteaccountView({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final height002 = SizedBox(
      height: (height * 0.02),
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
            body: Padding(
          padding: screenpad,
          child: Column(
            children: [
              appbar("DELETE ACCOUNT".tr, width * 0.01),
              height002,
              Image.asset(
                "assets/icons/delete.png",
                width: width * 0.6,
                height: height * 0.2,
              ),
              height002,
              Column(
                crossAxisAlignment: crosstart,
                children: [
                  heightbox10,
                  Text("Delete Account".tr,
                      style: style(
                          color: const Color(0xffff494f),
                          fontWeight: FontWeight.w600)),
                  heightbox10,
                  Text(
                    "We’re really sorry to see you go. Are you sure you want to delete your account? Once you confirm, your data will gone.".tr,
                    style: style(color: textfieldgrey, fontSize: 12),
                  ),
                  height002,
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.options.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              // Radio Button
                              Obx(
                                () => Radio<int>(
                                  value: index,
                                  groupValue: controller.selectedOption.value,
                                  onChanged: (value) {
                                    controller.selectedOption.value = value!;
                                  },
                                  activeColor: Colors.red,
                                ),
                              ),

                              // Text Option
                              Expanded(
                                child: Text(
                                  controller.options[index].tr,
                                  style: style(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: blackcolor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 5),
          child: CustomButton(
            color: const Color(0xffff494f),
            text: "Delete Account".tr,
            onPressed: () {
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
                      padding: pad5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: (height * 0.06),
                          ),
                          const Icon(
                            Iconsax.warning_2,
                            color: Color(0xffff494f),
                            size: 70,
                          ),
                          SizedBox(
                            height: (height * 0.03),
                          ),
                          Text(
                            "Are you sure, you want to delete account".tr,
                            textAlign: TextAlign.center,
                            style: style(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: textfieldgrey),
                          ),
                          SizedBox(
                            height: (height * 0.04),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 7),
                            child: Row(
                              mainAxisAlignment: mainaround,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xffff494f), // Adjust the color as needed
                                      borderRadius: BorderRadius.circular(
                                          6), // Adjust the radius as needed
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          "Done".tr,
                                          style: style(
                                            color: Colors.white,
                                            fontSize:
                                                13.0, // Adjust the font size as needed
                                            fontWeight: FontWeight
                                                .w700, // Adjust the font weight as needed
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: height * 0.05,
                                    width: width * 0.3,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: greyColor),
                                      borderRadius: BorderRadius.circular(
                                          6), // Adjust the radius as needed
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          "Back".tr,
                                          style: style(
                                            color: textfieldgrey,
                                            fontSize:
                                                13.0, // Adjust the font size as needed
                                            fontWeight: FontWeight
                                                .w700, // Adjust the font weight as needed
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
                )),
              );
            },
            height: height * 0.07,
            width: double.infinity,
          ),
        ),
      ],
    );
  }
}
