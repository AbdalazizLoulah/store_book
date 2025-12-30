import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

class CustomDeferentLogin extends StatelessWidget {
  const CustomDeferentLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          children: [
            Container(width: h * 0.112, height: 2, color: AppColor.grayColor),
            SizedBox(width: w * 0.02),
            CustomText(title: "Or Login with", hight: 0.02, color: Colors.grey),
            SizedBox(width: w * 0.02),
            Container(width: h * 0.113, height: 2, color: AppColor.grayColor),
          ],
        ),
        SizedBox(height: h * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: h * 0.06,
              width: w * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.grayColor),
              ),
              child: Icon(Icons.facebook,color: Colors.blue,size: h*0.05,),
            ),
            Container(
              height: h * 0.06,
              width: w * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.grayColor),
              ),
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.google,
                  size: 40.0,
                  color: Colors.red, // You can customize the color
                ),
              )
            ),
            Container(
              height: h * 0.06,
              width: w * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.grayColor),
              ),
              child: Icon(Icons.apple, color: Colors.black, size: h * 0.05),
            ),
          ],
        ),
      ],
    );
  }
}
