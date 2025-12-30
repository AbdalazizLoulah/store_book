import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/auth/register_screen/data/model/register_model.dart';
import 'package:store_book/features/auth/register_screen/data/repo/register_repo.dart';

class RegisterRepoImplementation extends RegisterRepo {
  final ApiService apiService;

  RegisterRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, RegisterModel>> register(
    String name,
    String email,
    String password,
    String passwordConform,
  ) async {
    try {
      var data = await apiService.auth(
        endpoint: "/register",
        name: name,
        email: email,
        password: password,
        passwordConfirmation: passwordConform,
      );
      var register = RegisterModel.fromJson(data);
      return right(register);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
