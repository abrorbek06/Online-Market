import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextFeild extends StatefulWidget {
  String title;
  TextFeild({super.key, required this.title});

  @override
  State<TextFeild> createState() => _TextFeildState();
}

class _TextFeildState extends State<TextFeild> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        label: Text(
          widget.title,
          style: const TextStyle(color: AppColors.DetailsElementColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: const BorderSide(
            color: AppColors.DetailsElementColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
