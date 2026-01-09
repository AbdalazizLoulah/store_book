import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_bottom.dart';


class CustomItemSlider extends StatelessWidget {
  const CustomItemSlider({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Stack(
            children: [
              Image.network(height: h*0.3,image, fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title:
                          "Find out the best books to read when you don’t even know what to read!!!",
                      hight: 0.02,
                      color: Colors.white,
                    ),
                        SizedBox(height:h*0.01,),
                    CustomBottom(
                      w: 0.1,
                      height: 0.045,
                      title: "Explore", titleColor: AppColor.firstColor, bottomColor: AppColor.whiteColor)
                  ],
                ),
              )
            ],
          )),
      ),
    );
  }
}
