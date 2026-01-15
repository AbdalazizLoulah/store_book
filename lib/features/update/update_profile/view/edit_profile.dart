import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/update/update_profile/data/repo/update_profile_repo_implementation.dart';
import 'package:store_book/features/update/update_profile/view/widgets/edit_profile_body.dart';
import 'package:store_book/features/update/update_profile/view_model/up_date_profile/cubit/up_date_profile_cubit.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: BlocProvider(
        create: (context) => UpDateProfileCubit(
            UpdateProfileRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        child: EditProfileBody(),
      ),
    );
  }
}
