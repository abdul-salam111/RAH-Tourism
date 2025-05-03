// To parse this JSON data, do
//
//     final getMainCategories = getMainCategoriesFromJson(jsonString);

import 'dart:convert';

GetMainCategories getMainCategoriesFromJson(String str) =>
    GetMainCategories.fromJson(json.decode(str));

String getMainCategoriesToJson(GetMainCategories data) =>
    json.encode(data.toJson());

class GetMainCategories {
  final List<AllCategory>? allCategory;

  GetMainCategories({
    this.allCategory,
  });

  factory GetMainCategories.fromJson(Map<String, dynamic> json) =>
      GetMainCategories(
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

  AllCategory({
    this.id,
    this.slug,
    this.name,
  });

  factory AllCategory.fromJson(Map<String, dynamic> json) => AllCategory(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
      };
}
