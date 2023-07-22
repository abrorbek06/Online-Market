import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset(
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
              const SizedBox(height: 80),
              const Text(
                "Please enter your email address below you will receive a link to create a new password via email",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  label: const Text("Email address"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 4,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => const ChangePassword(),
                  ),
                ),
                child: Container(
                  width: 368,
                  height: 55,
                  color: AppColors.mainColor,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Constinue",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
