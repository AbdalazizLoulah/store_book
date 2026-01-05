import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/details/data/model/all_product_model/product_details_respons.dart';

abstract class DetailsRepo {
  Future<Either<Failure, ProductDetailsResponse>> getDetailsBook(int id);
}
