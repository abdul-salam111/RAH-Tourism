import 'package:bookdubaisafari/app/repositories/authRepo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  var isloading = false.obs;
  AuthRepostiory authRepostiory = AuthRepostiory();
  Future<void> logoutUser() async {
    try {
      isloading.value = true;
      await authRepostiory.logoutUser();
      isloading.value = false;
    } catch (e) {
      isloading.value = true;
      throw Exception(e);
    }
  }

  void increment() => count.value++;
}
