import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/auth/login_screen%20copy/view/widget/login_screen_body.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: LoginScreenBody(),
      ),
    );
  }
}