import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/home/data/model/slider_model/slider_model.dart';
import 'package:store_book/features/home/data/repo/slider_repo/home_slider_repo.dart';

class HomeSliderRepoImplementation extends HomeSliderRepo {
  final ApiService apiService;

  HomeSliderRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, SliderModel>> getSliderData() async {
    try {
      var res = await apiService.getData(endpoint: "/sliders");
      var data = SliderModel.fromJson(res);
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
