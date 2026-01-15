import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/auth/register_screen/data/repo/register_repo_implementation.dart';
import 'package:store_book/features/auth/register_screen/view/widget/register_screen_body.dart';
import 'package:store_book/features/auth/register_screen/view_model/register/cubit/auth_register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: BlocProvider(
          create: (context) => AuthRegisterCubit(
            RegisterRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
          child: RegisterScreenBody(),
        ),
      ),
    );
  }
}
