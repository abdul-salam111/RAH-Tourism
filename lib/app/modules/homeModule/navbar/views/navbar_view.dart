import 'package:bookdubaisafari/app/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  const NavbarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => controller.pages.elementAt(controller.currentIndex.value)),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              return Container(
                height: MediaQuery.of(context).size.height *
                    0.08, // Set the height of the navbar
                width: MediaQuery.of(context).size.width *
                    0.9, // Centered navbar with space on sides
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  bottom: 15, // Spacing from the bottom of the screen
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      context,
                      0,
                      Iconsax.home_15,
                      Iconsax.home,
                      "Home",
                      controller.currentIndex.value == 0,
                    ),
                    _buildNavItem(
                      context,
                      1,
                      Iconsax.calendar5,
                      Iconsax.calendar,
                      "Booking",
                      controller.currentIndex.value == 1,
                    ),
                    _buildNavItem(
                      context,
                      2,
                      Iconsax.shopping_cart5,
                      Iconsax.shopping_cart,
                      "Cart",
                      controller.currentIndex.value == 2,
                    ),
                    _buildNavItem(
                      context,
                      3,
                      Iconsax.heart5,
                      Iconsax.heart,
                      "Wishlist",
                      controller.currentIndex.value == 3,
                    ),
                    _buildNavItem(
                      context,
                      4,
                      Iconsax.profile_circle5,
                      Iconsax.profile_circle,
                      "Profile",
                      controller.currentIndex.value == 4,
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, IconData selected,
      IconData unselected, String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        controller.changeTabIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // The red circle indicator above the selected tab
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(
                  bottom: 5), // Space between the circle and icon
              height: 3,
              width: 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primarycolor,
                shape: BoxShape.rectangle,
              ),
            ),
          // Icon
          if (isSelected)
            Icon(
              selected,
              // size: !isSelected ? 25 : 30,
              color: isSelected ? primarycolor : Colors.grey,
            ),
          if (!isSelected)
            Icon(
              unselected,
              // size: !isSelected ? 25 : 30,
              color: isSelected ? primarycolor : Colors.grey,
            ),

          Text(
            label.tr,
            style: GoogleFonts.redHatDisplay(
              color: isSelected ? primarycolor : Colors.grey,
              fontSize: 12,
            ),
          ),
          // Downward curve indicator under the selected tab
        ],
      ),
    );
  }
}
  //    Scaffold(
  //       bottomNavigationBar: Obx(
  //         () => CrystalNavigationBar(
  //           marginR: const EdgeInsets.all(20),
  //           unselectedItemColor: textfieldgrey,
  //           boxShadow: const [
  //             BoxShadow(
  //               color: Color.fromARGB(255, 243, 242, 242),
  //               offset: Offset(1, 1),
  //               blurRadius: 20,
  //               spreadRadius: 1,
  //             )
  //           ],
  //           backgroundColor: whitecolor,
  //           onTap: (index) {
  //             controller.selectedIndex.value = index;
  //           },
  //           currentIndex: controller.selectedIndex.value,
  //           indicatorColor: Colors.white,
  //           items: [
  //             CrystalNavigationBarItem(
  //               icon: IconlyBold.home,
  //               unselectedIcon: IconlyLight.home,
  //               selectedColor: primarycolor,
  //             ),

  //             /// Favourite
  //             CrystalNavigationBarItem(
  //               icon: IconlyBold.calendar,
  //               unselectedIcon: IconlyLight.calendar,
  //               selectedColor: primarycolor,
  //             ),

  //             /// Add
  //             CrystalNavigationBarItem(
  //               icon: IconlyBold.buy,
  //               unselectedIcon: IconlyLight.buy,
  //               selectedColor: primarycolor,
  //             ),

  //             /// Search
  //             CrystalNavigationBarItem(
  //               icon: IconlyBold.heart,
  //               unselectedIcon: IconlyLight.heart,
  //               selectedColor: primarycolor,
  //             ),

  //             /// Profile
  //             CrystalNavigationBarItem(
  //               icon: IconlyBold.profile,
  //               unselectedIcon: IconlyLight.profile,
  //               selectedColor: primarycolor,
  //             ),
  //           ],
  //         ),
  //       ),
  //       body: Obx(
  //           () => controller.pages.elementAt(controller.selectedIndex.value)));
  // }

