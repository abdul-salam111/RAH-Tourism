import 'dart:convert';

import 'package:image_picker/image_picker.dart';

UpdateUserProfile updateUserProfileFromJson(String str) =>
    UpdateUserProfile.fromJson(json.decode(str));

String updateUserProfileToJson(UpdateUserProfile data) =>
    json.encode(data.toJson());

class UpdateUserProfile {
  final String? firstName;
  final String? lastName;
  final XFile? profileImage; // XFile for use in the app
  final String? phone;

  UpdateUserProfile({
    this.firstName,
    this.lastName,
    this.profileImage,
    this.phone,
  });

  factory UpdateUserProfile.fromJson(Map<String, dynamic> json) =>
      UpdateUserProfile(
        firstName: json["first_name"] as String?, // Explicitly cast to String?
        lastName: json["last_name"] as String?, // Explicitly cast to String?
        profileImage: json["profile_image"] != null
            ? XFile(json["profile_image"]) // Cast to String
            : null,
        phone: json["phone"] as String?, // Explicitly cast to String?
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "profile_image": profileImage != null ? XFile(profileImage!.path) : "",
        "phone": phone,
      };
}
