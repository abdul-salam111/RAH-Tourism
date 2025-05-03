import 'dart:convert';
import 'package:bookdubaisafari/app/data/exports.dart';
import 'package:bookdubaisafari/app/data/getModels/getUserInfo.dart';
import 'package:bookdubaisafari/app/data/postModels/signupmodel.dart';
import 'package:bookdubaisafari/app/data/postModels/updateUserProfile.dart';
import 'package:bookdubaisafari/app/data/postModels/verifyOtpModel.dart';
import 'package:bookdubaisafari/app/repositories/bookingRepo.dart';
import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/widgets/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthRepostiory {
  BookingRepository bookingRepository = BookingRepository();
  Future<void> signInUser(SignInModel signInModel, bool? isUserBooking) async {
    final Uri url = Uri.parse(loginURl); // Endpoint for sign-in API.

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signInModel.toJson()),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        sharedPrefbox.write(isLoggedin, true);
        sharedPrefbox.write(userToken, data['payload']['token']);
        await storeUserDataInSharedPreferences();
        await bookingRepository.getBookingsCount();
        if (isUserBooking != null && isUserBooking == true) {
          Get.back();
        } else {
          Get.offAllNamed(Routes.NAVBAR);
        }
      } else {
        Get.snackbar("Error", "Invalid Cridentials",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signupUser(SignUpModel signupmodel) async {
    final Uri url = Uri.parse(registerURl); // Endpoint for sign-in API.

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(signupmodel.toJson()),
      );

      if (response.statusCode == 200) {
        Get.dialog(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              height: 310,
              decoration:
                  BoxDecoration(borderRadius: radius20, color: whitecolor),
              child: Padding(
                padding: defaultpad,
                child: Column(
                  children: [
                    const SizedBox(
                      height: (50),
                    ),
                    Image.asset(
                      doneicon,
                      width: 60,
                    ),
                    heightbox10,
                    Text(
                      "Registration Successful!",
                      style: style(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackcolor),
                    ),
                    heightbox10,
                    Text(
                      "Hello, We have sent a 6 digit verification code to your email. Please enter to verify your account.",
                      textAlign: TextAlign.center,
                      style: style(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: textfieldgrey),
                    ),
                    const SizedBox(
                      height: (30),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                          Get.toNamed(Routes.VERIFICATIONSCREEN,
                              arguments: signupmodel.email);
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primarycolor, // Adjust the color as needed
                            borderRadius:
                                radius10, // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Padding(
                              padding: screenpad,
                              child: Text(
                                "Verify Account",
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
      } else if (response.statusCode == 403) {
        var data = await jsonDecode(response.body);
        Get.snackbar("Bad Request", "${data['error']}");
      }
    } catch (e) {
      Get.snackbar("Bad Request", "$e");
    }
  }

  //verify user
  Future<void> verifyUser(VerifyOtpModel verifyOtp) async {
    final Uri url = Uri.parse(verifyOtpURl); // Endpoint for sign-in API.

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(verifyOtp.toJson()),
      );

      if (response.statusCode == 200) {
        Get.dialog(
          Center(
              child: Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              width: double.infinity,
              height: 310,
              decoration:
                  BoxDecoration(borderRadius: radius20, color: whitecolor),
              child: Padding(
                padding: defaultpad,
                child: Column(
                  children: [
                    const SizedBox(
                      height: (50),
                    ),
                    Image.asset(
                      doneicon,
                      width: 60,
                    ),
                    heightbox10,
                    Text(
                      "Account Verified!",
                      style: style(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blackcolor),
                    ),
                    heightbox10,
                    Text(
                      "Hello, Your account has been verified successfully. Please login to continue.",
                      textAlign: TextAlign.center,
                      style: style(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: textfieldgrey),
                    ),
                    const SizedBox(
                      height: (30),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, bottom: 7),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNIN);
                        },
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: primarycolor, // Adjust the color as needed
                            borderRadius:
                                radius10, // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Padding(
                              padding: screenpad,
                              child: Text(
                                "Sign In",
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
        Get.snackbar("Invalid Otp", "Your entered OTP is invalid");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> storeUserDataInSharedPreferences() async {
    try {
      final response = await http.get(Uri.parse(getUserInfo), headers: {
        'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      });
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Parse the response to your model
        final userInfo = getUserInfoFromJson(jsonEncode(data));

        // Convert the object to a Map and store it
        sharedPrefbox.write(userInformation, userInfo.toJson());
      } else {
        // Error response
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    }
  }

  Future<void> updateUserProfile(UpdateUserProfile updateUserProfile) async {
    final Uri url =
        Uri.parse(updateProfile); // Endpoint for update profile API.
    try {
      final response = await http.post(url,
          headers: {
            'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
          },
          body: updateUserProfile.toJson());
      // Check the response
      if (response.statusCode == 200) {
        await storeUserDataInSharedPreferences();
        Get.offAllNamed(Routes.NAVBAR);
        Get.snackbar(
            "Profile Updated!", "Your profile has been updated successfully");
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> logoutUser() async {
    try {
      final response = await http.post(Uri.parse(logoutUrl), headers: {
        'Authorization': 'Bearer ${sharedPrefbox.read(userToken)}',
      });
      if (response.statusCode == 200) {
        sharedPrefbox.remove(userInformation);
        sharedPrefbox.remove(isLoggedin);
        sharedPrefbox.remove(userToken);
        Get.offAllNamed(Routes.SIGNIN, arguments: false);
      } else {
        // Error response
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions
      print('Error occurred: $e');
    }
  }
}
