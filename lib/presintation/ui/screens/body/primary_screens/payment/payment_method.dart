import 'package:dokon/presintation/ui/screens/body/primary_screens/about/chackout.dart';
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
  final bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Delivery Information :",
              style: AppStyles.getDrawbar().copyWith(fontSize: 20),
            ),
            const SizedBox(height: 18),
            _getDeliveryInfo(),
            const SizedBox(height: 60),
            Text(
              "Payment Method :",
              style: AppStyles.getDrawbar().copyWith(fontSize: 20),
            ),
            const SizedBox(height: 20),
            _getCard("Debit/Credit card", Image.asset(AppImages.cardlogo)),
            const SizedBox(height: 25),
            _getCard("Paypal", Image.asset(AppImages.payPal)),
            const SizedBox(height: 25),
            _getCard("Amazon Pay", Image.asset(AppImages.amazonLogo)),
            const SizedBox(height: 25),
            _getCard("Cash On Delivery", Image.asset(AppImages.cashOnDelivery)),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ChackoutScreen(),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.all(16),
          width: 368,
          height: 55,
          color: AppColors.mainColor,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Checkout",
              style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
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
                              builder: (context) => EditAddressScreen(),
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
                  const SizedBox(height: 16),
                  Text(
                    "865-5585 57587",
                    style: AppStyles.getAdressContent(),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  _getCard(String title, Image icon) => Card(
        elevation: 4,
        child: Container(
          width: double.infinity,
          height: 54,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Container(
                width: 33,
                height: 25,
                child: icon,
              ),
              const SizedBox(width: 25),
              Container(
                width: 144,
                child: Text(
                  title,
                  style: AppStyles.getDrawbar().copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(width: 35),
              _getColors()
            ],
          ),
        ),
      );
  _getColors() => GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Padding(
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
            padding: EdgeInsets.all(4),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: show == true ? Colors.red : Colors.transparent,
              ),
            ),
          ),
        ),
      );
}
