// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/cart/data/model/get_cart_model.dart';
import 'package:store_book/features/home/data/repo/add_to_cart/add_to_cart_repo.dart';

class AddToCartRepoImplementation extends AddToCartRepo {
  ApiService apiService;
  AddToCartRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, CartModel>> addToCart(int id) async {
    try {
      var res = await apiService.upData(endpoint: "/add-to-cart", id: id);
      var data = CartModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
