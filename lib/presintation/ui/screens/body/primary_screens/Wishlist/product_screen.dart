import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/screens/home/home_screen.dart';
import 'package:dokon/presintation/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resourses/colors/app_colors.dart';

class ProductScreen extends StatefulWidget {
  final String title;
  final String image;
  final String price;
  const ProductScreen({Key? key,
    required this.title,
    required this.price,
    required this.image,}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int page = 0;
  int currentColorIndex = -1;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _getProductImages(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.getDrawbar().copyWith(fontSize: 20),
                      ),
                      _getStars(4),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.price,
                        style:
                            AppStyles.getLogoTextStyle().copyWith(fontSize: 20),
                      ),
                      Text(
                        "Available in stock",
                        style: AppStyles.getDrawbar().copyWith(
                          fontSize: 16,
                          color: const Color(0xFF12991F),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              _getDivider(),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Color Variant",
                      style: AppStyles.getDrawbar().copyWith(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: _getColors(currentColorIndex: currentColorIndex),
                  )
                ],
              ),
              _getDivider(),
              _getDetails(),
              _getDivider(),
              _getServices(),
              _getDivider(),
              _getDescription(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonPush(title: "Add To Cart", screen: const HomeScreen(),),
      )
    );
  }

  List<Color> colors = [
    const Color(0xFF396036),
    const Color(0xFFCDBD69),
    const Color(0xFF3B250F),
    const Color(0xFF69ABCE),
    const Color(0xFFC0C0C0),
  ];

  _appBar() => AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SvgPicture.asset(
              AppImages.wishlist1,
              width: 20,
            ),
          ),
        ],
      );
  _getColors({required int currentColorIndex}) => List.generate(
        colors.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              this.currentColorIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 9),
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: index == currentColorIndex
                        ? colors[index]
                        : Colors.transparent,
                    width: 2),
              ),
              padding: EdgeInsets.all(4),
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors[index],
                ),
              ),
            ),
          ),
        ),
      );
  _getDivider() => const Column(
        children: [
          SizedBox(height: 30),
          Divider(thickness: 1),
          SizedBox(height: 35),
        ],
      );
  _getSizedBox() => const SizedBox(height: 14);

  _getProductImages() => SizedBox(
        height: 250,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    page = index;
                  });
                },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                children: _getImages(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getDots(5, page),
            ),
          ],
        ),
      );
  _getImages() => List.generate(
        5,
        (index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.transparent,
              child: Image.asset(
                widget.image,
                width: 260,
                height: 240,
              ),
            ),
          ],
        ),
      );
  _getServices() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(AppImages.truckService),
              _getSizedBox(),
              Text(
                "Get Free Delivery",
                style: AppStyles.getDrawbar(),
              ),
              const SizedBox(height: 51),
              Image.asset(AppImages.replaceService),
              _getSizedBox(),
              Text(
                "07 Days Replace",
                style: AppStyles.getDrawbar(),
              ),
            ],
          ),
          Column(
            children: [
              Image.asset(AppImages.cashService),
              _getSizedBox(),
              Text(
                "Get Free Delivery",
                style: AppStyles.getDrawbar(),
              ),
              const SizedBox(height: 51),
              Image.asset(AppImages.policyService),
              _getSizedBox(),
              Text(
                "07 Days Replace",
                style: AppStyles.getDrawbar(),
              ),
            ],
          ),
        ],
      );
  _getDetails() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Brand : ",
                style: AppStyles.getDrawbar(),
              ),
              _getSizedBox(),
              Text(
                "Model Name : ",
                style: AppStyles.getDrawbar(),
              ),
              _getSizedBox(),
              Text(
                "Colour : ",
                style: AppStyles.getDrawbar(),
              ),
              _getSizedBox(),
              Text(
                "Style : ",
                style: AppStyles.getDrawbar(),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Noise",
                style: AppStyles.getDrawbar()
                    .copyWith(color: AppColors.DetailsElementColor),
              ),
              _getSizedBox(),
              Text(
                "ColorFit Pulse 2",
                style: AppStyles.getDrawbar()
                    .copyWith(color: AppColors.DetailsElementColor),
              ),
              _getSizedBox(),
              Text(
                "Air Superiority Blue",
                style: AppStyles.getDrawbar()
                    .copyWith(color: AppColors.DetailsElementColor),
              ),
              _getSizedBox(),
              Text(
                "Modern",
                style: AppStyles.getDrawbar()
                    .copyWith(color: AppColors.DetailsElementColor),
              ),
            ],
          ),
        ],
      );
  _getDescription() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "About this item",
            style: AppStyles.getDrawbar().copyWith(fontSize: 20),
          ),
          Text(
            """At vero eos et accusamus et iusto odio dig
ssimos ducimus qui blanditiis praesentium 
voluptatum deleniti atque corrupti quos do
lores et quas molestias excepturi...""",
            style: AppStyles.getOrderInfo().copyWith(fontSize: 16),
          )
        ],
      );

  _getDots(int n, int activeIndex) => List.generate(n, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == activeIndex
                ? AppColors.mainColor
                : AppColors.mainColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        );
      });
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
