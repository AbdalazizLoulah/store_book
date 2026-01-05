// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/product_respons.dart';
import 'package:store_book/features/home/data/repo/product_repo/home_product_repo.dart';

class HomeProductRepoImplementation extends HomeProductRepo {
  ApiService apiService;
  HomeProductRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, ProductsResponse>> getAllProducts() async {
    try {
      var res = await apiService.getData(endpoint: "/products");
      var data = ProductsResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
