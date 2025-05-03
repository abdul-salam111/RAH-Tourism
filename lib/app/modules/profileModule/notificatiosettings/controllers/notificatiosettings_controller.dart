import 'package:get/get.dart';

class NotificatiosettingsController extends GetxController {
  var isEmailEnabled = true.obs; // Observable for Email toggle
  var isPushEnabled = false.obs; // Observable for Push Notifications toggle

  void toggleEmail() {
    isEmailEnabled.value = !isEmailEnabled.value;
  }

  void togglePush() {
    isPushEnabled.value = !isPushEnabled.value;
  }
}
