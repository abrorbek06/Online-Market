import 'package:dokon/presintation/ui/widgets/WDeliverAddress.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/data/deliver_data.dart';
import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select  Delivery Address :",
              style: AppStyles.getDrawbar().copyWith(fontSize: 20),
            ),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: _getGridView(),
            )
          ],
        ),
      ),
      bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _appBar() => AppBar(
        elevation: 1,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Delivery Address",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(AppImages.icon),
          ),
        ],
      );
  _getBottomNavigationBar() => GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.all(16),
          width: 368,
          height: 50,
          color: AppColors.mainColor,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Change Address",
              style: AppStyles.getActionStyle().copyWith(color: Colors.white),
            ),
          ),
        ),
      );
  _getGridView() => GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 150,
        ),
        children: List.generate(
          deliverData.length,
          (index) => WDeliverAddress(
            title: deliverData[index].title,
            content: deliverData[index].content,
          ),
        ),
      );
}
