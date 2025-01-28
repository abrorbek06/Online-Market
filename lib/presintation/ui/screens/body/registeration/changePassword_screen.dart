import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:dokon/presintation/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../home/home_screen.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 70),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset(
                AppImages.logo,
                width: 89,
                height: 101,
              ),
              const SizedBox(height: 20),
              const Text(
                "Reset",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 4),
              const Text(
                "Reset your password",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 60),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Enter Your New Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextFeild(title: "New Password"),
              const SizedBox(height: 20),
              TextFeild(title: "Confirm Password"),
              const SizedBox(height: 150),
              ButtonPushReplace(title: "Change Password", screen: const HomeScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
