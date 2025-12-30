import 'package:flutter/material.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.title,
    required this.titleColor,
    required this.bottomColor, this.onTap,
  });
  final String title;
  final Color titleColor;
  final Color bottomColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.07,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bottomColor,
        ),
        child: Center(
          child: CustomText(title: title, hight: 0.02, color: titleColor),
        ),
      ),
    );
  }
}
