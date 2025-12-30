import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

class CustomTitleRegister extends StatelessWidget {
  const CustomTitleRegister({super.key, required this.title1, required this.title2, this.onTap});
  final String title1;
  final String title2;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          title: title1,
          hight: 0.018,
          color: Colors.black,
        ),
        GestureDetector(
          onTap:onTap, 
          child: CustomText(
            title: title2,
            hight: 0.018,
            color: AppColor.firstColor,
          ),
        ),
      ],
    );
  }
}
