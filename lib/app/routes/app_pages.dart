import 'package:get/get.dart';

import '../modules/authModule/forgetpassword/bindings/forgetpassword_binding.dart';
import '../modules/authModule/forgetpassword/views/forgetpassword_view.dart';
import '../modules/authModule/otpscreen/bindings/otpscreen_binding.dart';
import '../modules/authModule/otpscreen/views/otpscreen_view.dart';
import '../modules/authModule/signin/bindings/signin_binding.dart';
import '../modules/authModule/signin/views/signin_view.dart';
import '../modules/authModule/signup/bindings/signup_binding.dart';
import '../modules/authModule/signup/views/signup_view.dart';
import '../modules/authModule/verificationscreen/bindings/verificationscreen_binding.dart';
import '../modules/authModule/verificationscreen/views/verificationscreen_view.dart';
import '../modules/bookingModule/bookingconfirmation/bindings/bookingconfirmation_binding.dart';
import '../modules/bookingModule/bookingconfirmation/views/bookingconfirmation_view.dart';
import '../modules/bookingModule/bookingdetails/bindings/bookingdetails_binding.dart';
import '../modules/bookingModule/bookingdetails/views/bookingdetails_view.dart';
import '../modules/bookingModule/bookings/bindings/bookings_binding.dart';
import '../modules/bookingModule/bookings/views/bookings_view.dart';
import '../modules/bookingModule/choosepackage/bindings/choosepackage_binding.dart';
import '../modules/bookingModule/choosepackage/views/choosepackage_view.dart';
import '../modules/bookingModule/enterbookinginformation/bindings/enterbookinginformation_binding.dart';
import '../modules/bookingModule/enterbookinginformation/views/enterbookinginformation_view.dart';
import '../modules/cartmodule/cart/bindings/cart_binding.dart';
import '../modules/cartmodule/cart/views/cart_view.dart';
import '../modules/cartmodule/cartdetails/bindings/cartdetails_binding.dart';
import '../modules/cartmodule/cartdetails/views/cartdetails_view.dart';
import '../modules/bookingModule/editbookings/bindings/editbookings_binding.dart';
import '../modules/bookingModule/editbookings/views/editbookings_view.dart';
import '../modules/giftModule/giftprview/bindings/giftprview_binding.dart';
import '../modules/giftModule/giftprview/views/giftprview_view.dart';
import '../modules/giftModule/sendgift/bindings/sendgift_binding.dart';
import '../modules/giftModule/sendgift/views/sendgift_view.dart';
import '../modules/homeModule/CategoriesActivities/bindings/categories_activities_binding.dart';
import '../modules/homeModule/CategoriesActivities/views/categories_activities_view.dart';
import '../modules/homeModule/activitydetails/bindings/activitydetails_binding.dart';
import '../modules/homeModule/activitydetails/views/activitydetails_view.dart';
import '../modules/homeModule/citiesActvities/bindings/cities_actvities_binding.dart';
import '../modules/homeModule/citiesActvities/views/cities_actvities_view.dart';
import '../modules/homeModule/home/bindings/home_binding.dart';
import '../modules/homeModule/home/views/home_view.dart';
import '../modules/homeModule/navbar/bindings/navbar_binding.dart';
import '../modules/homeModule/navbar/views/navbar_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/paymentModule/addnewpayment/bindings/addnewpayment_binding.dart';
import '../modules/paymentModule/addnewpayment/views/addnewpayment_view.dart';
import '../modules/paymentModule/carddetails/bindings/carddetails_binding.dart';
import '../modules/paymentModule/carddetails/views/carddetails_view.dart';
import '../modules/paymentModule/paymentmethods/bindings/paymentmethods_binding.dart';
import '../modules/paymentModule/paymentmethods/views/paymentmethods_view.dart';
import '../modules/profileModule/changepassword/bindings/changepassword_binding.dart';
import '../modules/profileModule/changepassword/views/changepassword_view.dart';
import '../modules/profileModule/deleteaccount/bindings/deleteaccount_binding.dart';
import '../modules/profileModule/deleteaccount/views/deleteaccount_view.dart';
import '../modules/profileModule/languages/bindings/languages_binding.dart';
import '../modules/profileModule/languages/views/languages_view.dart';
import '../modules/profileModule/notificatiosettings/bindings/notificatiosettings_binding.dart';
import '../modules/profileModule/notificatiosettings/views/notificatiosettings_view.dart';
import '../modules/profileModule/personalinformation/bindings/personalinformation_binding.dart';
import '../modules/profileModule/personalinformation/views/personalinformation_view.dart';
import '../modules/profileModule/privacypolicy/bindings/privacypolicy_binding.dart';
import '../modules/profileModule/privacypolicy/views/privacypolicy_view.dart';
import '../modules/profileModule/profile/bindings/profile_binding.dart';
import '../modules/profileModule/profile/views/profile_view.dart';
import '../modules/profileModule/resetpassword/bindings/resetpassword_binding.dart';
import '../modules/profileModule/resetpassword/views/resetpassword_view.dart';
import '../modules/profileModule/securitypage/bindings/securitypage_binding.dart';
import '../modules/profileModule/securitypage/views/securitypage_view.dart';
import '../modules/profileModule/settings/bindings/settings_binding.dart';
import '../modules/profileModule/settings/views/settings_view.dart';
import '../modules/profileModule/supportandhelp/bindings/supportandhelp_binding.dart';
import '../modules/profileModule/supportandhelp/views/supportandhelp_view.dart';
import '../modules/splash&onboarding/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/splash&onboarding/onBoarding/views/on_boarding_view.dart';
import '../modules/splash&onboarding/splash/bindings/splash_binding.dart';
import '../modules/splash&onboarding/splash/views/splash_view.dart';
import '../modules/splash&onboarding/splashsss/bindings/splashsss_binding.dart';
import '../modules/splash&onboarding/splashsss/views/splashsss_view.dart';
import '../modules/wishlist/bindings/wishlist_binding.dart';
import '../modules/wishlist/views/wishlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => ForgetpasswordView(),
      binding: ForgetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATIONSCREEN,
      page: () => const VerificationscreenView(),
      binding: VerificationscreenBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR,
      page: () => const NavbarView(),
      binding: NavbarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => const BookingsView(),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: _Paths.WISHLIST,
      page: () => const WishlistView(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITYDETAILS,
      page: () => const ActivitydetailsView(),
      binding: ActivitydetailsBinding(),
    ),
    GetPage(
      name: _Paths.GIFTPRVIEW,
      page: () => const GiftprviewView(),
      binding: GiftprviewBinding(),
    ),
    GetPage(
      name: _Paths.SENDGIFT,
      page: () => const SendgiftView(),
      binding: SendgiftBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSEPACKAGE,
      page: () => const ChoosepackageView(),
      binding: ChoosepackageBinding(),
    ),
    GetPage(
      name: _Paths.CARDDETAILS,
      page: () => CarddetailsView(),
      binding: CarddetailsBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENTMETHODS,
      page: () => const PaymentmethodsView(),
      binding: PaymentmethodsBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGCONFIRMATION,
      page: () => const BookingconfirmationView(),
      binding: BookingconfirmationBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORIES_ACTIVITIES,
      page: () => const CategoriesActivitiesView(),
      binding: CategoriesActivitiesBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () => const LanguagesView(),
      binding: LanguagesBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIOSETTINGS,
      page: () => const NotificatiosettingsView(),
      binding: NotificatiosettingsBinding(),
    ),
    GetPage(
      name: _Paths.ADDNEWPAYMENT,
      page: () => const AddnewpaymentView(),
      binding: AddnewpaymentBinding(),
    ),
    GetPage(
      name: _Paths.SECURITYPAGE,
      page: () => const SecuritypageView(),
      binding: SecuritypageBinding(),
    ),
    GetPage(
      name: _Paths.CHANGEPASSWORD,
      page: () => const ChangepasswordView(),
      binding: ChangepasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTPSCREEN,
      page: () => const OtpscreenView(),
      binding: OtpscreenBinding(),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
    ),
    GetPage(
      name: _Paths.DELETEACCOUNT,
      page: () => const DeleteaccountView(),
      binding: DeleteaccountBinding(),
    ),
    GetPage(
      name: _Paths.PERSONALINFORMATION,
      page: () => const PersonalinformationView(),
      binding: PersonalinformationBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacypolicyView(),
      binding: PrivacypolicyBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORTANDHELP,
      page: () => const SupportandhelpView(),
      binding: SupportandhelpBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGDETAILS,
      page: () => const BookingdetailsView(),
      binding: BookingdetailsBinding(),
    ),
    GetPage(
      name: _Paths.ENTERBOOKINGINFORMATION,
      page: () => EnterbookinginformationView(),
      binding: EnterbookinginformationBinding(),
    ),
    GetPage(
      name: _Paths.CITIES_ACTVITIES,
      page: () => const CitiesActvitiesView(),
      binding: CitiesActvitiesBinding(),
    ),
    GetPage(
      name: _Paths.CARTDETAILS,
      page: () => const CartdetailsView(),
      binding: CartdetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSSS,
      page: () => const SplashsssView(),
      binding: SplashsssBinding(),
    ),
    GetPage(
      name: _Paths.EDITBOOKINGS,
      page: () => const EditbookingsView(),
      binding: EditbookingsBinding(),
    ),
  ];
}
