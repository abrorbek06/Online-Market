import 'package:dokon/presintation/ui/resourses/colors/app_colors.dart';
import 'package:dokon/presintation/ui/resourses/styles/app_styles.dart';
import 'package:dokon/presintation/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';

class EditMyAccount extends StatefulWidget {
  const EditMyAccount({super.key});

  @override
  State<EditMyAccount> createState() => _EditMyAccountState();
}

class _EditMyAccountState extends State<EditMyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _appBar(),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    const SizedBox(
                      width: 150,
                      height: 150,
                      child: CircleAvatar(
                        backgroundColor: AppColors.lightGray,
                        backgroundImage: AssetImage(
                          "assets/profile.png",
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const EditMyAccount()));
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.mainColor,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: const Icon(
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
              const Text(
                "Abrorbek Isaev",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 6),
              Text(
                "isaevabrorbek20@gmail.com",
                style: AppStyles.getOrderInfo(),
              ),
              const SizedBox(height: 30),
              TextFeild(title: "Full name"),
              const SizedBox(height: 24),
              TextFeild(title: "Email address"),
              const SizedBox(height: 24),
              TextFeild(title: "Change password"),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() => AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
        ),
      );
}
