import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/cart/data/model/get_cart_model.dart';

abstract class AddToCartRepo {
  Future<Either<Failure, CartModel>> addToCart(int id);
}
