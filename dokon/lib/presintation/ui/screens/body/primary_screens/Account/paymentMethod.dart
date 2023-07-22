import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.card),
              const SizedBox(height: 60),
              _getTextFiled1(
                  title: "Card Holder Name", labelText: "Saul Goodmate"),
              _getTextFiled1(
                  title: "Card Number", labelText: "0123   4567   8901   2345"),
              Row(
                children: [
                  Expanded(
                    child: _getTextFiled1(
                        title: "Expiry Date", labelText: "09/28"),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _getTextFiled1(title: "CVV", labelText: "235"),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 52,
                    color: AppColors.mainColor,
                    child: Center(
                      child: Text(
                        "Delete Card",
                        style: AppStyles.getActionStyle()
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 150,
                    height: 52,
                    color: AppColors.reviewEnabledColor,
                    child: Center(
                      child: Text(
                        "+Add Card",
                        style: AppStyles.getActionStyle()
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Payment Method",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Save",
                  style: AppStyles.getActionStyle(),
                ),
              ),
            ),
          ),
        ],
      );
  _getTextFiled1({required String title, required String labelText}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.getDrawbar(),
          ),
          const SizedBox(height: 12),
          TextField(
            obscureText: true,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              label: Text(labelText),
              labelStyle: AppStyles.getOrderInfo(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}
