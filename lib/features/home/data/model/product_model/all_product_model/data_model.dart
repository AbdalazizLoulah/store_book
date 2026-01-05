import 'package:store_book/features/home/data/model/product_model/all_product_model/links_model.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/meta_model.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/prouduct_model.dart';

class ProductsData {
  final List<Product>? products;
  final Meta? meta;
  final Links? links;

  ProductsData({this.products, this.meta, this.links});

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      products: json['products'] != null
          ? List<Product>.from(json['products'].map((x) => Product.fromJson(x)))
          : [],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      links: json['links'] != null ? Links.fromJson(json['links']) : null,
    );
  }
}
