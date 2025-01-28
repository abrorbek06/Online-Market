import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/data/category_data.dart';
import 'package:dokon/presintation/ui/resourses/data/products_data.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Account/my_account.dart';
import 'package:dokon/presintation/ui/widgets/category_list.dart';
import 'package:dokon/presintation/ui/widgets/products.dart';
import 'package:dokon/presintation/ui/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../resourses/images/app_images.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      key: _key,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 4),
              _getSearch(),
              _getSizedBox24(),
              _getCategory(),
              _getSizedBox24(),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Newest Arrical",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.54,
                child: _getProducts(),
              ),
            ],
          ),
        ),
      ),
      drawer: _getDrawer(),
    );
  }

  _getSizedBox24() => const SizedBox(height: 16);

  _getAppBar() => AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.menu),
                ),
              ),
              const WTitle(fontSize: 28),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MyAccount()));
                },
                child: const CircleAvatar(
                  backgroundColor: AppColors.lightGray,
                  backgroundImage: AssetImage(
                    "assets/profile.png",
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
      );

  _getMenuItem({required String text, required String icon}) => ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.mainColor,
          child: Image.asset(icon),
        ),
        title: Text(
          text,
          style: AppStyles.getDrawbar(),
        ),
      );
  _getDrawer() => Drawer(
      backgroundColor: AppColors.white,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              SvgPicture.asset(AppImages.logo, width: 89),
              const SizedBox(height: 28),
              const WTitle(fontSize: 28),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFCCCCCC),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          _getMenuItem(text: "Reward", icon: AppImages.gift),
          _getMenuItem(text: "Help", icon: AppImages.help),
          _getMenuItem(text: "Contact Us", icon: AppImages.Undov),
          _getMenuItem(text: "Privacy Policy", icon: AppImages.privacy),
          _getMenuItem(text: "Logout", icon: AppImages.longOut),
        ],
      ));
  _getSearch() => SizedBox(
        height: 50,
        child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: "Search \"Smartphone\"",
            hintStyle: const TextStyle(
              color: AppColors.lightGray,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(AppImages.scan),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(90),
              borderSide: const BorderSide(
                color: AppColors.lightGray,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: AppColors.mainColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(
                color: AppColors.lightGray,
                width: 1,
              ),
            ),
          ),
        ),
      );
  _getCategory() => Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Shop By Category",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          _getSizedBox24(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                categories.length,
                (index) => Padding(
                  padding: EdgeInsets.only(
                      right: categories.length - 1 != index ? 12.0 : 0),
                  child: WCategoyr(
                    title: categories[index].title,
                    image: categories[index].image,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  _getProducts() => GridView(
        padding: const EdgeInsets.only(left: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisExtent: 320,
        ),
        children: List.generate(
          productsdata.length,
          (index) => WProducts(
            title: productsdata[index].title,
            money: productsdata[index].money,
            image: productsdata[index].image,
          ),
        ),
      );
}
