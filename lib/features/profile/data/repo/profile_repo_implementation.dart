// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/profile/data/models/profile_model/profile_model.dart';
import 'package:store_book/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImplementation extends ProfileRepo {
  ApiService apiService;
  ProfileRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, ProfileModel>> getProfileData() async {
    try {
      var res = await apiService.getData(endpoint: "/profile");
      var data = ProfileModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
