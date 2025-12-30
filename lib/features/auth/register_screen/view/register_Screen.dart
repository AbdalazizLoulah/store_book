import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/auth/register_screen/view/widget/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: RegisterScreenBody(),
      ),
    );
  }
}
