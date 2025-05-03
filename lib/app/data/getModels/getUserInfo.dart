// To parse this JSON data, do
//
//     final getUserInfo = getUserInfoFromJson(jsonString);

import 'dart:convert';

GetUserInfo getUserInfoFromJson(String str) =>
    GetUserInfo.fromJson(json.decode(str));

String getUserInfoToJson(GetUserInfo data) => json.encode(data.toJson());

class GetUserInfo {
  final bool? success;
  final String? message;
  final Payload? payload;

  GetUserInfo({
    this.success,
    this.message,
    this.payload,
  });

  factory GetUserInfo.fromJson(Map<String, dynamic> json) => GetUserInfo(
        success: json["success"],
        message: json["message"],
        payload:
            json["payload"] == null ? null : Payload.fromJson(json["payload"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "payload": payload?.toJson(),
      };
}

class Payload {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profileImage;

  Payload({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.profileImage,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        profileImage: json["profile_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "profile_image": profileImage,
      };
}
