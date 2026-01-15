import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:store_book/features/profile/view/widget/profile_body_screen.dart';
import 'package:store_book/features/profile/view_model/profile/cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
            ProfileRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
      child: ProfileBodyScreen(),
    );
  }
}
