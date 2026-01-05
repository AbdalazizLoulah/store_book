import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/product_respons.dart';

abstract class HomeProductRepo {
  Future<Either<Failure, ProductsResponse>> getAllProducts();
}
