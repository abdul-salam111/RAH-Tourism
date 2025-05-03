
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:u_credit_card/u_credit_card.dart';
import '../../../../res/exports.dart';
import '../../../../widgets/exports.dart';
import '../controllers/carddetails_controller.dart';

class CarddetailsView extends GetView<CarddetailsController> {
  CarddetailsView({super.key});
  InputDecoration inputDecoration(
    String hint, {
    bool? filled = true,
    EdgeInsets? contentPadding = const EdgeInsets.only(left: 10),
    Widget? suffixIcon,
  }) {
    return InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        hintStyle: style(
            color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primarycolor, width: 2),
          borderRadius: radius10,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 1.5),
          borderRadius: radius10,
        ),
        contentPadding: contentPadding,
        fillColor: const Color(0xffF7F7F7).withOpacity(0.3),
        filled: filled);
  }

  Widget richText(String label, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: style(
                color: const Color(0xff83827F),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
          if (isRequired)
            TextSpan(
              text: "﹡",
              style: style(color: redColor),
            ),
        ],
      ),
    );
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 7),
            child: GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  controller.insertcardData(context);
                } else {}
              },
              child: Container(
                height: size.height * 0.06,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primarycolor, // Adjust the color as needed
                  borderRadius:
                      BorderRadius.circular(12), // Adjust the radius as needed
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "SAVE",
                      style: style(
                        color: Colors.white,
                        fontSize: 18.0, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.w700, // Adjust the font weight as needed
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: ListView(
            padding: const EdgeInsets.only(left: 8, right: 8),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: appbar("ADD NEW CARD", 10),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CarddetailsController>(builder: (ctr) {
                return CreditCardUi(
                  width: size.width,
                  backgroundDecorationImage: const DecorationImage(
                      image: AssetImage("assets/icons/bgr.png"),
                      fit: BoxFit.cover),
                  enableFlipping: true,
                  showValidFrom: false,
                  cardHolderFullName: ctr.cardholderName.value.text,
                  cardNumber: ctr.cardNumber.value.text,
                  validThru: ctr.cardExpiry.value.text,
                  cvvNumber: ctr.cardCvv.value.text,
                  placeNfcIconAtTheEnd: true,
                );
              }),
              Form(
                key: formKey,
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: pad14,
                      decoration: BoxDecoration(
                          color: whitecolor, borderRadius: radius10),
                      child: Column(
                        crossAxisAlignment: crosstart,
                        children: [
                          Center(
                            child: Text(
                              'Enter Your card details',
                              style: style(
                                fontWeight: FontWeight.bold,
                                color: blackcolor,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          heightbox10,
                          richText("Card Holder Name", isRequired: true),
                          heightbox3,
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Card Holder Name is required';
                              }
                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^[a-zA-Z\s]+$')),
                            ],
                            textCapitalization: TextCapitalization.words,
                            onChanged: (val) {
                              controller.update();
                            },
                            controller: controller.cardholderName.value,
                            style: style(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            decoration: inputDecoration("Enter your full name"),
                          ),
                          heightbox10,

                          // Email Field
                          richText("Card Number", isRequired: true),
                          heightbox3,
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Card Number is required';
                              }
                              if (value.length < 19) {
                                // Assuming the formatted length is 19 (16 digits + 3 spaces)
                                return 'Please enter a valid card number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [CreditCardFormatter()],
                            onChanged: (val) {
                              controller.update();
                              var types = detectCCType(val);
                              controller.cardtype.value.text = types.first.type;
                            },
                            controller: controller.cardNumber.value,
                            style: style(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                            decoration: inputDecoration("1234 5678 9012 3456"),
                          ),
                          heightbox10,

                          // Email Field
                          Row(
                            mainAxisAlignment: mainbetween,
                            children: [
                              Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  richText("Expire Date", isRequired: true),
                                  heightbox3,
                                  SizedBox(
                                    width: size.width * 0.4,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Expiry Date is required';
                                        }
                                        if (!RegExp(
                                                r'^(0[1-9]|1[0-2])\/[0-9]{2}$')
                                            .hasMatch(value)) {
                                          return 'Please enter a valid expiry date (MM/YY)';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [ExpiryDateFormatter()],
                                      onChanged: (val) {
                                        controller.update();
                                      },
                                      controller: controller.cardExpiry.value,
                                      style: style(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                      decoration: inputDecoration("MM/YY"),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: crosstart,
                                children: [
                                  richText("CVV", isRequired: true),
                                  heightbox3,
                                  SizedBox(
                                    width: size.width * 0.4,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'CVV is required';
                                        }
                                        if (value.length != 3) {
                                          return 'Please enter a valid CVV';
                                        }
                                        return null;
                                      },
                                      onTap: () {
                                        controller.cvvopen.value = true;
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly, // Allow only digits
                                        LengthLimitingTextInputFormatter(
                                            3), // Limit to 3 digits
                                      ],
                                      obscureText: true,
                                      obscuringCharacter: "*",
                                      keyboardType: TextInputType.number,
                                      onChanged: (val) {
                                        controller.update();
                                      },
                                      controller: controller.cardCvv.value,
                                      style: style(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500),
                                      decoration: inputDecoration("***"),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          heightbox10,
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: (size.height * 0.3),
              )
            ],
          )),
    );
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove all non-numeric characters
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit the input to 4 digits
    if (newText.length > 4) {
      newText = newText.substring(0, 4);
    }

    // Ensure the month does not exceed 12
    if (newText.length >= 2) {
      String month = newText.substring(0, 2);
      int monthValue = int.tryParse(month) ?? 0;

      if (monthValue > 12) {
        // Replace invalid month with the old value to prevent exceeding 12
        return oldValue;
      }
    }

    // Format the text with '/' after the second digit
    String formattedText = newText;
    if (newText.length >= 3) {
      formattedText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

class CreditCardFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any non-numeric characters and spaces
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Limit the input to 16 digits
    if (newText.length > 16) {
      newText = newText.substring(0, 16);
    }

    // Split the input into groups of 4 digits
    List<String> groups = [];
    for (int i = 0; i < newText.length; i += 4) {
      int end = (i + 4 < newText.length) ? i + 4 : newText.length;
      groups.add(newText.substring(i, end));
    }

    // Join groups with a space
    String formattedText = groups.join(' ');

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
