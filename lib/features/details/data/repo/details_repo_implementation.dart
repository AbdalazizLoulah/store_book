import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/details/data/model/all_product_model/product_details_respons.dart';
import 'package:store_book/features/details/data/repo/details_repo.dart';


class DetailsRepoImplementation extends DetailsRepo {
  final ApiService apiService;

  DetailsRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, ProductDetailsResponse>> getDetailsBook(int id) async {
    try {
      var res = await apiService.getData(endpoint: "/products/$id");
      var data = ProductDetailsResponse.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
