import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/widgets/WOrders.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/data/products_data.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: _getProducts(),
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
    backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "My Orders",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
      );
  _getProducts() => List.generate(
        productsdata.length,
        (index) => WOrders(
          title: productsdata[index].title,
          money: productsdata[index].money,
          image: productsdata[index].image,
        ),
      );
}
