import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

class ButtonPush extends StatefulWidget {
  String title;
  Widget screen;
  ButtonPush({super.key, required this.title,  required this.screen});

  @override
  State<ButtonPush> createState() => _ButtonPushState();
}

class _ButtonPushState extends State<ButtonPush> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.screen));},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(4)
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.title,
            style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ButtonPushReplace extends StatefulWidget {
  String title;
  Widget screen;
  ButtonPushReplace({super.key, required this.title,  required this.screen});

  @override
  State<ButtonPushReplace> createState() => _ButtonPushReplaceState();
}

class _ButtonPushReplaceState extends State<ButtonPushReplace> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => widget.screen));},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(4)
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.title,
            style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
