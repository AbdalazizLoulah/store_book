import 'package:dio/dio.dart';

abstract class Failure {
  final String errMassage;

  const Failure(this.errMassage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMassage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Time out");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Time out");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive Time out");
      case DioExceptionType.badCertificate:
        return ServerFailure("BadCertificate");
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(" Response Is cancel");
      case DioExceptionType.connectionError:
        return ServerFailure(" Response is ConnectionError");
      case DioExceptionType.unknown:
        return ServerFailure(" Response Is Unknown");
      }
  }
  factory ServerFailure.fromBadResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403 ||statusCode==422||statusCode ==405) {
      if (response['errors']?['email']?.isNotEmpty != true) {
        return ServerFailure(response['message'] ?? "Unknown Error");
      }
      return ServerFailure(response['errors']?['email'][0]);
    } else if (statusCode == 404) {
      return ServerFailure("Response Not Found");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error");
    } else {
      return ServerFailure("There is was an Error");
    }
  }
}
