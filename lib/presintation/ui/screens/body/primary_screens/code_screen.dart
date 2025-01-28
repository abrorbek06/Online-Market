import 'package:dokon/presintation/ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../resourses/colors/app_colors.dart';
import '../../../resourses/images/app_images.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.otpIcon),
              const SizedBox(height: 30),
              const Text(
                "OTP Verification",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 70),
              const Text(
                "We have sent OTP on your number",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              const SizedBox(height: 40),
              PinCodeTextField(
                appContext: context,
                controller: controller,
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                cursorColor: Colors.black,
                animationCurve: Curves.bounceInOut,
                autoFocus: true,
                errorTextDirection: TextDirection.ltr,
                onChanged: ((value) {
                }),
                textStyle: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.normal),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 50,
                  fieldHeight: 50,
                  selectedFillColor: Colors.blue,
                  activeFillColor: Colors.blue,
                  selectedColor: AppColors.textFiledColor,
                  inactiveColor: AppColors.textFiledColor,
                  activeColor: Colors.green,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(8),
                  errorBorderColor: Colors.red,
                ),
              ),
              const SizedBox(height: 35),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t receive a OTP? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Resend OTP",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 320,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Tasdiqlash",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
