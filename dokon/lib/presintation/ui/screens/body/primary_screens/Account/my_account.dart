import 'package:dokon/presintation/ui/resourses/styles/Provider.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Account/my_Orders.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Account/paymentMethod.dart';
import 'package:dokon/presintation/ui/screens/body/primary_screens/Account/shipping_Addresses.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/styles/app_styles.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isSwitching1 = false;
  bool isSwitching2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: const CircleAvatar(
                        backgroundColor: AppColors.lightGray,
                        backgroundImage: NetworkImage(
                            "https://www.goodmorningimagesdownload.com/wp-content/uploads/2021/12/Best-Quality-Profile-Images-Pic-Download-2023.jpg"),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainColor,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Saul Goodmate",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                "saulgo35@gmail.com",
                style: AppStyles.getOrderInfo(),
              ),
              const SizedBox(height: 30),
              _getSwitch1("Notification"),
              _getOrder(
                "My Orders",
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyOrders(),
                    ),
                  );
                },
              ),
              _getOrder(
                "Payment Method",
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentMethod(),
                    ),
                  );
                },
              ),
              _getSwitch2("Dark Mode"),
              _getOrder(
                "Shipping Addresses",
                () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShippingAddresses(),
                    ),
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Logout",
                  style: AppStyles.getActionStyle(),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
      );
  _getSwitch1(String title) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Switch(
                value: isSwitching1,
                onChanged: (value) {
                  setState(() {
                    isSwitching1 = value;
                  });
                },
                activeTrackColor: Colors.red.shade200,
                activeColor: Colors.red,
              )
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 20),
        ],
      );
  _getSwitch2(String title) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Consumer<Providers>(builder: (context, provider, child) {
                return Switch(
                  value: isSwitching2,
                  onChanged: (value) {
                    context.read<Providers>().changeTheme();
                    isSwitching2 = value;
                  },
                  activeTrackColor: Colors.red.shade200,
                  activeColor: Colors.red,
                );
              })
            ],
          ),
          const Divider(thickness: 1),
          const SizedBox(height: 20),
        ],
      );
  _getOrder(String title, var onTab) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: onTab,
                child: const Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1),
          const SizedBox(height: 20),
        ],
      );
}
