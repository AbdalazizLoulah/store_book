import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/home/data/model/slider_model/slider_model.dart';
import 'package:store_book/features/home/view/widget/custom_item_slider.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.data});
  final SliderModel data;
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final List<Widget> images = [
      CustomItemSlider(image: widget.data.data!.sliders![0].image.toString(),),
      CustomItemSlider(image: widget.data.data!.sliders![1].image.toString()),
      CustomItemSlider(image: widget.data.data!.sliders![2].image.toString()),
    ];
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            enableInfiniteScroll: false,
          ),
          items: images.map((image) {
            return image;
          }).toList(),
        ),
        SizedBox(height: h * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: currentIndex == index ? 16 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? AppColor.firstColor
                    : AppColor.darkerColor,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
