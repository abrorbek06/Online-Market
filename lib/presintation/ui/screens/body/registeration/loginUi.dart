import 'package:dokon/presintation/ui/screens/home/home_screen.dart';
import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:dokon/presintation/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/colors/app_colors.dart';
import '../../../resourses/images/app_images.dart';
import 'forgotPassword.dart';
import 'registerUi.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  State<LoginUi> createState() => _LoginUi();
}

class _LoginUi extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(right: 30,left: 30),
        child: Container(
          alignment: const Alignment(0,0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.logo,
                width: 89,
                height: 101,
              ),
              const SizedBox(height: 20),
              const Text(
                "Welcome Back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(height: 4),
              const Text(
                "Login to your account",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              const SizedBox(height: 35),
              TextFeild(title: 'Email address'),
              const SizedBox(height: 25),
              TextFeild(title: 'Password'),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (c) => const ForgotPassword(),
                  ),
                ),
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              ButtonPushReplace(title: "Login", screen: const HomeScreen()), const SizedBox(height: 45),
              const SizedBox(height: 30),
              const Text(
                "Or",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _internet("Google", AppImages.google),
                  _internet("Facebook", AppImages.facebook),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have on account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 6),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => const RegisterUi(),
                      ),
                    ),
                    child: const Text(
                      "Sing Up",
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
  _internet(String title, String image) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          width: 130,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
}
