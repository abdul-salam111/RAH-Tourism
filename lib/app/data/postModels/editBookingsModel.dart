// To parse this JSON data, do
//
//     final editBookingsModel = editBookingsModelFromJson(jsonString);

import 'dart:convert';

EditBookingsModel editBookingsModelFromJson(String str) =>
    EditBookingsModel.fromJson(json.decode(str));

String editBookingsModelToJson(EditBookingsModel data) =>
    json.encode(data.toJson());

class EditBookingsModel {
  final String? bookingId;
  final String? pickupDate;
  final String? pickupLocation;

  EditBookingsModel({
    this.bookingId,
    this.pickupDate,
    this.pickupLocation,
  });

  factory EditBookingsModel.fromJson(Map<String, dynamic> json) =>
      EditBookingsModel(
        bookingId: json["reference_id"],
        pickupDate: json["pickup_date"],
        pickupLocation: json["pickup_location"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": bookingId,
        "pickup_date": pickupDate,
        "pickup_location": pickupLocation,
      };
}
