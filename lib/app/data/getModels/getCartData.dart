import 'dart:convert';
import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';

GetCartDataModel getCartDataFromJson(String str) =>
    GetCartDataModel.fromJson(json.decode(str));

String getCartDataToJson(GetCartDataModel data) => json.encode(data.toJson());

class GetCartDataModel {
  int? id; // Added _id field
  Activity? activity;
  Package? package;
  String? date;
  String? adults;
  String? childs;
  String? infants;
  String? packageType;
  String? totalPrice;

  GetCartDataModel(
      {this.id,
      this.activity,
      this.date,
      this.totalPrice,
      this.adults,
      this.childs,
      this.infants,
      this.package,
      this.packageType});

  factory GetCartDataModel.fromJson(Map<String, dynamic> json) {
    return GetCartDataModel(
      id: json['_id'], // Map _id field
      activity: json['activity'] != null
          ? Activity.fromJson(json['activity'])
          : null, // Ensure null safety
      date: json['date'],
      adults: json['adults'],
      childs: json['childs'],
      infants: json['infants'],
      package:
          json['package'] != null ? Package.fromJson(json['package']) : null,
      packageType: json['packageType'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id, // Serialize _id field
      'activity': activity?.toJson(), // Serialize `Activity` object
      'date': date,
      'adults': adults,
      'childs': childs,
      'package': package,
      'infants': infants,
      'packageType': packageType,
      'totalPrice': totalPrice,
    };
  }
}
