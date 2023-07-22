import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/screens/body/registeration/loginUi.dart';
import 'package:dokon/presintation/ui/screens/body/start_screens/onBoarding/onboardingdata.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<OnBoardingData> onboardingData = const [
    OnBoardingData(
      tite: "Discover New Products",
      subTitle: """Many new products are discovered by
people simply happening upon them
while being out and about in the
world.""",
      image: AppImages.onboarding_1,
    ),
    OnBoardingData(
      tite: "Earn Points For Shopping",
      subTitle: """The purpose of reward points is to provide
an incentive for customers to make
repeat purchases.""",
      image: AppImages.onboarding_3,
    ),
    OnBoardingData(
      tite: "Get Fast Local Delivery",
      subTitle: """Wow Express offers cash on delivery
services and fast delivery services
so that your customers.""",
      image: AppImages.onboarding_2,
    ),
  ];
  PageController controller = PageController();
  int page = 0;
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          GestureDetector(
            onTap: () {
              if (page != onboardingData.length - 1) {
                setState(() {
                  page++;
                  controller.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                });
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginUi(),
                  ),
                );
              }
            },
            child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 30, right: 30),
              child: Text(
                "Next",
                style: AppStyles.getActionStyle(),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  page = index;
                });
              },
              controller: controller,
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                onboardingData.length,
                (index) => _getPage(
                  onboardingData[index],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getDots(onboardingData.length, page),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }

  _getPage(OnBoardingData data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            width: width * 0.8,
          ),
          SizedBox(height: height * 0.1),
          Text(
            data.tite,
            style: AppStyles.getOnboardingTitle(),
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            data.subTitle,
            style: AppStyles.getOnboardingSubTitle(),
            textAlign: TextAlign.center,
          ),
        ],
      );
  _getDots(int n, int activeIndex) => List.generate(n, (index) {
        return Container(
          width: 12,
          height: 12,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.mainColor
                : AppColors.mainColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        );
      });
}
