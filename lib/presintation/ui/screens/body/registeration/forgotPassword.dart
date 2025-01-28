import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:dokon/presintation/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/colors/app_colors.dart';
import 'changePassword_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                "Forgot",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 4),
              const Text(
                "Forgot your password",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 50),
              const Text(
                "Please enter your email address below you will receive a link to create a new password via email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              TextFeild(title: "Email address"),
              const SizedBox(height: 150),
              ButtonPushReplace(title: "Continue", screen: const ChangePassword()),
            ],
          ),
        ),
      ),
    );
  }
}
