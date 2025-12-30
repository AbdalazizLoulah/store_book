import 'package:flutter/material.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CustomText(title: "HomeScreen", hight: 0.07, color: Colors.black),),
    );
  }
}