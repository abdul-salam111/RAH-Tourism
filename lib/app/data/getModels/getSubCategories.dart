// To parse this JSON data, do
//
//     final getSubCategories = getSubCategoriesFromJson(jsonString);

import 'dart:convert';

Activity getSubCategoriesFromJson(String str) =>
    Activity.fromJson(json.decode(str));

String getSubCategoriesToJson(Activity data) =>
    json.encode(data.toJson());

class GetSubCategories {
  final List<AllCategory>? allCategory;

  GetSubCategories({
    this.allCategory,
  });

  factory GetSubCategories.fromJson(Map<String, dynamic> json) =>
      GetSubCategories(
        allCategory: json["all-category"] == null
            ? []
            : List<AllCategory>.from(
                json["all-category"]!.map((x) => AllCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "all-category": allCategory == null
            ? []
            : List<dynamic>.from(allCategory!.map((x) => x.toJson())),
      };
}

class AllCategory {
  final int? id;
  final String? slug;
  final String? name;
  final String? image;
  final List<SubCategory>? subCategory;
  final List<Activity>? activity;

  AllCategory({
    this.id,
    this.slug,
    this.name,
    this.image,
    this.subCategory,
    this.activity,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        image: json["image"],
        subCategory: json["sub_category"] == null
            ? []
            : List<SubCategory>.from(
                json["sub_category"]!.map((x) => SubCategory.fromJson(x))),
        activity: json["activity"] == null
            ? []
            : List<Activity>.from(
                json["activity"]!.map((x) => Activity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "image": image,
        "sub_category": subCategory == null
            ? []
            : List<dynamic>.from(subCategory!.map((x) => x.toJson())),
        "activity": activity == null
            ? []
            : List<dynamic>.from(activity!.map((x) => x.toJson())),
      };
}

class Activity {
  final int? id;
  final String? slug;
  final String? name;
  final String? pageTitle;
  final int? categoryId;
  final dynamic subcategoryId;
  final String? highlights;
  final String? description;
  final String? itinerary;
  final String? duration;
  final String? cancellationDuration;
  final int? bookingCount;
  final int? discountOffer;
  final int? mostPopularActivity;
  final int? homeActivity;
  final int? availableActivity;
  final int? homeExperienceActivity;
  final int? otherexpereienceActivity;
  final List<Feature>? features;

  final String? whatsIncluded;
  final String? whatsNotIncluded;

  final String? image;
  final String? startTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  final String? imageUrl;
  final int? averageRating;
  final int? numberOfReviews;
  final List<ActivityImage>? activityImages;
  final List<Package>? packages;
  final List<Review>? reviews;
  final List<Instruction>? instructions;

  Activity({
    this.id,
    this.slug,
    this.name,
    this.pageTitle,
    this.categoryId,
    this.subcategoryId,
    this.highlights,
    this.description,
    this.itinerary,
    this.duration,
    this.cancellationDuration,
    this.bookingCount,
    this.discountOffer,
    this.mostPopularActivity,
    this.homeActivity,
    this.availableActivity,
    this.homeExperienceActivity,
    this.otherexpereienceActivity,
    this.features,
    this.whatsIncluded,
    this.whatsNotIncluded,
    this.image,
    this.startTime,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
    this.averageRating,
    this.numberOfReviews,
    this.activityImages,
    this.packages,
    this.reviews,
    this.instructions,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        pageTitle: json["page_title"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        highlights: json["highlights"],
        description: json["description"],
        itinerary: json["itinerary"],
        duration: json["duration"],
        cancellationDuration: json["cancellation_duration"],
        bookingCount: json["booking_count"],
        discountOffer: json["discount_offer"],
        mostPopularActivity: json["most_popular_activity"],
        homeActivity: json["home_activity"],
        availableActivity: json["available_activity"],
        homeExperienceActivity: json["home_experience_activity"],
        otherexpereienceActivity: json["otherexpereience_activity"],
        features: json["features"] == null
            ? []
            : List<Feature>.from(
                json["features"]!.map((x) => featureValues.map[x]!)),
        whatsIncluded: json["whats_included"],
        whatsNotIncluded: json["whats_not_included"],
        image: json["image"],
        startTime: json["start_time"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
        averageRating: json["average_rating"],
        numberOfReviews: json["number_of_reviews"],
        activityImages: json["activity_images"] == null
            ? []
            : List<ActivityImage>.from(
                json["activity_images"]!.map((x) => ActivityImage.fromJson(x))),
        packages: json["packages"] == null
            ? []
            : List<Package>.from(
                json["packages"]!.map((x) => Package.fromJson(x))),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        instructions: json["instructions"] == null
            ? []
            : List<Instruction>.from(
                json["instructions"]!.map((x) => Instruction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "page_title": pageTitle,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "highlights": highlights,
        "description": description,
        "itinerary": itinerary,
        "duration": duration,
        "cancellation_duration": cancellationDuration,
        "booking_count": bookingCount,
        "discount_offer": discountOffer,
        "most_popular_activity": mostPopularActivity,
        "home_activity": homeActivity,
        "available_activity": availableActivity,
        "home_experience_activity": homeExperienceActivity,
        "otherexpereience_activity": otherexpereienceActivity,
        "features": features == null
            ? []
            : List<dynamic>.from(
                features!.map((x) => featureValues.reverse[x])),
        "whats_included": whatsIncluded,
        "whats_not_included": whatsNotIncluded,
        "image": image,
        "start_time": startTime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
        "average_rating": averageRating,
        "number_of_reviews": numberOfReviews,
        "activity_images": activityImages == null
            ? []
            : List<dynamic>.from(activityImages!.map((x) => x.toJson())),
        "packages": packages == null
            ? []
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x.toJson())),
      };
}

class ActivityImage {
  final int? id;
  final int? activityId;
  final String? originalFilename;
  final String? filename;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrl;

  ActivityImage({
    this.id,
    this.activityId,
    this.originalFilename,
    this.filename,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  factory ActivityImage.fromJson(Map<String, dynamic> json) => ActivityImage(
        id: json["id"],
        activityId: json["activity_id"],
        originalFilename: json["original_filename"],
        filename: json["filename"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_id": activityId,
        "original_filename": originalFilename,
        "filename": filename,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url": imageUrl,
      };
}

enum Feature {
  ENGLISH,
  HOTEL_PICK_UP,
  INSTANT_CONFIRMATION,
  JOIN_IN_GROUP,
  LANGUAGE_ENGLISH,
  PRESENT_MOBILE_OR_PRINTED_VOUCHER,
  PRIVATE_GROUP_AVAILABLE
}

final featureValues = EnumValues({
  "English": Feature.ENGLISH,
  "Hotel Pick Up": Feature.HOTEL_PICK_UP,
  "Instant Confirmation": Feature.INSTANT_CONFIRMATION,
  "Join in Group": Feature.JOIN_IN_GROUP,
  "Language: English": Feature.LANGUAGE_ENGLISH,
  "Present Mobile or Printed Voucher":
      Feature.PRESENT_MOBILE_OR_PRINTED_VOUCHER,
  "Private Group Available": Feature.PRIVATE_GROUP_AVAILABLE
});

class Instruction {
  final int? id;
  final String? instructionTitle;
  final String? instructionDescription;
  final int? activityId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Instruction({
    this.id,
    this.instructionTitle,
    this.instructionDescription,
    this.activityId,
    this.createdAt,
    this.updatedAt,
  });

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
        id: json["id"],
        instructionTitle: json["instruction_title"]!,
        instructionDescription: json["instruction_description"],
        activityId: json["activity_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "instruction_title": instructionTitle,
        "instruction_description": instructionDescription,
        "activity_id": activityId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Package {
  final int? id;
  final int? activityId;
  final String? title;
  final String? price;
  final int? groupSize;
  final String? adultPrice;
  final String? childPrice;
  final String? highlight;
  final Category? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Package({
    this.id,
    this.activityId,
    this.title,
    this.price,
    this.groupSize,
    this.adultPrice,
    this.childPrice,
    this.highlight,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        activityId: json["activity_id"],
        title: json["title"],
        price: json["price"],
        groupSize: json["group_size"],
        adultPrice: json["adult_price"],
        childPrice: json["child_price"],
        highlight: json["highlight"],
        category: categoryValues.map[json["category"]]!,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activity_id": activityId,
        "title": title,
        "price": price,
        "group_size": groupSize,
        "adult_price": adultPrice,
        "child_price": childPrice,
        "highlight": highlight,
        "category": categoryValues.reverse[category],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum Category { PRIVATE, SHARING }

final categoryValues =
    EnumValues({"private": Category.PRIVATE, "sharing": Category.SHARING});

class Review {
  final int? id;
  final int? userId;
  final int? activityId;
  final String? comment;
  final int? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  Review({
    this.id,
    this.userId,
    this.activityId,
    this.comment,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"],
        userId: json["user_id"],
        activityId: json["activity_id"],
        comment: json["comment"],
        rating: json["rating"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "activity_id": activityId,
        "comment": comment,
        "rating": rating,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? email;
  final int? ischeck;
  final String? profileImage;
  final String? profileImageUrl;

  final DateTime? emailVerifiedAt;
  final String? originalPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? profilePicUrl;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.ischeck,
    this.profileImage,
    this.profileImageUrl,
    this.emailVerifiedAt,
    this.originalPassword,
    this.createdAt,
    this.updatedAt,
    this.profilePicUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "",
        email: json["email"],
        ischeck: json["ischeck"],
        profileImage: json["profile_image"] ?? "",
        profileImageUrl: json["profile_image_url"] ?? "",
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        originalPassword: json["original_password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        profilePicUrl: json["profile_pic_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "ischeck": ischeck,
        "profile_image": profileImage,
        "profile_image_url": profileImageUrl,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "original_password": originalPassword,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "profile_pic_url": profilePicUrl,
      };
}

class SubCategory {
  final int? id;
  final int? categoryId;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? activity;

  SubCategory({
    this.id,
    this.categoryId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.activity,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        activity: json["activity"] == null
            ? []
            : List<dynamic>.from(json["activity"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "activity":
            activity == null ? [] : List<dynamic>.from(activity!.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
