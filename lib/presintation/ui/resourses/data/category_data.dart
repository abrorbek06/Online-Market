import 'package:dokon/presintation/ui/resourses/images/app_images.dart';

class CategoryData {
  String title;
  String image;
  CategoryData({required this.title, required this.image});
}

List<CategoryData> categories = [
  CategoryData(
    title: "Clothes",
    image: AppImages.clothes,
  ),
  CategoryData(
    title: "Laptop",
    image: AppImages.laptop,
  ),
  CategoryData(
    title: "Bag",
    image: AppImages.bag,
  ),
  CategoryData(
    title: "Shoes",
    image: AppImages.shoes,
  ),
  CategoryData(
    title: "Kitchen",
    image: AppImages.kitchen,
  ),
  CategoryData(
    title: "Mobiles",
    image: AppImages.mobile,
  ),
  CategoryData(
    title: "Toys",
    image: AppImages.toys,
  ),
  CategoryData(
    title: "Goggles",
    image: AppImages.goggles,
  ),
];
