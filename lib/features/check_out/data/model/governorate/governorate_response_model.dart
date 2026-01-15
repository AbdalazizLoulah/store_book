import 'package:store_book/features/check_out/data/model/governorate/governorate_model.dart';

class GovernoratesResponse {
  final List<GovernorateModel> data;
  final String message;
  final List<dynamic> error;
  final int status;

  GovernoratesResponse({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory GovernoratesResponse.fromJson(Map<String, dynamic> json) {
    return GovernoratesResponse(
      data: List<GovernorateModel>.from(
        json['data'].map((e) => GovernorateModel.fromJson(e)),
      ),
      message: json['message'],
      error: json['error'],
      status: json['status'],
    );
  }
}
