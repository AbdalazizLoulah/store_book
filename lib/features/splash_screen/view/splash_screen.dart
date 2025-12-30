import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/splash_screen/view/widgets/splash_screen_body.dart';
import 'package:store_book/features/welcom_screen/view/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen() ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SplashScreenBody());
  }
}
