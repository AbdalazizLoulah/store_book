import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/auth/login_screen%20copy/data/model/log_in_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginModel>> logIn({
    required String email,
    required String password,
  });
}
