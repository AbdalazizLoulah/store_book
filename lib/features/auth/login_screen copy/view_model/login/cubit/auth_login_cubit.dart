import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:store_book/features/auth/login_screen%20copy/data/model/log_in_model.dart';
import 'package:store_book/features/auth/login_screen%20copy/data/repo/login_repo.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(this.loginRepo) : super(AuthLoginInitial());
  final LoginRepo loginRepo;
  Future authLogin({required String email, required String password}) async {
    final hasConnection =
        await InternetConnectionChecker.instance.hasConnection;
    if (!hasConnection) {
      emit(AuthLoginFailure(errMassage: '❌ لا يوجد اتصال بالإنترنت'));
    } else {
      emit(AuthLoginLoading());
      var login = await loginRepo.logIn(email: email, password: password);
      login.fold(
        (failure) {
          emit(AuthLoginFailure(errMassage: failure.errMassage));
        },
        (login) {
          emit(AuthLoginSuccess(login: login));
        },
      );
    }
  }
}
