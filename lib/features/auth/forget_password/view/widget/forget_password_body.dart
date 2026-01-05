import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_text_form_field.dart';
import 'package:store_book/core/utile/custom_title_register.dart';
import 'package:store_book/features/auth/otp_verify/view/otp_verify_screen.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final h = MediaQuery.of(context).size.height;
    return Form(key: key,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.07),
              CustomBackBottom(),
              SizedBox(height: h * 0.04),
              CustomText(
                title: "Forgot Password?",
                hight: 0.035,
                color: Colors.black,
              ),
              Container(
                height: h * 0.08,
                child: CustomText(
                  title:
                      "Don't worry! It occurs. Please enter the email address linked with your account.",
                  hight: 0.015,
                  color: AppColor.darkerColor,
                ),
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                validator: (value) {
                  String emailPattern =
                      r"^[A-Za-z0-9]+([._%+-]?[A-Za-z0-9]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}$";
                  RegExp regExp = RegExp(emailPattern);
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!regExp.hasMatch(value)) {
                    return "Please enter the value can use whit email";
                  }
                  return null;
                },
                controller: emailController,
                title: "Enteryouremail",
              ),
              SizedBox(height: h * 0.04),
              CustomBottom(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OtpVerifyScreen()),
                  );
                },
                title: "Send Code", titleColor: AppColor.whiteColor, bottomColor: AppColor.firstColor,
              ),
              SizedBox(height: h * 0.45),
              CustomTitleRegister(
                onTap: () {
                  Navigator.pop(context);
                },
                title1: "Remember Password?", title2: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
