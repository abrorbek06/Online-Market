import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/data/category_data.dart';
import 'package:dokon/presintation/ui/resourses/data/products_data.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/widgets/category_list.dart';
import 'package:dokon/presintation/ui/widgets/products.dart';
import 'package:dokon/presintation/ui/widgets/title.dart';
import 'package:flutter/material.dart';

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
      key: _key,
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _getSearch(),
              _getSizedBox24(),
              _getCategory(),
              // _getSizedBox24(),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Newest Arrival",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: _getProducts(),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: _getDrawer(),
    );
  }

  _getSizedBox24() => const SizedBox(height: 24);

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
              const CircleAvatar(
                backgroundColor: AppColors.lightGray,
                backgroundImage: NetworkImage(
                    "https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg"),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
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
          child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Image.asset(AppImages.logo, width: 89),
              const SizedBox(height: 28),
              const WTitle(fontSize: 28),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFCCCCCC),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
          _getMenuItem(text: "Reward", icon: AppImages.gift),
          _getMenuItem(text: "Help", icon: AppImages.help),
          _getMenuItem(text: "Contact Us", icon: AppImages.Undov),
          _getMenuItem(text: "Privacy Policy", icon: AppImages.privacy),
          _getMenuItem(text: "Logout", icon: AppImages.longOut),
        ],
      ));
  _getSearch() => Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 16,
              spreadRadius: 1,
            ),
          ],
        ),
        child: TextField(
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 10),
            hintText: "Search \"Smartphone\"",
            hintStyle: TextStyle(
                color: Colors.grey.shade400, fontWeight: FontWeight.w500),
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(AppImages.scan),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(
                  color: Colors.grey.shade100,
                  width: 4,
                )),
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
                      )),
            ),
          ),
        ],
      );
  _getProducts() => GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 300,
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
