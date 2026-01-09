import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_app_bar.dart';
import 'package:store_book/features/auth/login_screen%20copy/view_model/login/cubit/auth_login_cubit.dart';
import 'package:store_book/features/profile/view/widget/custom_setting_item.dart';
import 'package:store_book/features/profile/view_model/profile/cubit/profile_cubit.dart';
import 'package:store_book/features/update/reset_password/view/reset_password.dart';
import 'package:store_book/features/update/update_profile/view/edit_profile.dart';

class ProfileBodyScreen extends StatefulWidget {
  const ProfileBodyScreen({
    super.key,
  
  });
  
  @override
  State<ProfileBodyScreen> createState() => _ProfileBodyScreenState();
}

class _ProfileBodyScreenState extends State<ProfileBodyScreen> {
  @override
  void initState() {
    context.read<ProfileCubit>().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(title: "Profile"),
          SizedBox(height: h * 0.05),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileFailure) {
                return Container(
                  child: CustomText(
                    title: "${state.errMassage}",
                    hight: 0.03,
                    color: Colors.black,
                  ),
                );
              }
              if (state is ProfileSuccess) {
                var data = state.data;
                return Row(
                  children: [
                    SizedBox(width: h * 0.06),
                    Container(
                      width: h * 0.1,
                      height: h * 0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(h * 0.05),
                        color: AppColor.darkerColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(h * 0.05),
                        child: Image.network(data.data.image),
                      ),
                    ),
                    SizedBox(width: h * 0.01),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: "${data.data.name}",
                          hight: 0.02,
                          color: Colors.black,
                        ),
                        CustomText(
                          title: "${data.data.email}",
                          hight: 0.015,
                          color: AppColor.darkerColor,
                        ),
                      ],
                    ),
                  ],
                );
              }
              return Container(
                height: h*0.05,
                child: Center(child: CircularProgressIndicator()),
              );
            },
          ),
          SizedBox(height: h * 0.05),
          CustomSettingItem(title: "My Order"),
          SizedBox(height: h * 0.01),
          CustomSettingItem(title: "Edit Profile",onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile() ));
          },),
          SizedBox(height: h * 0.01),
          CustomSettingItem(title: "Reset Password",onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPassword()),
              );
          },),
          SizedBox(height: h * 0.01),
          CustomSettingItem(title: "FAQ"),
          SizedBox(height: h * 0.01),
          CustomSettingItem(title: "Contact Us"),
          SizedBox(height: h * 0.01),
          CustomSettingItem(title: "Privacy & Terms"),
          SizedBox(height: h * 0.01),
        ],
      ),
    );
  }
}
