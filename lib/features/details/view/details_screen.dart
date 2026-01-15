import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/details/data/repo/add_wish_repo/add_to_wish_list_repo_implementation.dart';
import 'package:store_book/features/details/data/repo/details_repo_implementation.dart';
import 'package:store_book/features/details/view/widget/details_screen_body.dart';
import 'package:store_book/features/details/view_model/add_to_wish_list/cubit/add_to_wish_list_cubit.dart';
import 'package:store_book/features/details/view_model/deitails/cubit/details_cubit.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo_implementation.dart';
import 'package:store_book/features/wish_list/view_model/cubit/get_wish_list_cubit.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DetailsCubit(
              DetailsRepoImplementation(apiService: ApiService(dio: Dio())),
            ),
          ),
          BlocProvider(create: (context) => AddToWishListCubit(
              AddToWishListRepoImplementation(
                apiService: ApiService(dio: Dio()),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => GetWishListCubit(
              WishListRepoImplementation(apiService: ApiService(dio: Dio())
            ),
          ),)
        ],
        child: DetailsScreenBody(id: id),
      ),
    );
  }
}
