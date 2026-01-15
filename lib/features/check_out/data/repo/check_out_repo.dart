import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';

import 'package:store_book/features/check_out/data/model/check_out/check_out_model.dart';
import 'package:store_book/features/check_out/data/model/governorate/governorate_response_model.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, GovernoratesResponse>> getGovernorate();
  Future<Either<Failure, CartResponseModel>> checkOut();
}
