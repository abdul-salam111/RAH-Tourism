import 'package:bookdubaisafari/app/routes/app_pages.dart';
import 'package:bookdubaisafari/app/utils/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: ".env");

  // Initialize local storage
  await GetStorage.init();

  // Set Stripe publishable key from .env
  Stripe.publishableKey = dotenv.env['STRIPE_API_KEY'] ?? '';
  if (Stripe.publishableKey.isEmpty) {
    throw Exception("Stripe API key is missing in .env file.");
  }

  // Apply Stripe settings
  await Stripe.instance.applySettings();

  // Lock orientation to portrait and run the app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    String? savedLanguage = box.read('selectedLanguage');
    Locale initialLocale = savedLanguage != null
        ? (savedLanguage == 'English'
            ? const Locale('en')
            : savedLanguage == 'Urdu'
                ? const Locale('ur')
                : savedLanguage == 'Arabic'
                    ? const Locale('ar')
                    : savedLanguage == 'French'
                        ? const Locale('fr')
                        : const Locale('hi'))
        : const Locale('en');

    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF7F7F7)),
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en'),
      translations: AppTranslations(),
      locale: initialLocale,
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ur'),
        Locale('fr'),
        Locale('ar'),
        Locale('hi'),
      ],
      builder: (context, child) {
        return Directionality(
          textDirection: Get.locale?.languageCode == 'ar' ||
                  Get.locale?.languageCode == 'ur'
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        );
      },
    );
  }
}
