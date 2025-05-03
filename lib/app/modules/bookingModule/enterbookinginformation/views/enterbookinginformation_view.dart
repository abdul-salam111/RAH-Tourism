import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../res/exports.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/exports.dart';
import '../controllers/enterbookinginformation_controller.dart';

// ignore: must_be_immutable
class EnterbookinginformationView
    extends GetView<EnterbookinginformationController> {
  EnterbookinginformationView({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var primaryborder = const OutlineInputBorder(
    borderSide: BorderSide(color: primarycolor, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  var whiteborder = const OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffE5E5E5), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );
  // Input decoration for text fields
  InputDecoration inputDecoration(String hint,
      {bool filled = true, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      suffixIcon: suffixIcon,
      hintStyle: style(color: Colors.grey, fontSize: 13),
      focusedBorder: primaryborder,
      enabledBorder: whiteborder,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      fillColor: const Color(0xffF7F7F7).withOpacity(0.3),
      filled: filled,
    );
  }

  // Reusable RichText widget for labels
  Widget richText(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: label,
              style: style(
                  color: const Color(0xff83827F),
                  fontSize: 12,
                  fontWeight: FontWeight.bold)),
          if (isRequired)
            const TextSpan(
              text: "﹡",
              style: TextStyle(color: redColor),
            ),
        ],
      ),
    );
  }

  // Section title widget
  Widget sectionTitle(String title, {double fontSize = 16}) {
    return Center(
      child: Text(
        title,
        style: style(
          fontWeight: FontWeight.bold,
          color: darkgrey,
          fontSize: fontSize,
        ),
      ),
    );
  }

  // Reusable form field widget
  Widget formField(
    TextEditingController texteditingcontroller,
    String hint, {
    VoidCallback? ontap,
    bool isReadOnly = false,
    Widget? suffixIcon,
    int maxLines = 1,
    String? Function(String?)? validator, // Add validator parameter
  }) {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      controller: texteditingcontroller,
      onTap: ontap,
      readOnly: isReadOnly,
      maxLines: maxLines,
      style: style(color: Colors.black, fontSize: 13),
      decoration: inputDecoration(
        hint,
        suffixIcon: suffixIcon,
      ),
      validator: validator, // Pass the validator to TextFormField
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: bottomcenter,
      children: [
        GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: whitecolor,
            body: ListView(
              padding: screenpad,
              children: [
                appbar(bookingdetailscapital, size.width * 0.02),
                SizedBox(height: size.height * 0.02),
                sectionTitle(personalInfo),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: crosstart,
                    children: [
                      richText("Title", isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      formField(controller.titleController.value, "Enter Title",
                          validator: Validators.validation('Title')),
                      SizedBox(height: size.height * 0.015),
                      richText("First Name", isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      formField(controller.firstnameController.value,
                          "Enter First Name",
                          validator: Validators.validation('First Name')),
                      SizedBox(height: size.height * 0.015),
                      richText("Last Name", isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      formField(controller.lasttnameController.value,
                          "Enter Last Name",
                          validator: Validators.validation('Last Name')),
                      SizedBox(height: size.height * 0.015),
                      richText(emailLabels, isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      formField(controller.emailaddressController.value,
                          enterEmailHint,
                          validator: Validators.validation('Email')),
                      SizedBox(height: size.height * 0.015),
                      richText(nationalityLabel, isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      GetBuilder<EnterbookinginformationController>(
                        builder: (cont) => TextFormField(
                          controller: cont.selectedCountry.value,
                          onTap: () async {
                            var pickedcountry = await controller
                                .countryPickerWithParams
                                .showPicker(context: context);
                            cont.selectedCountry.value.text =
                                pickedcountry!.name;
                            cont.selectedCountrycode.value.text =
                                pickedcountry.code;
                            cont.selectedcountrydialcodeController.value.text =
                                pickedcountry.dialCode;
                            cont.update();
                          },
                          readOnly: true,
                          style: style(color: Colors.black, fontSize: 13),
                          validator: Validators.validation('Country'),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: defaultpad,
                              child: CountryCodeFlagWidget(
                                  width: 10,
                                  alignment: Alignment.center,
                                  countryCode: CountryCode(
                                      name: cont.selectedCountry.value.text,
                                      code: cont.selectedCountrycode.value.text,
                                      dialCode: cont
                                          .selectedcountrydialcodeController
                                          .value
                                          .text)),
                            ),
                            suffixIcon: const Icon(
                              Iconsax.arrow_down_14,
                              color: textfieldgrey,
                            ),
                            hintStyle: style(color: Colors.grey, fontSize: 13),
                            focusedBorder: primaryborder,
                            enabledBorder: whiteborder,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            fillColor: const Color(0xffF7F7F7).withOpacity(0.3),
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.015),
                      richText(mobileNumberLabel, isRequired: true),
                      SizedBox(height: size.height * 0.01),
                      GetBuilder<EnterbookinginformationController>(
                          builder: (cont) => Container(
                                padding: const EdgeInsets.only(left: 7),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffE5E5E5),
                                      width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        var pickedcountry = await controller
                                            .countryPickerWithParams
                                            .showPicker(context: context);

                                        cont
                                            .selectedcountrydialcodeControllerforMobile
                                            .value
                                            .text = pickedcountry!.dialCode;
                                        cont.update();
                                      },
                                      child: Text(
                                        cont.selectedcountrydialcodeControllerforMobile
                                            .value.text
                                            .toString(),
                                        style: style(color: blackcolor),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      color: textfieldgrey,
                                      height: 20,
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        validator: Validators.validation(
                                            'Mobile Number'),
                                        keyboardType: TextInputType.number,
                                        controller: controller
                                            .mobilenumberController.value,
                                        style: style(
                                            color: Colors.black, fontSize: 13),
                                        decoration: InputDecoration(
                                          hintText: entermobilenumber,
                                          hintStyle: style(
                                              color: Colors.grey, fontSize: 13),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 12),
                                          fillColor: const Color(0xffF7F7F7)
                                              .withOpacity(0.3),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                      SizedBox(height: size.height * 0.015),
                      richText(commentLabel),
                      SizedBox(height: size.height * 0.01),
                      formField(
                        controller.commentController.value,
                        enterCommentHint,
                        maxLines: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.04),

                // Pick-up Service Section
                sectionTitle(pickUpServiceTitle),
                SizedBox(height: size.height * 0.02),
                Container(
                  padding: defaultpad,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff7f7f7),
                  ),
                  child: Column(
                    crossAxisAlignment: crosstart,
                    children: [
                      Row(
                        children: [
                          locationicon,
                          SizedBox(width: size.width * 0.01),
                          Text(
                            pickUpLocationLabel,
                            style: style(
                                color: const Color(0xff83827F),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.pickupLocation.value,
                              style: style(color: Colors.black, fontSize: 13),
                              validator:
                                  Validators.validation("Pickup Location"),
                              decoration: InputDecoration(
                                hintText: searchlocation,
                                hintStyle:
                                    style(color: Colors.grey, fontSize: 13),
                                focusedBorder: primaryborder,
                                enabledBorder: whiteborder,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                fillColor: whitecolor,
                                filled: true,
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.025),
                          Container(
                            width: size.width * 0.2,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.my_location,
                              color: primarycolor,
                              size: size.width * 0.06,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.015),
                      Row(
                        children: [
                          const Icon(
                            Iconsax.note_1,
                            color: primarycolor,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          richText(noteLabel),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormField(
                        maxLines: 6,
                        controller: controller.noteController.value,
                        style: style(color: Colors.black, fontSize: 13),
                        decoration: InputDecoration(
                          hintText: enterspecialrequest,
                          hintStyle: style(color: Colors.grey, fontSize: 13),
                          focusedBorder: primaryborder,
                          enabledBorder: whiteborder,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                          fillColor: whitecolor,
                          filled: true,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: (size.height * 0.1),
                ),
              ],
            ),
          ),
        ),
        buildBottomButton(context, size.height, size.width, () {
          if (formKey.currentState!.validate()) {
            if (Get.arguments[0] == Routes.CHOOSEPACKAGE) {
              Get.toNamed(Routes.BOOKINGCONFIRMATION, arguments: [
                Routes.CHOOSEPACKAGE,
                controller.activity,
                Get.arguments[2],
                Get.arguments[3]
              ]);
            } else {
              Get.toNamed(Routes.BOOKINGCONFIRMATION, arguments: [
                Routes.CART,
                controller.activity,
                Get.arguments[1]
              ]);
            }
          }
        })
      ],
    );
  }
}
