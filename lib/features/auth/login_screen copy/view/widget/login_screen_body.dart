import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_deferent_login.dart';
import 'package:store_book/core/utile/custom_text_form_field.dart';
import 'package:store_book/core/utile/custom_title_register.dart';
import 'package:store_book/features/auth/login_screen%20copy/view_model/login/cubit/auth_login_cubit.dart';
import 'package:store_book/features/auth/register_screen/view/register_Screen.dart';
import 'package:store_book/features/home/view/home_screen.dart';


class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final h = MediaQuery.of(context).size.height;
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.07),
              CustomBackBottom(),
              SizedBox(height: h * 0.04),
              CustomText(
                title: "Welcome back! Glad to see you, Again!",
                hight: 0.03,
                color: Colors.black,
              ),
              SizedBox(height: h * 0.05),
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
                title: "Email",
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                validator: (value) {
                  String passwordRegExp = r'^(?=.*[A-Za-z])(?=.*\d).{8,}$';
                  RegExp regExp = RegExp(passwordRegExp);
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!regExp.hasMatch(value)) {
                    return "Please enter the value ";
                  }
                  return null;
                },
                controller: passwordController,
                title: "Password",
              ),
              SizedBox(height: h * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomText(
                      title: "forgetPassword",
                      hight: 0.02,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.04),
              BlocConsumer<AuthLoginCubit, AuthLoginState>(
                listener: (context, state) {
                  if(state is AuthLoginFailure){
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Error"),
                          icon: Icon(Icons.error),
                          content: Column(
                            children: [
                              Text(
                                state.errMassage,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    }if(state is AuthLoginSuccess){
                      var d = state.login;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          onVisible: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          },
                          content: Text('${d.message}'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                },
                builder: (context, state) {
                  if (state is AuthLoginLoading) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return CustomBottom(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        context.read<AuthLoginCubit>().authLogin(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    title: "LogIn",
                    titleColor: AppColor.whiteColor,
                    bottomColor: AppColor.firstColor,
                  );
                },
              ),
              SizedBox(height: h * 0.04),
              CustomDeferentLogin(),
              SizedBox(height: h * 0.18),
              CustomTitleRegister(
                title1: "Don’t have an account?",
                title2: " Register Now",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
