import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bookdubaisafari/app/modules/paymentModule/paymentmethods/controllers/paymentmethods_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/postModels/savecardDetails.dart';
import '../../../../localdatabase/database.dart';

class CarddetailsController extends GetxController {
  final cardholderName = TextEditingController().obs;
  final cardNumber = TextEditingController().obs;
  final cardExpiry = TextEditingController().obs;
  final cardCvv = TextEditingController().obs;
  final bankName = TextEditingController().obs;
  final cardtype = TextEditingController().obs;
  var cvvopen = false.obs;
  final formkey = GlobalKey<FormState>();
  final DatabaseHelper dbHelper = DatabaseHelper();
  final paymentcontroller = Get.put(PaymentmethodsController());
  void insertcardData(context) async {
    final card = CardDetailsModel(
      cardHolderName: cardholderName.value.text.trim(),
      cardNumber: cardNumber.value.text.trim(),
      cvv: cardCvv.value.text.trim(),
      expiryDate: cardExpiry.value.text.trim(),
      cardType: cardtype.value.text.trim(),
    );
    await dbHelper.insertCard(card).then((val) {});
    const snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Done',
        message: 'Your card has been added!',

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    await paymentcontroller.getData();
    Get.back();
  }
}
