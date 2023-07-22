import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Wishlist/product_screen.dart';
import 'package:flutter/material.dart';

import '../resourses/colors/app_colors.dart';

class WProducts extends StatefulWidget {
  final String title;
  final String money;
  final String image;
  const WProducts({
    Key? key,
    required this.title,
    required this.money,
    required this.image,
  }) : super(key: key);
  @override
  State<WProducts> createState() => _WProductsState();
}

class _WProductsState extends State<WProducts> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductScreen(),
            ),
          );
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.grey.shade200,
                child: Image.asset(widget.image),
              ),
              const SizedBox(height: 20),
              _getStars(3),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                widget.money,
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getStars(int mark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Image.asset(
          AppImages.star,
          color: index <= mark - 1
              ? AppColors.reviewEnabledColor
              : AppColors.reviewDisebledColor,
        ),
      ),
    );
  }
}
