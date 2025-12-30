import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.hight,
    required this.color,
  });
  final String title;
  final double hight;
  final Color color;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Text(
      title,
      style: TextStyle(
        fontFamily: "CourierPrime",
        fontSize: h * hight,
        color: color,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
