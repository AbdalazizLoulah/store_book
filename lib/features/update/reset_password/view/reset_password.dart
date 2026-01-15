import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/update/reset_password/data/repo/Reset_password_repo_implementation.dart';
import 'package:store_book/features/update/reset_password/view/widget/reset_password_body.dart';
import 'package:store_book/features/update/reset_password/view_model/cubit/reset_password_cubit.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocProvider(
        create: (context) =>  ResetPasswordCubit(
            ResetPasswordRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        child: ResetPasswordBody(),
      ),
    );
  }
}
