import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/details/data/model/add_to_wish_list_model.dart';

abstract class AddToWishListRepo {
  Future<Either<Failure,AddToWishListModel>> addToWishList(int id);
}
