import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:flutter/material.dart';

class ProductsData {
  final String title;
  final String money;
  final String image;
  const ProductsData({
    Key? key,
    required this.title,
    required this.money,
    required this.image,
  });
}

List<ProductsData> productsdata = const [
  ProductsData(
      title: "Smart Watch", money: "\$120,00", image: AppImages.smartWatch),
  ProductsData(title: "MackBook", money: "\$230,00", image: AppImages.mackBook),
  ProductsData(
      title: "Traviling Bag", money: "\$95,00", image: AppImages.travilingBag),
  ProductsData(
      title: "Sport Shoes", money: "\$120,00", image: AppImages.sportShoes),
  ProductsData(
      title: "Smart Watch", money: "\$120,00", image: AppImages.smartWatch),
  ProductsData(title: "MackBook", money: "\$230,00", image: AppImages.mackBook),
  ProductsData(
      title: "Traviling Bag", money: "\$95,00", image: AppImages.travilingBag),
  ProductsData(
      title: "Sport Shoes", money: "\$120,00", image: AppImages.sportShoes),
];
