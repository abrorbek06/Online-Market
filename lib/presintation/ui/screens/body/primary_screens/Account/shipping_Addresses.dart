import 'package:dokon/presintation/ui/resourses/data/deliver_data.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/about/addAddress.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/about/delivery_address.dart';
import 'package:dokon/presintation/ui/widgets/Wdeliver.dart';
import 'package:flutter/material.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/images/app_images.dart';
import '../about/editAddress.dart';

class ShippingAddresses extends StatefulWidget {
  const ShippingAddresses({Key? key}) : super(key: key);

  @override
  State<ShippingAddresses> createState() => _DeliveryInformationState();
}

class _DeliveryInformationState extends State<ShippingAddresses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Information :",
                        style: AppStyles.getDrawbar().copyWith(fontSize: 20),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const DeliveryAddress(),
                            ),
                          );
                        },
                        child: Text(
                          "Change",
                          style: AppStyles.getActionStyle(),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  _getDeliveryInfo(),
                  const SizedBox(height: 30),
                ],
              ),
              Text(
                "Recent Delivery Address :",
                style: AppStyles.getDrawbar().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 368,
                height: 148,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getAddressList(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "All Delivery Address :",
                style: AppStyles.getDrawbar().copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 368,
                height: 148,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _getAddressList(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
    backgroundColor: AppColors.white,
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
          "Delivery Information",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
      );
  _getDeliveryInfo() => Row(
        children: [
          Container(
            width: 200,
            height: 180,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.reviewDisebledColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Saul Goodmate",
                            style: AppStyles.getOnboardingTitle()
                                .copyWith(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const EditAddressScreen(),
                                ),
                              );
                            },
                            child: Image.asset(AppImages.edit),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(
                        """16 E Birch Hill Road
Fairbanks, NY, 99312
United States""",
                        style: AppStyles.getAdressContent(),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "865-5585 57587",
                        style: AppStyles.getAdressContent(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AddAdress(),
                ),
              );
            },
            child: Container(
              width: 100,
              height: 186,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.reviewDisebledColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.reviewDisebledColor,
                    size: 30,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Add",
                    style: AppStyles.getAdressContent()
                        .copyWith(color: AppColors.reviewDisebledColor),
                  ),
                  Text(
                    "Address",
                    style: AppStyles.getAdressContent()
                        .copyWith(color: AppColors.reviewDisebledColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  _getAddressList() => List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.only(
              right: deliverData.length - 1 != index ? 20.0 : 0),
          child: WDeliver(
            title: deliverData[index].title,
            content: deliverData[index].content,
          ),
        ),
      );
}
