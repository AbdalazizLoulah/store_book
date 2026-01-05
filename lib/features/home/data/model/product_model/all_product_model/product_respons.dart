import 'package:store_book/features/home/data/model/product_model/all_product_model/data_model.dart';

class ProductsResponse {
  final ProductsData? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  ProductsResponse({this.data, this.message, this.error, this.status});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      data: json['data'] != null ? ProductsData.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'],
      status: json['status'],
    );
  }
}
