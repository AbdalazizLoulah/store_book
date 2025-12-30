import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.validator, required this.title,
  });
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.grayColor,
        hint: CustomText(
          title: title,
          hight: 0.02,
          color: const Color.fromARGB(255, 178, 175, 175),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
