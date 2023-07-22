import 'package:dokon/presintation/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
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
              TextField(
                textInputAction: TextInputAction.next,
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
              const SizedBox(height: 25),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(color: Colors.red),
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
              const SizedBox(height: 45),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (c) => const HomeScreen(),
                )),
                child: Container(
                  width: 368,
                  height: 55,
                  color: AppColors.mainColor,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
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
                children: [
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
                          Image.asset(AppImages.google),
                          const Text(
                            "Google",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
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
                            Image.asset(AppImages.facebook),
                            const Text(
                              "Facebook",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )),
                  ),
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
}
