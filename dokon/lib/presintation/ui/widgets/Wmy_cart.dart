import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../resourses/colors/app_colors.dart';
import '../resourses/images/app_images.dart';

class WMyCart extends StatefulWidget {
  final String title;
  final String money;
  final String image;
  const WMyCart({
    Key? key,
    required this.title,
    required this.money,
    required this.image,
  }) : super(key: key);

  @override
  State<WMyCart> createState() => _WMyCartState();
}

class _WMyCartState extends State<WMyCart> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 150,
                height: 150,
                color: Colors.white10,
                child: Image.asset(widget.image),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () {
                    _getDialog();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(height: 10),
              _getStars(2),
              const SizedBox(height: 10),
              Text(
                widget.money,
                style: const TextStyle(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (n != 0) {
                          n--;
                        }
                      });
                    },
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: AppColors.greyShade,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '-',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "$n",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        n++;
                      });
                    },
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _getDialog() => showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (_) => AlertDialog(
          title: Image.asset(
            AppImages.danger,
            width: 62,
            height: 55,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              Text(
                "Delete this product?",
                style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                "Do you want to delete this product?",
                style: AppStyles.getOrderInfo().copyWith(fontSize: 14),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 105,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: Center(
                        child: Text(
                          "Yes",
                          style: AppStyles.getActionStyle()
                              .copyWith(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 105,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.reviewEnabledColor,
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Center(
                      child: Text(
                        "No",
                        style: AppStyles.getActionStyle()
                            .copyWith(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

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
