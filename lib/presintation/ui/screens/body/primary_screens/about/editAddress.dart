import 'package:dokon/presintation/ui/widgets/Wabout.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key}) : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              WAbout(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          width: 368,
          height: 55,
          color: AppColors.mainColor,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Save Address",
              style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

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
          "Edit Address",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(AppImages.icon),
          ),
        ],
      );
}
