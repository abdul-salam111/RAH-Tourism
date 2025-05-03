import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/exports.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/exports.dart';
import '../controllers/addnewpayment_controller.dart';

class AddnewpaymentView extends GetView<AddnewpaymentController> {
  const AddnewpaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        padding: screenpad,
        children: [
          appbar(paymentsettings.tr, size.width * 0.01),
          SizedBox(height: size.height * 0.02),
          _buildHeaderCard(),
          SizedBox(height: size.height * 0.03),
          _buildPaymentMethods(context, size),
        ],
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: pad18,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: crosstart,
        children: [
          Text(
            paymentmethods.tr,
            style: style(
              color: blackcolor,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          heightbox5,
          Text(
            updatepayment.tr,
            style: style(
              color: textfieldgrey,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethods(BuildContext context, Size size) {
    return Container(
      padding: defaultpad,
      decoration: whiteand10borderradius,
      child: Column(
        children: [
          Obx(
            () => controller.carddetailsList.isNotEmpty
                ? ListView.builder(
                    padding: pad5,
                    shrinkWrap: true,
                    itemCount: controller.carddetailsList.length,
                    itemBuilder: (context, index) =>
                        _buildCardItem(index, size),
                  )
                : const SizedBox.shrink(),
          ),
          SizedBox(height: size.height * 0.02),
          _buildAddPaymentButton(size),
        ],
      ),
    );
  }

  Widget _buildCardItem(int index, size) {
    final card = controller.carddetailsList[index];
    return GestureDetector(
      onTap: () => controller.selectedPaymentMethod.value = index,
      child: Container(
        decoration: const BoxDecoration(
          color: transparent,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  card.cardType == "visa" ? visacard : mastercard,
                  width: size.width * 0.1,
                  height: size.height * 0.03,
                ),
                widthbox10,
                Column(
                  crossAxisAlignment: crosstart,
                  children: [
                    heightbox10,
                    Text(
                      "${card.cardType} **** ${card.cardNumber.substring(14, 19)}",
                      style: style(
                        color: blackcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Exp: ${card.expiryDate}",
                      style: style(
                        color: textfieldgrey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Obx(() => Container(
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: controller.selectedPaymentMethod.value == index
                            ? primarycolor
                            : transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.check,
                        color: controller.selectedPaymentMethod.value == index
                            ? whitecolor
                            : transparent,
                        size: 10,
                      ),
                    )),
                heightbox10,
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(color: greyColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPaymentButton(Size size) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.CARDDETAILS),
      child: Container(
        width: size.width,
        height: size.height * 0.055,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: greyColor),
          borderRadius: radius10,
        ),
        alignment: centeralignment,
        child: Text(
          addpayment.tr,
          style: style(
            color: blackcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
