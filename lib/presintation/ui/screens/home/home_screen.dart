import 'package:dokon/presintation/ui/resourses/images/app_images.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Account/my_account.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/my_cart.dart';
import 'package:flutter/material.dart';

import '../../resourses/colors/app_colors.dart';
import '../body/primary_screens/Wishlist/wishlist.dart';
import '../body/primary_screens/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = const [
    Home(),
    Wishlist(),
    MyCart(),
    MyAccount(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 0,
        showSelectedLabels: false,
        selectedItemColor: AppColors.mainColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 0 ? AppImages.home2 : AppImages.home1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 1 ? AppImages.wishlist2 : AppImages.wishlist1,
            ),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 2 ? AppImages.cart2 : AppImages.cart1,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              currentIndex == 3 ? AppImages.account2 : AppImages.account1,
            ),
            label: "Home",
          ),
        ],
      ),
    );
  }
}
