import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';

import '../../../../widgets/exports.dart';
import '../controllers/editbookings_controller.dart';

class EditbookingsView extends GetView<EditbookingsController> {
  const EditbookingsView({super.key});
  @override
  Widget build(BuildContext context) {
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
              body: Padding(
            padding: screenpad,
            child: Column(
              children: [
                appbar("Edit Booking".tr, context.width * 0.1),
                heightbox10,
                heightbox10,
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
                      contentPadding:
                          const EdgeInsets.only(left: 10, top: 17, bottom: 12),
                    ),
                    onTap: () => controller.selectDate(context),
                  ),
                ),
                heightbox10,
                heightbox10,
                Row(
                  children: [
                    const Icon(
                      Iconsax.location,
                      color: primarycolor,
                      size: 15,
                    ),
                    widthbox5,
                    Text(
                      "Pickup Location",
                      style: style(
                          color: darkgrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                heightbox7,
                TextFormField(
                  controller: controller.pickupLocation.value,
                  style: style(color: Colors.black, fontSize: 13),
                  validator: Validators.validation("Pickup Location"),
                  decoration: InputDecoration(
                    hintText: controller.pickupLocation.value.text,
                    hintStyle: style(color: Colors.grey, fontSize: 13),
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
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.05,
                ),
                CustomButton(
                  text: "Confirm",
                  onPressed: () async {

                    await controller.editBookings();
                  },
                  color: primarycolor,
                  textcolor: whitecolor,
                  height: 45,
                  width: double.infinity,
                )
              ],
            ),
          )),
        ));
  }
}
