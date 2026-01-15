// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/wish_list/data/model/wish_list_model.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo.dart';

class WishListRepoImplementation extends WishListRepo {
  ApiService apiService;
  WishListRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, WishListModel>> getWishList() async {
    try {
      var res = await apiService.getData(endpoint: "/wishlist");
      var data = WishListModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
