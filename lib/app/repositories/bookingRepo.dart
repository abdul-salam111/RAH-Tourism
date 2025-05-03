import 'dart:convert';
import 'package:bookdubaisafari/app/data/getModels/MyBookings.dart';
import 'package:bookdubaisafari/app/data/getModels/getBookingsCount.dart';
import 'package:bookdubaisafari/app/data/postModels/bookingDetails.dart';
import 'package:bookdubaisafari/app/data/postModels/editBookingsModel.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/redhatDisplay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../res/exports.dart';
import '../widgets/heightboxes.dart';

class BookingRepository {
  Future<void> createBooking(CreateBookingModel createBooking) async {
    final Uri url = Uri.parse(createBookingUrl); // Endpoint for sign-in API.

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "authorization": "Bearer ${sharedPrefbox.read(userToken)}",
        },
        body: jsonEncode(createBooking.toJson()),
      );

      if (response.statusCode == 200) {
        Get.dialog(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              height: Get.context!.height * 0.6,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(successicon))),
              child: Padding(
                padding: defaultpad,
                child: Column(
                  children: [
                    SizedBox(
                      height: (Get.context!.height * 0.06),
                    ),
                    Image.asset(
                      doneicon,
                      width: Get.context!.width * 0.4,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Booking Successful",
                      style: style(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackcolor),
                    ),
                    heightbox10,
                    Text(
                      "Thank you! Your payments has been processed successfully.",
                      textAlign: TextAlign.center,
                      style: style(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: textfieldgrey),
                    ),
                    SizedBox(
                      height: (Get.context!.height * 0.07),
                    ),
                    Text(
                      "AED ${createBooking.totalAmount}",
                      style: style(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: primarycolor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.offAllNamed(Routes.NAVBAR);
                        },
                        child: Container(
                          height: Get.context!.height * 0.06,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primarycolor, // Adjust the color as needed
                            borderRadius:
                                radius10, // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                "Thank You",
                                style: style(
                                  color: Colors.white,
                                  fontSize:
                                      18.0, // Adjust the font size as needed
                                  fontWeight: FontWeight
                                      .w700, // Adjust the font weight as needed
                                ),
                              ),
                            ),
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
      } else {
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<MyBookingsModel> getMyBookings() async {
    try {
      final response = await http.get(Uri.parse(myBookingsUrl), headers: {
        'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        await getBookingsCount();
        return MyBookingsModel.fromJson(data);
      } else {
        // Error response
        print('Failed to fetch data: ${response.statusCode}');
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
      throw Exception('Error occurred: $e');
    }
  }

  //cancel booking
  Future<void> cancelBooking({required String refId}) async {
    final Uri url =
        Uri.parse(cancelbookingUrl); // Endpoint for update profile API.
    try {
      final response = await http.post(url, headers: {
        'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      }, body: {
        "reference_id": refId
      });
      // Check the response
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.NAVBAR);
        Get.snackbar("Booking Cancelled!",
            "Your booking has been successfully cancelled.");
        await getBookingsCount();
      } else {
        Get.snackbar("Faild!", "Your booking cancellation time is over.");
        print(response.body);
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  //Edit booking
  Future<void> editBookings({required EditBookingsModel editbookings}) async {
    final Uri url =
        Uri.parse(editbookingUrl); // Endpoint for update profile API.
    try {
      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
          },
          body: editbookings.toJson());
      // Check the response
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.NAVBAR);
        Get.snackbar(
            "Booking Updated!", "Your booking has been successfully updated.");
      } else {
        Get.snackbar("Faild!", "Your booking updation time is over.");
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  //get booking count
  Future<void> getBookingsCount() async {
    final Uri url =
        Uri.parse(getBookingsCountsUrl); // Endpoint for update profile API.
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        var bookingCounts = getBookingsCountFromJson(jsonEncode(data));
        await sharedPrefbox.write("bookingCounts", bookingCounts.toJson());
      } else {}
    } catch (e) {
      print('Exception: $e');
    }
  }
}
