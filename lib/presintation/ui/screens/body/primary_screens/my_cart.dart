import 'package:dokon/presintation/ui/screens/body/primary_screens/payment/payment_method.dart';
import 'package:dokon/presintation/ui/widgets/Wmy_cart.dart';
import 'package:flutter/material.dart';

import '../../../resourses/colors/app_colors.dart';
import '../../../resourses/data/products_data.dart';
import '../../../resourses/styles/app_styles.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: const Text(
          "Shopping Cart",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
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
              const SizedBox(height: 30),
              _getOrder(),
            ],
          ),
        ),
      ),
    );
  }

  _getProducts() => List.generate(
        productsdata.length,
        (index) => WMyCart(
          title: productsdata[index].title,
          money: productsdata[index].money,
          image: productsdata[index].image,
        ),
      );
  _getOrder() => Column(
        children: [
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyShade),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Promocodes",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Apply",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Order Info",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal",
                style: AppStyles.getOrderInfo(),
              ),
              Text(
                "€890.00",
                style: AppStyles.getOrderInfo(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Shipping Charge",
                style: AppStyles.getOrderInfo(),
              ),
              Text(
                "+ €10.00",
                style: AppStyles.getOrderInfo(),
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: AppStyles.getOrderInfo(),
              ),
              const Text(
                "€900.00",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.mainColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PaymentMethod(),
                ),
              );
            },
            child: Container(
              width: 360,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(4)
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
}
