import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

class WAbout extends StatefulWidget {
  const WAbout({
    Key? key,
  }) : super(key: key);

  @override
  State<WAbout> createState() => _WAboutState();
}

class _WAboutState extends State<WAbout> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTextFiled1(title: "Full Name", labelText: "Enter Full Name"),
        _getTextFiled1(title: "Phone Number", labelText: "Enter Phone Name"),
        _getTextFiled1(title: "Address 01", labelText: "Enter Address"),
        _getTextFiled1(
            title: "Address 02 (Optional)", labelText: "Enter Address"),
        _getTextFiled1(title: "City", labelText: "Enter City"),
        _getTextFiled1(title: "Country", labelText: "Enter Country"),
        _getTextFiled1(title: "Postcode", labelText: "Enter Postcode"),
        _getTextFiled2(
            title: "Add Delivery Instructions",
            labelText: "Write Something Here")
      ],
    );
  }

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
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.reviewDisebledColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(
                  color: AppColors.reviewDisebledColor,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
  _getTextFiled2({required String title, required String labelText}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.getDrawbar(),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(top: 17),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.reviewDisebledColor),
            ),
            width: 368,
            height: 200,
            child: TextField(
              obscureText: true,
              maxLength: 100,
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
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
