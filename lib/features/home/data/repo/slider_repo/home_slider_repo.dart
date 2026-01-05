import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/home/data/model/slider_model/slider_model.dart';

abstract class HomeSliderRepo {
  Future<Either<Failure,SliderModel>> getSliderData();
}
