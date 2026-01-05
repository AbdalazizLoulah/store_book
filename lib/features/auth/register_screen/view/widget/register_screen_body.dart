import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_deferent_login.dart';
import 'package:store_book/core/utile/custom_text_form_field.dart';
import 'package:store_book/core/utile/custom_title_register.dart';
import 'package:store_book/features/auth/login_screen%20copy/view/login_Screen.dart';
import 'package:store_book/features/auth/register_screen/view_model/register/cubit/auth_register_cubit.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController conformPasswordController =
        TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.07),
              CustomBackBottom(),
              SizedBox(height: h * 0.04),
              CustomText(
                title: "Hello! Register to get started",
                hight: 0.03,
                color: Colors.black,
              ),
              SizedBox(height: h * 0.04),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  if (value.length < 5) {
                    return "the name is short";
                  }
                  return null;
                },
                controller: nameController,
                title: "Username",
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
                title: "Email",
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                obscure: true,
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
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                obscure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value != passwordController.text) {
                    return "the password not conform";
                  }
                  return null;
                },
                controller: conformPasswordController,
                title: "Conform Password",
              ),
              SizedBox(height: h * 0.04),
              BlocConsumer<AuthRegisterCubit, AuthRegisterState>(
                listener: (context, state) {
                  if (state is AuthRegisterFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        icon: Icon(Icons.error),
                        content: Container(
                          height: h * 0.05,
                          width: h * 0.05,
                          child: Column(
                            children: [
                              Text(
                                state.errMassage,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          CustomBottom(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: "close",
                            titleColor: Colors.black,
                            bottomColor: AppColor.whiteColor,
                          ),
                        ],
                      ),
                    );
                  }
                  if (state is AuthRegisterSuccess) {
                    var d = state.register;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        onVisible: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogInScreen(),
                            ),
                          );
                        },
                        content: Text('${d.message}'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthRegisterLoading) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return CustomBottom(
                    onTap: () async {
                      if (key.currentState!.validate()) {
                        context.read<AuthRegisterCubit>().authRegister(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          passwordConform: conformPasswordController.text,
                        );
                      }
                      
                    },
                    title: "Register",
                    titleColor: AppColor.whiteColor,
                    bottomColor: AppColor.firstColor,
                  );
                },
              ),
              SizedBox(height: h * 0.02),
              CustomDeferentLogin(),
              SizedBox(height: h * 0.06),
              CustomTitleRegister(
                title1: "Already have an account?",
                title2: "Login",
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
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
