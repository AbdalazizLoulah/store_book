import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_text_form_field.dart';
import 'package:store_book/features/navigater_bar/view/navigator_screen.dart';
import 'package:store_book/features/update/reset_password/view_model/cubit/reset_password_cubit.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController newPasswordController = TextEditingController();
    final TextEditingController conformPasswordController =
        TextEditingController();
    final h = MediaQuery.of(context).size.height;
    return Form(
      key: key,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: h * 0.07),
              CustomBackBottom(),
              SizedBox(height: h * 0.06),
              Center(
                child: CustomText(
                  title: "New Password",
                  hight: 0.03,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: h * 0.03),
              CustomTextFormField(
                validator: (value) {
                  String passwordRegExp = r'^(?=.*[A-Za-z])(?=.*\d).{8,}$';
                  RegExp regExp = RegExp(passwordRegExp);
                  if (value == null || value.isEmpty) {
                    return "Please enter your old password";
                  }
                  if (!regExp.hasMatch(value)) {
                    return "Please enter the value ";
                  }
                  return null;
                },
                controller: passwordController,
                title: "CurrentPassword",
              ),
              SizedBox(height: h * 0.04),
              CustomTextFormField(
                obscure: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your new password";
                  }
                  return null;
                },
                controller: newPasswordController,
                title: "New Password",
              ),
              SizedBox(height: h * 0.04),
              CustomTextFormField(
                obscure: true,
                addIcon: true,
                controller: conformPasswordController,
                title: "Confirm Password ",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value != newPasswordController.text) {
                    return "the password not conform";
                  }
                  return null;
                },
              ),
              SizedBox(height: h * 0.04),
              BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                listener: (context, state) {
                  if (state is ResetPasswordFailure) {
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
                      ),
                    );
                  }
                  if (state is ResetPasswordSuccess) {
                    var d = state.data;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        onVisible: () {
                          // init(d.data!.token!,d.data!.user!.email!,
                          //   passwordController.text,
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigatorScreen(),
                            ),
                          );
                        },
                        content: Text('${d.message}'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ResetPasswordLoading) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return CustomBottom(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        context.read<ResetPasswordCubit>().updatePassword(
                          currentPassword: passwordController.text,
                          newPassword: newPasswordController.text,
                          newPasswordConfirmation: newPasswordController.text,
                        );
                      }
                    },
                    title: "Update Profile",
                    titleColor: AppColor.whiteColor,
                    bottomColor: AppColor.firstColor,
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
