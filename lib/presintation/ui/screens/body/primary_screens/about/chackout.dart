import 'package:dokon/presintation/ui/resourses/styles/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../resourses/colors/app_colors.dart';
import '../../../../resourses/images/app_images.dart';
import '../../../../resourses/styles/app_styles.dart';

class ChackoutScreen extends StatefulWidget {
  const ChackoutScreen({Key? key}) : super(key: key);

  @override
  State<ChackoutScreen> createState() => _ChackoutScreenState();
}

class _ChackoutScreenState extends State<ChackoutScreen> {
  TextEditingController cardController = TextEditingController();
  TextEditingController expireController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<Providers>(builder: (context, model, child) {
            if (model.paymeState == PaymeState.success) {
              cardController.text = "";
              expireController.text = "";
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (model.errors.isNotEmpty) ...{
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFFFFA3A3),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color(0xFFE34A4A))),
                      child: Column(
                        children: List.generate(
                          model.errors.length,
                          (index) => Text(
                            model.errors[index],
                          ),
                        ),
                      ),
                    ),
                  )
                },
                if (model.message.isNotEmpty) ...{
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Color(0xFF69E38B),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Color(0xFF1DA658))),
                      child: Text(model.message),
                    ),
                  )
                },
                Image.asset(AppImages.card),
                const SizedBox(height: 60),
                _getTextFiled1(
                  controller: cardController,
                  title: "Card Number",
                  hintText: "0000 0000 0000 0000",
                ),
                _getTextFiled1(
                  controller: expireController,
                  title: "Expiry Date",
                  hintText: "00/00",
                ),
                if (model.paymeState == PaymeState.otp) ...{
                  _getTextFiled1(
                    controller: codeController,
                    title: "Code",
                    hintText: "SMS codeni kiriting",
                  ),
                },
                GestureDetector(
                  onTap: () {
                    if (PaymeState == PaymeState.otp) {
                      model.sendOtp(code: codeController.text);
                    } else {
                      model.send(
                        cardNumber: cardController.text,
                        expire: expireController.text,
                      );
                    }
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
                        "Play Now",
                        style: AppStyles.getActionStyle()
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      // bottomNavigationBar: _getBottomNavigationBar(),
    );
  }

  _getTextFiled1(
          {required String title,
          required String hintText,
          required TextEditingController controller}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.getDrawbar(),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: controller,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              hintText: hintText,
              labelStyle: AppStyles.getOrderInfo(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.red),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.reviewDisebledColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(
                  color: AppColors.reviewDisebledColor,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
  // _getBottomNavigationBar() => GestureDetector(
  //       onTap: () {
  //       },
  //       child: Container(
  //         padding: EdgeInsets.zero,
  //         margin: const EdgeInsets.all(16),
  //         width: 368,
  //         height: 50,
  //         color: AppColors.mainColor,
  //         child: Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             "Play Now",
  //             style: AppStyles.getActionStyle().copyWith(color: Colors.white),
  //           ),
  //         ),
  //       ),
  //     );
  _appBar() => AppBar(
        elevation: 1,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          "Checkout",
          style: AppStyles.getOnboardingTitle().copyWith(fontSize: 20),
        ),
      );
}
