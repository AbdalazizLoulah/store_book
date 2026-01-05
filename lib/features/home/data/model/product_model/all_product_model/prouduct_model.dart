class Product {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? discount;
  final double? priceAfterDiscount;
  final int? stock;
  final int? bestSeller;
  final String? image;
  final String? category;

  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      priceAfterDiscount: json['price_after_discount'] != null
          ? (json['price_after_discount'] as num).toDouble()
          : null,
      stock: json['stock'],
      bestSeller: json['best_seller'],
      image: json['image'],
      category: json['category'],
    );
  }
}
