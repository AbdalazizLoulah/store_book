import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/features/navigater_bar/view/navigator_screen.dart';
import 'package:store_book/features/splash_screen/view/widgets/splash_screen_body.dart';
import 'package:store_book/features/welcom_screen/view/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  init() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 3), () async {
      if (sharedPreferences.getString('token') != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => NavigatorScreen(
            ),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
      }
    });
  }

  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SplashScreenBody(),
    );
  }
}
