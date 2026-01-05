import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/features/auth/login_screen%20copy/view/login_Screen.dart';
import 'package:store_book/features/auth/register_screen/view/register_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Stack(
        children: [
          Image.asset(height: h,
          width: double.infinity
          , "assets/image/welcome.jpg", fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h * 0.1),
                Center(
                  child: CustomText(
                    title: "Order Your Book Now!",
                    hight: 0.022,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: h * 0.4),
                CustomBottom(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInScreen()),
                    );
                  },
                  title: "login",
                  titleColor: AppColor.whiteColor,
                  bottomColor: AppColor.firstColor,
                ),
                SizedBox(height: h * 0.02),
                CustomBottom(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  title: "Register",
                  titleColor: Colors.black,
                  bottomColor: AppColor.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
