import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

class WTitle extends StatelessWidget {
  final double fontSize;
  const WTitle({Key? key, this.fontSize = 38}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Swip",
        children: [
          TextSpan(
              text: "wide",
              style: AppStyles.getLogoTextStyle().copyWith(
                color: Colors.black,
                fontSize: fontSize,
              )),
        ],
        style: AppStyles.getLogoTextStyle().copyWith(fontSize: fontSize),
      ),
    );
  }
}
