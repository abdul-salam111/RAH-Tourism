import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguagesController extends GetxController {
  // List of available languages
  final List<String> languages = [
    'English',
    'Urdu',
    'Arabic',
    'French',
    'Hindi',
  ];

  // Observable variable for the selected language
  var selectedLanguage = 'English'.obs;

  // Initialize GetStorage and load saved language
  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // Load saved language from storage
    String? savedLanguage = _storage.read<String>('selectedLanguage');
    if (savedLanguage != null) {
      selectedLanguage.value = savedLanguage;
      _changeLocale(savedLanguage); // Change locale based on saved language
    }
  }

  // Method to update the selected language
  void selectLanguage(String language) {
    selectedLanguage.value = language;
    _storage.write('selectedLanguage', language); // Save selected language in storage
    _changeLocale(language); // Change the app's locale
  }

  // Method to update the locale
  void _changeLocale(String language) {
    Locale locale;
    switch (language) {
      case 'Urdu':
        locale = const Locale('ur');
        break;
      case 'Arabic':
        locale = const Locale('ar');
        break;
      case 'French':
        locale = const Locale('fr');
        break;
      case 'Hindi':
        locale = const Locale('hi');
        break;
      default:
        locale = const Locale('en'); // Default to English
    }
    Get.updateLocale(locale);
  }
}
