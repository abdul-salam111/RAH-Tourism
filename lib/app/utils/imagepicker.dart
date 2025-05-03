import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class Utils {
  static Future<XFile?> pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        return image;
      } else {
        Get.snackbar(
          "No Image Selected",
          "Please select an image",
          snackPosition: SnackPosition.BOTTOM,
        );
        throw Exception();
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to pick image: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception();
    }
  }
}
