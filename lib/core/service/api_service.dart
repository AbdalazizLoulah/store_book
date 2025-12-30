import 'package:dio/dio.dart';

class ApiService {
  final String _paseUrl = "https://codingarabic.online/api";
  final Dio _dio;

  ApiService({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> auth({
    required String endpoint,
    String? name,
    String? email,
    String? password,
    String? passwordConfirmation,
  }) async {
    var res = await _dio.post(
      "$_paseUrl$endpoint",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      ),
      data: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      },
    );
    return res.data;
  }
}
