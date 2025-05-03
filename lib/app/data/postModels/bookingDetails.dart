// To parse this JSON data, do
//
//     final updateUserProfile = updateUserProfileFromJson(jsonString);

import 'dart:convert';

CreateBookingModel updateUserProfileFromJson(String str) =>
    CreateBookingModel.fromJson(json.decode(str));

String updateUserProfileToJson(CreateBookingModel data) =>
    json.encode(data.toJson());

class CreateBookingModel {
  final String? packageId;
  final String? tourDate;
  final String? adult;
  final String? child;
  final String? infant;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? country;
  final String? phoneNumber;
  final String? specialRequest;
  final String? pickupLocation;
  final String? note;
  final String? totalAmount;
  final String? activityId;
  final String? price;

  CreateBookingModel({
    this.packageId,
    this.tourDate,
    this.adult,
    this.child,
    this.infant,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.country,
    this.phoneNumber,
    this.specialRequest,
    this.pickupLocation,
    this.note,
    this.totalAmount,
    this.activityId,
    this.price,
  });

  factory CreateBookingModel.fromJson(Map<String, dynamic> json) =>
      CreateBookingModel(
          packageId: json["package_id"],
          tourDate: json["tour_date"],
          adult: json["adult"],
          child: json["child"],
          infant: json["infant"],
          title: json["title"],
          firstName: json["firstName"],
          lastName: json["lastName"],
          email: json["email"],
          country: json["nationality"],
          phoneNumber: json["phone"],
          specialRequest: json["specialRequest"],
          pickupLocation: json["pickup_location"],
          note: json["note"],
          totalAmount: json["total_amount"],
          activityId: json["activity_id"],
          price: json['price']);

  Map<String, dynamic> toJson() => {
        "package_id": packageId,
        "tour_date": tourDate,
        "adult": adult,
        "child": child,
        "infant": infant,
        "title": title,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "nationality": country,
        "phone": phoneNumber,
        "specialRequest": specialRequest,
        "pickup_location": pickupLocation,
        "note": note,
        "total_amount": totalAmount,
        "activity_id": activityId,
        'price': price
      };
}
