import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/auth/login_screen%20copy/data/repo/login_repo_implementation.dart';
import 'package:store_book/features/auth/login_screen%20copy/view/widget/login_screen_body.dart';
import 'package:store_book/features/auth/login_screen%20copy/view_model/login/cubit/auth_login_cubit.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: BlocProvider(
          create: (context) => AuthLoginCubit(
            LoginRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
          child: LoginScreenBody(),
        ),
      ),
    );
  }
}
