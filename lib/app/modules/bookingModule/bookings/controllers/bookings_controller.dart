import 'package:bookdubaisafari/app/data/getModels/MyBookings.dart';
import 'package:bookdubaisafari/app/repositories/bookingRepo.dart';
import 'package:bookdubaisafari/app/res/exports.dart';
import 'package:get/get.dart';

class BookingsController extends GetxController {
  var selectedTab = 0.obs;
  BookingRepository bookingRepository = BookingRepository();
  final myBookingModel = MyBookingsModel().obs;

  var isloading = false.obs;
  Future<void> getMyBooking() async {
    try {
      isloading.value = true;
      myBookingModel.value = await bookingRepository.getMyBookings();
      recentBookings.clear();
      historyBookings.clear();
      recentBookings.addAll(
          myBookingModel.value.mybookings!.where((e) => e.status == "success"));

      historyBookings.addAll(myBookingModel.value.mybookings!
          .where((e) => e.status == "canceled"));
          
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
    }
  }

  RxList<Mybooking> recentBookings = <Mybooking>[].obs;
  RxList<Mybooking> recentBookingsSearch = <Mybooking>[].obs;
  RxList<Mybooking> historyBookings = <Mybooking>[].obs;
  RxList<Mybooking> historyBookingsSearch = <Mybooking>[].obs;
  var searchText = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (sharedPrefbox.read(isLoggedin)) {
      getMyBooking();
    }
  }

  Future<void> cancelBooking(refId) async {
    try {
      isloading.value = true;
      await bookingRepository.cancelBooking(refId: refId);
      await getMyBooking();
      isloading.value = false;
    } catch (e) {
      isloading.value = false;
    }
  }
}
