import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/auth/register_screen/data/model/register_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterModel>> register(
    String name,
    String email,
    String password,
    String passwordConform,
  );
}
