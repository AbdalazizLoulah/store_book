import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/cart/data/repo/cart_repo_implementation.dart';
import 'package:store_book/features/check_out/data/repo/check_out_repo_implementation.dart';
import 'package:store_book/features/check_out/view/widget/check_out_body.dart';
import 'package:store_book/features/check_out/view_model/check_out/cubit/check_out_cubit.dart';
import 'package:store_book/features/check_out/view_model/get_governorate/cubit/get_governorate_cubit.dart';
import 'package:store_book/features/check_out/view_model/plase_order/cubit/place_order_cubit.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key, required this.total});
  final String total;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetGovernorateCubit(
              CheckOutRepoImplementation(apiService: ApiService(dio: Dio())),
            ),
          ),
          BlocProvider(
            create: (context) => CheckOutCubit(
              CheckOutRepoImplementation(apiService: ApiService(dio: Dio())),
            ),
          ),
          BlocProvider(
            create: (context) => PlaceOrderCubit(
              CartRepoImplementation(apiService: ApiService(dio: Dio())),
            ),
          ),
        ],
        child: CheckOutBody(total: total),
      ),
    );
  }
}
