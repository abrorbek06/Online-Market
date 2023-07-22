import 'package:dokon/presintation/ui/widgets/Wabout.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';

class AddAdress extends StatefulWidget {
  const AddAdress({Key? key}) : super(key: key);

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add New Address",
                style: AppStyles.getDrawbar().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 14),
              Text(
                """Fill The Given Details And Create New
Shipping Address""",
                style: AppStyles.getAdressContent()
                    .copyWith(color: AppColors.DetailsElementColor),
              ),
              const SizedBox(height: 40),
              WAbout(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getBottomNavigationBar() => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.all(16),
          width: 368,
          height: 50,
          color: AppColors.mainColor,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Save Address",
              style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      );
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
          "Add Address",
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
