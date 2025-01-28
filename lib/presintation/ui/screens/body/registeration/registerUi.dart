import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:dokon/presintation/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/colors/app_colors.dart';
import '../../../resourses/images/app_images.dart';
import '../../home/home_screen.dart';
import 'loginUi.dart';

class RegisterUi extends StatefulWidget {
  const RegisterUi({Key? key}) : super(key: key);

  @override
  State<RegisterUi> createState() => _RegisterUiState();
}

class _RegisterUiState extends State<RegisterUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                AppImages.logo,
                width: 89,
                height: 101,
              ),
              const SizedBox(height: 20),
              const Text(
                "Register",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 4),
              const Text(
                "Create new account",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(height: 35),
              TextFeild(title: "Email address"),
              const SizedBox(height: 22),
              TextFeild(title: "Phone number"),
              const SizedBox(height: 22),
              TextFeild(title: "Password"),
              const SizedBox(height: 22),
              TextFeild(title: "Confirm password"),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "By signing below, you agree to the ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Team of use",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "and ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "privacy notice",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ButtonPushReplace(title: "Sing Up", screen: const HomeScreen()),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 2),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => const LoginUi(),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
