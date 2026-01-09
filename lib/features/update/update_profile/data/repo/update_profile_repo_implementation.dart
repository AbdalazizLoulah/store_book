import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/update/update_profile/data/model/update_profile_model.dart';
import 'package:store_book/features/update/update_profile/data/repo/update_profile_repo.dart';

class UpdateProfileRepoImplementation extends UpdateProfileRepo {
  final ApiService apiService;

  UpdateProfileRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, UpdateProfileModel>> update({
    required String name,
    String? address,
    String? phone,
    String? email,
  }) async {
    try {
      var res = await apiService.upData(
        endpoint: "/update-profile",
        name: name,
        address: address,
        phone: phone,
        email: email,
      );
      var data = UpdateProfileModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
