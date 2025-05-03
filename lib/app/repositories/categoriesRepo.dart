import 'dart:convert';

import 'package:bookdubaisafari/app/data/getModels/getMainCategories.dart';
import 'package:bookdubaisafari/app/data/getModels/getSubCategories.dart';
import 'package:http/http.dart' as http;

import '../res/exports.dart';

class CategoriesRepository {
  Future<GetMainCategories> getMainCategories() async {
    final Uri url =
        Uri.parse(getMainCategoriesUrl); // Endpoint for sign-in API.

    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return GetMainCategories.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<GetSubCategories> getsubCategories() async {
    final Uri url =
        Uri.parse(getSubCategoriesUrl); // Endpoint for sign-in API.

    try {
      final response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return GetSubCategories.fromJson(data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
