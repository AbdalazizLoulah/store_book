import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/update/reset_password/data/model/reset_password.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, UpdatePasswordModel>> upDatePassword({
    String? currentPassword,
    String? newPassword,
    String? newPasswordConfirmation,
  });
}
