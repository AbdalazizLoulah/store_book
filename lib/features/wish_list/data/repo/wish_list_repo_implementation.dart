import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_book/core/errors/failure.dart';
import 'package:store_book/core/service/local_data/local_service_sqf.dart';
import 'package:store_book/features/wish_list/data/model/wish_list_model.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo.dart';

class WishListRepoImplementation extends WishListRepo {
  LocalServiceSqf sql = LocalServiceSqf();
  @override
  Future<Either<Failure, List<WishListModel>>> getLocalData() async {
    try {
      List<Map<String, dynamic>> res = await sql.readData(
        'SELECT * FROM Test ',
      );
      var data = res.map((e) => WishListModel.fromMap(e)).toList();
      print(data);
      return right(data);
    } catch (e) {
    if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
    }
  }

