import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/screens/body/start_screens/onBoarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(),
            Column(
              children: [
                Image.asset(AppImages.logo),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Swip",
                      style: TextStyle(
                        color: Color(0xFFF13005),
                        fontWeight: FontWeight.w800,
                        fontSize: 38,
                      ),
                    ),
                    Text(
                      "wide",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 38,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getDots(5),
            ),
          ],
        ),
      ),
    );
  }

  _getDots(int n) => List.generate(n, (index) {
        double s = 100 / n;
        double remainder = 100 - (index * s);
        double opacity = remainder / 100;
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: AppColors.mainColor.withOpacity(opacity),
            shape: BoxShape.circle,
          ),
        );
      });
}
