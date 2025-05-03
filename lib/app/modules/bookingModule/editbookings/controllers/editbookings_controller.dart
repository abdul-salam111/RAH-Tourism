import 'package:bookdubaisafari/app/data/getModels/MyBookings.dart';
import 'package:bookdubaisafari/app/data/postModels/editBookingsModel.dart';
import 'package:bookdubaisafari/app/modules/bookingModule/bookings/controllers/bookings_controller.dart';
import 'package:bookdubaisafari/app/repositories/bookingRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../res/exports.dart';

class EditbookingsController extends GetxController {
  var isloading = false.obs;
  final pickupLocation = TextEditingController().obs;
  var selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  late Mybooking mybooking;
  @override
  void onInit() {
    super.onInit();
    mybooking = Get.arguments;
    selectedDate.value = DateFormat('yyyy-MM-dd').format(mybooking.date!);
    pickupLocation.value.text = mybooking.pickupLocation ?? "";
  }

  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      barrierColor: primarycolor,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDate.value =
          '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
    }
  }

  BookingRepository bookingRepository = BookingRepository();
  BookingsController bookingsController = BookingsController();
  Future<void> editBookings() async {
    try {
      isloading.value = true;
      await bookingRepository.editBookings(
          editbookings: EditBookingsModel(
              bookingId: mybooking.referenceId,
              pickupDate: selectedDate.value,
              pickupLocation: pickupLocation.value.text.trim()));
      await bookingsController.getMyBooking();
      Get.back();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
    }
  }
}
