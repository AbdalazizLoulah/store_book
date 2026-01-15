import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo_implementation.dart';
import 'package:store_book/features/wish_list/view/widget/wish_list_body.dart';
import 'package:store_book/features/wish_list/view_model/cubit/get_wish_list_cubit.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWishListCubit(
        WishListRepoImplementation(apiService: ApiService(dio: Dio())),
      ),
      child: WishListBody(),
    );
  }
}
