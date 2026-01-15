import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/core/utile/custom_text_form_field.dart';
import 'package:store_book/features/navigater_bar/view/navigator_screen.dart';
import 'package:store_book/features/update/update_profile/view_model/up_date_profile/cubit/up_date_profile_cubit.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
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
                  title: "Update Profile",
                  hight: 0.03,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                controller: nameController,
                title: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  if (value.length < 5) {
                    return "the name is short";
                  }
                  return null;
                },
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(
                controller: addressController,
                title: "Address",
              ),
              SizedBox(height: h * 0.02),
              CustomTextFormField(controller: phoneController, title: "Phone"),
              SizedBox(height: h * 0.02),
              CustomTextFormField(controller: emailController, title: "Email"),
              SizedBox(height: h * 0.04),
              BlocConsumer<UpDateProfileCubit, UpDateProfileState>(
                listener: (context, state) {
                  if (state is UpDateProfileFailure) {
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
                  if (state is UpDateProfileSuccess) {
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
                              builder: (context) => NavigatorScreen(
                                
                              ),
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
                  if (state is UpDateProfileLoading) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  return CustomBottom(
                    onTap: () {
                      if (key.currentState!.validate()) {
                        context.read<UpDateProfileCubit>().upDateProfile(
                          name: nameController.text,
                          address: addressController.text,
                          email: emailController.text,
                          phone: phoneController.text,
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
