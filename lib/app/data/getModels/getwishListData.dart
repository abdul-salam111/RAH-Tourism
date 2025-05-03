import 'dart:convert';
import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';

GetWishListData getWishListDataFromJson(String str) =>
    GetWishListData.fromJson(json.decode(str));

String getWishlistDataToJson(GetWishListData data) =>
    json.encode(data.toJson());

class GetWishListData {
  int? id; // Added _id field
  Activity? activity;

  GetWishListData({
    this.id,
    this.activity,
  });

  factory GetWishListData.fromJson(Map<String, dynamic> json) {
    return GetWishListData(
      id: json['_id'], // Map _id field
      activity: json['activity'] != null
          ? Activity.fromJson(json['activity'])
          : null, // Ensure null safety
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activity': activity?.toJson(), // Serialize `Activity` object
    };
  }
}
