// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/update/reset_password/data/model/reset_password.dart';
import 'package:store_book/features/update/reset_password/data/repo/reset_password_repo.dart';

class ResetPasswordRepoImplementation extends ResetPasswordRepo {
  ApiService apiService;
  ResetPasswordRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, UpdatePasswordModel>> upDatePassword({
    String? currentPassword,
    String? newPassword,
    String? newPasswordConfirmation,
  }) async {
    try {
      var res = await apiService.upData(
        endpoint: "/update-password",
        currentPassword: currentPassword,
        newPassword: newPassword,
        newPasswordConfirmation: newPasswordConfirmation,
      );
      var data = UpdatePasswordModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
