import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_title_register.dart';

class OtpVerifyBody extends StatelessWidget {
  const OtpVerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final h = MediaQuery.of(context).size.height;
    return Form(
      key: key,
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
                title: "OTP Verification",
                hight: 0.035,
                color: Colors.black,
              ),
              Container(
                height: h * 0.08,
                child: CustomText(
                  title:
                      "Enter the verification code we just sent on your email address.",
                  hight: 0.015,
                  color: AppColor.darkerColor,
                ),
              ),
              SizedBox(height: h * 0.02),
              Pinput(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                length: 4,
                keyboardType: TextInputType.number,
                onCompleted: (pin) {
                  print('OTP: $pin');
                },
              ),
        
              SizedBox(height: h * 0.04),
              CustomBottom(
                onTap: () {
                
                },
                title: "Verify",
                titleColor: AppColor.whiteColor,
                bottomColor: AppColor.firstColor,
              ),
              SizedBox(height: h * 0.45),
              CustomTitleRegister(
                onTap: () {
                  Navigator.pop(context);
                },
                title1: "Didn’t received code? ",
                title2: "Resent",
              ),
            ],
          ),
        ),
      ),
    );
  }
}