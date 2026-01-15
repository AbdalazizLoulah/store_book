// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/details/data/model/add_to_wish_list_model.dart';
import 'package:store_book/features/details/data/repo/add_wish_repo/add_to_wish_list_repo.dart';

class AddToWishListRepoImplementation extends AddToWishListRepo {
  ApiService apiService;
  AddToWishListRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, AddToWishListModel>> addToWishList(int id) async {
    try {
      var res = await apiService.upData(endpoint: "/add-to-wishlist", id: id);
      var data = AddToWishListModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
