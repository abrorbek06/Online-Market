import 'package:dokon/presintation/ui/screens/body/primary_screens/about/chackout.dart';
import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';
import '../about/editAddress.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool isSelect = false;
  int currentColorIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Delivery Information :",
                style: AppStyles.getDrawbar().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 18),
              _getDeliveryInfo(),
              const SizedBox(height: 40),
              Text(
                "Payment Method :",
                style: AppStyles.getDrawbar().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Column(
                children: _getCard(
                  currentColorIndex: currentColorIndex,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ButtonPush(title: "Checkout", screen: const ChackoutScreen()),
      )
    );
  }

  List icons = [
    Image.asset(AppImages.cardlogo),
    Image.asset(AppImages.payPal),
    Image.asset(AppImages.amazonLogo),
    Image.asset(AppImages.cashOnDelivery),
  ];

  List titles = [
    "Debit/Credit card",
    "Paypal",
    "Amazon Pay",
    "Cash On Delivery"
  ];

  _appBar() => AppBar(
        backgroundColor: AppColors.white,
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Payment Method",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
      );
  _getDeliveryInfo() => Container(
        width: double.infinity,
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.reviewDisebledColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Saul Goodmate",
                        style: AppStyles.getOnboardingTitle()
                            .copyWith(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const EditAddressScreen(),
                            ),
                          );
                        },
                        child: Image.asset(AppImages.edit),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    """16 E Birch Hill Road
Fairbanks, NY, 99312
United States""",
                    style: AppStyles.getAdressContent(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  _getCard({required int currentColorIndex}) =>
      List.generate(
        icons.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              this.currentColorIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 9, bottom: 10),
            child: Card(
              elevation: 4,
              child: Container(
                width: double.infinity,
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SizedBox(
                      width: 33,
                      height: 25,
                      child: icons[index],
                    ),
                    const SizedBox(width: 25),
                    SizedBox(
                      width: 144,
                      child: Text(
                        titles[index],
                        style: AppStyles.getDrawbar().copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 35),
                    Padding(
                      padding: const EdgeInsets.only(right: 9),
                      child: Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2,
                            color: Colors.red,
                          ),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == currentColorIndex
                                ? AppColors.mainColor
                                : Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
