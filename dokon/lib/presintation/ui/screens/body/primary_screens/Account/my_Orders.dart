import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/widgets/WOrders.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/data/products_data.dart';

class MyOrders extends StatefulWidget {
  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  int n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: _getProducts(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          "Edit Address",
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
