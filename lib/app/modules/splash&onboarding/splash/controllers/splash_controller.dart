import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:bookdubaisafari/app/routes/app_pages.dart';

import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splashmethod();
  }

  // void createRecord() {
  //   DatabaseReference databaseReference =
  //       FirebaseDatabase.instance.ref().child('settings');

  //   databaseReference.push().set({
  //     'stop': false,
  //     'message': "home screen",
  //   });
  // }

  void splashmethod() async {
    // final DatabaseReference dbRef = FirebaseDatabase.instance.ref("settings");
    try {
      // final DataSnapshot snapshot = await dbRef.get();
      // if (snapshot.exists) {
      //   final data = snapshot.value as Map;

      //   // Access the first child under the auto-generated key
      //   final firstKey = data.keys.first;
      //   final nestedData = data[firstKey];

      //   if (nestedData['stop'] == true) {
      //     await Get.offAllNamed(Routes.SPLASHSSS,
      //         arguments: nestedData['message']);
      //   } else {
      Future.delayed(const Duration(seconds: 2), () {
        if (sharedPrefbox.read(isOnboardingDone) == true
          ) {
          Get.offAllNamed(Routes.NAVBAR);
        } else {
          Get.offAllNamed(Routes.ON_BOARDING);
        }
      });
      //   }
      // } else {}
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
