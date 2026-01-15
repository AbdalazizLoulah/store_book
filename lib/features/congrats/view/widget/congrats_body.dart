import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/features/navigater_bar/view/navigator_screen.dart';

class CongratsBody extends StatelessWidget {
  const CongratsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: h * 0.17,
              width: h * 0.17,
              "assets/image/Successmark.png",
              fit: BoxFit.cover,
            ),
            SizedBox(height: h * 0.04),
            CustomText(title: "SUCCESS!", hight: 0.05, color: Colors.black),
            SizedBox(height: h * 0.02),
            Container(
              height: h * 0.07,
              width: h * 0.33,
              child: CustomText(
                title:
                    "Your order will be delivered soon.\nThank you for choosing our app!",
                hight: 0.0151,
                color: AppColor.darkerColor,
              ),
            ),
            SizedBox(height: h * 0.05),
            CustomBottom(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> NavigatorScreen()),
                );
              },
              title: "Back To Home",
              titleColor: AppColor.whiteColor,
              bottomColor: AppColor.firstColor,
            ),
          ],
        ),
      ),
    );
  }
}
