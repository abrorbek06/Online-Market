import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/widgets/products.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/data/products_data.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color(0xFFFFFFFF),
        title: const Text(
          "Wishlist",
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 22, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 260,
            ),
            children: List.generate(
              productsdata.length,
              (index) => Stack(
                children: [
                  WProducts(
                    title: productsdata[index].title,
                    money: productsdata[index].money,
                    image: productsdata[index].image,
                  ),
                  Positioned(
                    top: 12,
                    right: 30,
                    child: Image.asset(
                      AppImages.wishlist2,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
