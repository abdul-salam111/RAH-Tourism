// To parse this JSON data, do
//
//     final getBookingsCount = getBookingsCountFromJson(jsonString);

import 'dart:convert';

GetBookingsCount getBookingsCountFromJson(String str) =>
    GetBookingsCount.fromJson(json.decode(str));

String getBookingsCountToJson(GetBookingsCount data) =>
    json.encode(data.toJson());

class GetBookingsCount {
  final Booking? booking;

  GetBookingsCount({
    this.booking,
  });

  factory GetBookingsCount.fromJson(Map<String, dynamic> json) =>
      GetBookingsCount(
        booking:
            json["booking"] == null ? null : Booking.fromJson(json["booking"]),
      );

  Map<String, dynamic> toJson() => {
        "booking": booking?.toJson(),
      };
}

class Booking {
  final int? allbooking;
  final int? successbooking;
  final int? cancelledbooking;

  Booking({
    this.allbooking,
    this.successbooking,
    this.cancelledbooking,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        allbooking: json["allbooking"],
        successbooking: json["successbooking"],
        cancelledbooking: json["cancelledbooking"],
      );

  Map<String, dynamic> toJson() => {
        "allbooking": allbooking,
        "successbooking": successbooking,
        "cancelledbooking": cancelledbooking,
      };
}
