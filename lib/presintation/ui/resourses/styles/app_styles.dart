import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle getActionStyle() => const TextStyle(
        color: AppColors.mainColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );
  static TextStyle getOnboardingTitle() => const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );
  static TextStyle getOnboardingSubTitle() => const TextStyle(
        color: AppColors.lightGray,
        fontSize: 18,
        fontWeight: FontWeight.w800,
        height: 1.4,
      );
  static TextStyle getOrderInfo() => const TextStyle(
        color: AppColors.DetailsElementColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );
  static TextStyle getLogoTextStyle() => const TextStyle(
        color: AppColors.mainColor,
        fontSize: 28,
        fontWeight: FontWeight.w800,
      );
  static TextStyle getDrawbar() => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      );
  static TextStyle getAdressContent() => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
}
