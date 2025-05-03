import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../res/exports.dart';
import '../../../widgets/backbutton.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
      child: Column(
        children: [
          SizedBox(
            height: (height * 0.06),
          ),
          Row(
            children: [
              backButton(color: textfieldgrey),
              const Spacer(),
              Text(
                'NOTIFICATIONS',
                style: GoogleFonts.redHatDisplay(
                    fontWeight: FontWeight.bold,
                    color: blackcolor,
                    fontSize: 18),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: defaultpad,
                    decoration: BoxDecoration(
                      color: whitecolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: crosstart,
                      children: [
                        Row(
                          children: [
                            const Icon(
                            Iconsax.danger,
                              color: primarycolor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Reminder",
                              style: GoogleFonts.redHatDisplay(
                                  color: textfieldgrey),
                            ),
                            const Spacer(),
                            Text(
                              "Dec 5, 2024, 7:45 AM",
                              style: GoogleFonts.redHatDisplay(
                                  color: textfieldgrey, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dubai Half Day City Tour",
                          style: GoogleFonts.redHatDisplay(
                              color: blackcolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Your tour to Bali’s stunning beaches is tomorrow at 9:00 AM. Meet at the hotel lobby. Don't forget your sunscreen!",
                          style:
                              GoogleFonts.redHatDisplay(color: textfieldgrey),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}
