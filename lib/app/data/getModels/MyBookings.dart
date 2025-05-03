// To parse this JSON data, do
//
//     final myBookingsModel = myBookingsModelFromJson(jsonString);

import 'dart:convert';

MyBookingsModel myBookingsModelFromJson(String str) =>
    MyBookingsModel.fromJson(json.decode(str));

String myBookingsModelToJson(MyBookingsModel data) =>
    json.encode(data.toJson());

class MyBookingsModel {
  final List<Mybooking>? mybookings;

  MyBookingsModel({
    this.mybookings,
  });

  factory MyBookingsModel.fromJson(Map<String, dynamic> json) =>
      MyBookingsModel(
        mybookings: json["mybookings"] == null
            ? []
            : List<Mybooking>.from(
                json["mybookings"]!.map((x) => Mybooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mybookings": mybookings == null
            ? []
            : List<dynamic>.from(mybookings!.map((x) => x.toJson())),
      };
}

class Mybooking {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? title;
  final String? nationality;
  final String? activityName;
  final String? phone;
  final DateTime? date;
  final String? referenceId;
  final String? totalAmount;
  final String? pickupLocation;
  final String? status;
  final int? userId;
  final List<OrderItem>? orderItems;

  Mybooking({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.title,
    this.nationality,
    this.activityName,
    this.phone,
    this.date,
    this.referenceId,
    this.totalAmount,
    this.pickupLocation,
    this.status,
    this.userId,
    this.orderItems,
  });

  factory Mybooking.fromJson(Map<String, dynamic> json) => Mybooking(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        title: json["title"],
        nationality: json["nationality"],
        activityName: json["activity_name"],
        phone: json["phone"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        referenceId: json["reference_id"],
        totalAmount: json["total_amount"],
        pickupLocation: json["pickup_location"],
        status: json["status"],
        userId: json["user_id"],
        orderItems: json["order_items"] == null
            ? []
            : List<OrderItem>.from(
                json["order_items"]!.map((x) => OrderItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "title": title,
        "nationality": nationality,
        "activity_name": activityName,
        "phone": phone,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "reference_id": referenceId,
        "total_amount": totalAmount,
        "pickup_location": pickupLocation,
        "status": status,
        "user_id": userId,
        "order_items": orderItems == null
            ? []
            : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
      };
}

class OrderItem {
  final int? id;
  final int? adult;
  final int? child;
  final int? infant;
  final int? groups;
  final String? packageTitle;
  final int? totalPrice;
  final String? packageCategory;
  final int? packageId;
  final int? orderId;
  final dynamic bookingDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Package? package;

  OrderItem({
    this.id,
    this.adult,
    this.child,
    this.infant,
    this.groups,
    this.packageTitle,
    this.totalPrice,
    this.packageCategory,
    this.packageId,
    this.orderId,
    this.bookingDate,
    this.createdAt,
    this.updatedAt,
    this.package,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        adult: json["adult"],
        child: json["child"],
        infant: json["infant"],
        groups: json["groups"],
        packageTitle: json["package_title"],
        totalPrice: json["total_price"],
        packageCategory: json["package_category"],
        packageId: json["package_id"],
        orderId: json["order_id"],
        bookingDate: json["booking_date"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        package:
            json["package"] == null ? null : Package.fromJson(json["package"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adult": adult,
        "child": child,
        "infant": infant,
        "groups": groups,
        "package_title": packageTitle,
        "total_price": totalPrice,
        "package_category": packageCategory,
        "package_id": packageId,
        "order_id": orderId,
        "booking_date": bookingDate,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "package": package?.toJson(),
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
  final List<String>? features;
  final dynamic language;
  final dynamic meetup;
  final String? whatsIncluded;
  final String? whatsNotIncluded;
  final dynamic minimumTravelers;
  final String? image;
  final String? startTime;
  final int? featured;
  final int? bestseller;
  final int? formainpage;
  final String? metaTitle;
  final String? metaDescription;
  final dynamic metaKeywords;
  final String? imageUrl;
  final int? averageRating;
  final int? numberOfReviews;
  final List<ActivityImage>? activityImages;
  final List<Package>? packages;
  final List<dynamic>? reviews;
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
    this.language,
    this.meetup,
    this.whatsIncluded,
    this.whatsNotIncluded,
    this.minimumTravelers,
    this.image,
    this.startTime,
    this.featured,
    this.bestseller,
    this.formainpage,
    this.metaTitle,
    this.metaDescription,
    this.metaKeywords,
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
            : List<String>.from(json["features"]!.map((x) => x)),
        language: json["language"],
        meetup: json["meetup"],
        whatsIncluded: json["whats_included"],
        whatsNotIncluded: json["whats_not_included"],
        minimumTravelers: json["minimum_travelers"],
        image: json["image"],
        startTime: json["start_time"],
        featured: json["featured"],
        bestseller: json["bestseller"],
        formainpage: json["formainpage"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeywords: json["meta_keywords"],
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
            : List<dynamic>.from(json["reviews"]!.map((x) => x)),
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
        "features":
            features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "language": language,
        "meetup": meetup,
        "whats_included": whatsIncluded,
        "whats_not_included": whatsNotIncluded,
        "minimum_travelers": minimumTravelers,
        "image": image,
        "start_time": startTime,
        "featured": featured,
        "bestseller": bestseller,
        "formainpage": formainpage,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "image_url": imageUrl,
        "average_rating": averageRating,
        "number_of_reviews": numberOfReviews,
        "activity_images": activityImages == null
            ? []
            : List<dynamic>.from(activityImages!.map((x) => x.toJson())),
        "packages": packages == null
            ? []
            : List<dynamic>.from(packages!.map((x) => x.toJson())),
        "reviews":
            reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x.toJson())),
      };
}

class Package {
  final int? id;
  final int? activityId;
  final String? title;
  final dynamic price;
  final dynamic groupSize;
  final String? adultPrice;
  final String? childPrice;
  final String? highlight;
  final String? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Activity? activity;

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
    this.activity,
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
        category: json["category"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        activity: json["activity"] == null
            ? null
            : Activity.fromJson(json["activity"]),
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
        "category": category,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "activity": activity?.toJson(),
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
        instructionTitle: json["instruction_title"],
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
