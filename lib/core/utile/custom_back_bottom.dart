import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';

class CustomBackBottom extends StatelessWidget {
  const CustomBackBottom({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return   GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: h * 0.07,
              width: h * 0.07,
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 2, color: const Color.fromARGB(255, 220, 213, 213)),
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.only(left: 10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: h * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
  }
}