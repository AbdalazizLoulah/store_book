import 'package:store_book/features/details/data/model/all_product_model/prouduct_details_model.dart';

class ProductDetailsResponse {
  final ProductDetails? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  ProductDetailsResponse({
    this.data,
    this.message,
    this.error,
    this.status,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      data: json['data'] != null
          ? ProductDetails.fromJson(json['data'])
          : null,
      message: json['message'],
      error: json['error'],
      status: json['status'],
    );
  }
}
