import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/core/service/local_data/local_service_sheard.dart';
import 'package:store_book/features/auth/login_screen%20copy/data/repo/login_repo_implementation.dart';
import 'package:store_book/features/auth/login_screen%20copy/view_model/login/cubit/auth_login_cubit.dart';
import 'package:store_book/features/auth/register_screen/data/repo/register_repo_implementation.dart';
import 'package:store_book/features/auth/register_screen/view_model/register/cubit/auth_register_cubit.dart';
import 'package:store_book/features/details/data/repo/details_repo_implementation.dart';
import 'package:store_book/features/details/view_model/deitails/cubit/details_cubit.dart';
import 'package:store_book/features/home/data/repo/product_repo/home_product_repo_implementation.dart';
import 'package:store_book/features/home/data/repo/slider_repo/home_slider_repo_implementation.dart';
import 'package:store_book/features/home/view_model/products/cubit/products_cubit.dart';
import 'package:store_book/features/home/view_model/slider/cubit/slider_cubit.dart';
import 'package:store_book/features/profile/data/repo/profile_repo_implementation.dart';
import 'package:store_book/features/profile/view_model/profile/cubit/profile_cubit.dart';
import 'package:store_book/features/splash_screen/view/splash_screen.dart';
import 'package:store_book/features/update/reset_password/data/repo/Reset_password_repo_implementation.dart';
import 'package:store_book/features/update/reset_password/data/repo/reset_password_repo.dart';
import 'package:store_book/features/update/reset_password/view_model/cubit/reset_password_cubit.dart';
import 'package:store_book/features/update/update_profile/data/repo/update_profile_repo.dart';
import 'package:store_book/features/update/update_profile/data/repo/update_profile_repo_implementation.dart';
import 'package:store_book/features/update/update_profile/view_model/up_date_profile/cubit/up_date_profile_cubit.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo_implementation.dart';
import 'package:store_book/features/wish_list/view_model/get_local_data/cubit/get_local_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthRegisterCubit(
            RegisterRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => AuthLoginCubit(
            LoginRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => SliderCubit(
            HomeSliderRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(
            HomeProductRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => DetailsCubit(
            DetailsRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            ProfileRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => UpDateProfileCubit(
            UpdateProfileRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
        BlocProvider(
          create: (context) => GetLocalDataCubit(WishListRepoImplementation()),
        ),
        BlocProvider(
          create: (context) => ResetPasswordCubit(
            ResetPasswordRepoImplementation(apiService: ApiService(dio: Dio())),
          ),
        ),
      ],
      child: MaterialApp(theme: ThemeData.light(), home: SplashScreen()),
    );
  }
}
