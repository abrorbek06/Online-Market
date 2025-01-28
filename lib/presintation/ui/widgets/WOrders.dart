import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../resourses/colors/app_colors.dart';
import '../resourses/images/app_images.dart';

class WOrders extends StatefulWidget {
  final String title;
  final String money;
  final String image;
  const WOrders({
    Key? key,
    required this.title,
    required this.money,
    required this.image,
  }) : super(key: key);

  @override
  State<WOrders> createState() => _WOrdersState();
}

class _WOrdersState extends State<WOrders> {
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
                color: Colors.grey.shade200,
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
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
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
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 134,
                  height: 40,
                  color: AppColors.mainColor,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Track Order",
                      style:
                          AppStyles.getDrawbar().copyWith(color: Colors.white),
                    ),
                  ),
                ),
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
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Container(
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
