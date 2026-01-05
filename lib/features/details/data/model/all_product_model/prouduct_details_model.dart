class ProductDetails {
  final int? id;
  final String? name;
  final String? description;
  final int? stock;
  final int? bestSeller;
  final String? price;
  final int? discount;
  final double? priceAfterDiscount;
  final String? image;
  final String? category;

  ProductDetails({
    this.id,
    this.name,
    this.description,
    this.stock,
    this.bestSeller,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.image,
    this.category,
  });

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      stock: json['stock'],
      bestSeller: json['best_seller'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'] != null
          ? (json['price_after_discount'] as num).toDouble()
          : null,
      image: json['image'],
      category: json['category'],
    );
  }
}
