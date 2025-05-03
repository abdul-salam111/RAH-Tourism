import 'package:bookdubaisafari/app/modules/bookingModule/bookings/views/bookings_view.dart';
import 'package:bookdubaisafari/app/modules/cartmodule/cart/views/cart_view.dart';
import 'package:bookdubaisafari/app/modules/homeModule/home/views/home_view.dart';
import 'package:bookdubaisafari/app/modules/profileModule/profile/views/profile_view.dart';
import 'package:bookdubaisafari/app/modules/wishlist/views/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  final pages = <Widget>[
    const HomeView(),
    const BookingsView(),
    const CartView(),
    const WishlistView(),
    const ProfileView(),
  ].obs;

  var currentIndex = 0.obs;

   void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
