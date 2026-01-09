import 'package:dartz/dartz.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/features/update/update_profile/data/model/update_profile_model.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, UpdateProfileModel>> update({
    required String name,
    String? address,
    String? phone,
    String? email,
  });
}
