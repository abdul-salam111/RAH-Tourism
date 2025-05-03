import 'package:get/get.dart';

class DeleteaccountController extends GetxController {
  var selectedOption = 0.obs;

  // List of options
  final options = [
    "I am no longer using my account",
    "The service is too expensive",
    "I want to change my phone number",
    "I don’t understand how to use",
    "Others",
  ];
}
