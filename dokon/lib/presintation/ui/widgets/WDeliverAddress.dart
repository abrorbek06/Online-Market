import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../resourses/colors/app_colors.dart';

class WDeliverAddress extends StatefulWidget {
  final String title;
  final String content;
  const WDeliverAddress({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<WDeliverAddress> createState() => _WDeliverAddressState();
}

class _WDeliverAddressState extends State<WDeliverAddress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.reviewDisebledColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppStyles.getOnboardingTitle().copyWith(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                widget.content,
                style: AppStyles.getAdressContent(),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
