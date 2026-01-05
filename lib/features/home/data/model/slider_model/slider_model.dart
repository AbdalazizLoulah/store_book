import 'package:store_book/features/home/data/model/slider_model/slider_data.dart';

class SliderModel {
  final SliderData? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  SliderModel({this.data, this.message, this.error, this.status});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      data: json['data'] != null ? SliderData.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'],
      status: json['status'],
    );
  }
}


