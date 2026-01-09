import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/wish_list/data/model/wish_list_model.dart';

abstract class WishListRepo {
  Future<Either<Failure,List<WishListModel>>> getLocalData();
}
