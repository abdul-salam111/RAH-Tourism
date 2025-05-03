import 'dart:convert';
import 'package:bookdubaisafari/app/data/getModels/getCartData.dart';
import 'package:bookdubaisafari/app/data/postModels/bookingDetails.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/bookings/controllers/bookings_controller.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/choosepackage/controllers/choosepackage_controller.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/enterbookinginformation/controllers/enterbookinginformation_controller.dart';
import 'package:bookdubaisafari/app/modules/cartmodule/cart/controllers/cart_controller.dart';
import 'package:bookdubaisafari/app/repositories/bookingRepo.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../data/getModels/getSubCategories.dart';

class BookingconfirmationController extends GetxController {
  final isEditGuest = false.obs;
  final isEditDate = false.obs;
  final isEditlocation = false.obs;
  final isEditNote = false.obs;
  var isLoading = false.obs;
  BookingRepository bookingRepository = BookingRepository();
  late ChoosepackageController packagecontroller;
  late EnterbookinginformationController bookinginformationController;
  String? paymentFlow;
  Activity activity = Activity();
  GetCartDataModel getCartDataModel = GetCartDataModel();
  var isChecked = false.obs; // Observable for the checkbox
  String? pkgId; //for booking used in below function
  String? pkgPrice;
  String? totalAmount;
  String? selectedDate;
  String? adults;
  String? childs;
  String? infants;
  String? firstName;
  String? lastName;
  String? email;
  String? title;
  String? nationality;
  String? phoneNumber;
  String? pickupLocation;
  String? note;
  String? specialRequest;
  @override
  void onInit() {
    super.onInit();
    paymentFlow = Get.arguments[0];
    if (paymentFlow == Routes.CHOOSEPACKAGE) {
      packagecontroller = Get.put(ChoosepackageController());
      bookinginformationController =
          Get.put(EnterbookinginformationController());
      activity = Get.arguments[1] as Activity;
      pkgId = Get.arguments[2].toString();
      pkgPrice = Get.arguments[3].toString();
      totalAmount = packagecontroller.totalprice.value.toString();
      selectedDate = packagecontroller.selectedDate.value;
      adults = packagecontroller.selectedAdults.value.toString();
      childs = packagecontroller.selectedChilds.value.toString();
      infants = packagecontroller.selectedInfants.value.toString();
    } else {
      bookinginformationController =
          Get.put(EnterbookinginformationController());
      activity = Get.arguments[1] as Activity;
      getCartDataModel = Get.arguments[2] as GetCartDataModel;
      pkgId = getCartDataModel.package!.id.toString();
      pkgPrice = getCartDataModel.packageType == "SHARING"
          ? getCartDataModel.package!.adultPrice.toString()
          : getCartDataModel.package!.price.toString();
      totalAmount = getCartDataModel.totalPrice.toString();
      selectedDate = getCartDataModel.date.toString();
      adults = getCartDataModel.adults.toString();
      childs = getCartDataModel.childs.toString();
      infants = getCartDataModel.infants.toString();
    }
    firstName =
        bookinginformationController.firstnameController.value.text.toString();
    lastName =
        bookinginformationController.lasttnameController.value.text.toString();
    email = bookinginformationController.emailaddressController.value.text
        .toString();
    phoneNumber = bookinginformationController
            .selectedcountrydialcodeControllerforMobile.value.text
            .toString() +
        bookinginformationController.mobilenumberController.value.text
            .toString();
    note = bookinginformationController.noteController.value.text.toString();
    specialRequest =
        bookinginformationController.commentController.value.text.toString();
    nationality =
        bookinginformationController.selectedCountry.value.text.toString();
    pickupLocation =
        bookinginformationController.pickupLocation.value.text.toString();
    title = bookinginformationController.titleController.value.text.toString();
  }

  Map<String, dynamic>? paymentIntentData;
  Future<void> makePayment({required double amount}) async {
    try {
      // Create Payment Intent
      paymentIntentData =
          await createPaymentIntent(amount.toInt().toString(), 'AED');
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData!['client_secret'],
          merchantDisplayName: 'RAH Tourism',
        ),
      );
      await displayPaymentSheet();
    } catch (e, s) {
      print('Payment exception: $e $s');
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      await createBooking();

      paymentIntentData = null;
    } on StripeException catch (e) {
      String errorMessage = "An unknown error occurred. Please try again.";

      if (e.error.code == FailureCode.Failed) {
        errorMessage =
            "Payment failed. Please check your details and try again.";
        showDialog(
          context: Get.context!,
          builder: (_) => AlertDialog(
            title: const Text("Payment Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
          title: const Text("Unexpected Error"),
          content: Text("Error displaying payment sheet: $e"),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET_KEY']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      print('Create Intent Response: ${response.body}');
      return jsonDecode(response.body);
    } catch (err) {
      print('Error creating payment intent: ${err.toString()}');
      return {};
    }
  }

  String calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;

    return a.toString();
  }

  CartController cartController = CartController();
  BookingsController bookingsController = BookingsController();
  Future<void> createBooking() async {
    try {
      isLoading.value = true;
      final CreateBookingModel createBooking = CreateBookingModel(
        packageId: pkgId,
        tourDate: selectedDate,
        adult: adults,
        child: childs,
        infant: infants,
        price: pkgPrice,
        title: title,
        firstName: firstName,
        lastName: lastName,
        email: email,
        country: nationality,
        phoneNumber: phoneNumber,
        specialRequest: specialRequest,
        pickupLocation: pickupLocation,
        note: note,
        totalAmount: totalAmount,
        activityId: activity.id.toString(),
      );

      await bookingRepository.createBooking(
        createBooking,
      );

      bookingsController.getMyBooking();
      if (paymentFlow != Routes.CHOOSEPACKAGE) {
        cartController.deleteActivity(getCartDataModel.id);
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
