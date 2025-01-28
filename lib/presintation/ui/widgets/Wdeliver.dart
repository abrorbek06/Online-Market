import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/about/editAddress.dart';
import 'package:flutter/material.dart';

import '../resourses/colors/app_colors.dart';
import '../resourses/images/app_images.dart';

class WDeliver extends StatefulWidget {
  final String title;
  final String content;
  const WDeliver({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<WDeliver> createState() => _WDeliverState();
}

class _WDeliverState extends State<WDeliver> {
  final double height = 200.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.reviewDisebledColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style:
                      AppStyles.getOnboardingTitle().copyWith(fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const EditAddressScreen(),
                      ),
                    );
                  },
                  child: Image.asset(AppImages.edit),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.content,
              style: AppStyles.getAdressContent(),
            ),
          ],
        ),
      ),
    );
  }
}
