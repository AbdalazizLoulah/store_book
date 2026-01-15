class AddToWishListModel {
  final WishlistData data;
  final String message;
  final List<dynamic> error;
  final int status;

  AddToWishListModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory AddToWishListModel.fromJson(Map<String, dynamic> json) {
    return AddToWishListModel(
      data: WishlistData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}
class WishlistData {
  final int currentPage;
  final List<WishlistProduct> products;
  final int total;
  final int perPage;
  final int lastPage;

  WishlistData({
    required this.currentPage,
    required this.products,
    required this.total,
    required this.perPage,
    required this.lastPage,
  });

  factory WishlistData.fromJson(Map<String, dynamic> json) {
    return WishlistData(
      currentPage: json['current_page'],
      products: (json['data'] as List)
          .map((e) => WishlistProduct.fromJson(e))
          .toList(),
      total: json['total'],
      perPage: json['per_page'],
      lastPage: json['last_page'],
    );
  }
}
class WishlistProduct {
  final int id;
  final String name;
  final String price;
  final String category;
  final String image;
  final int discount;
  final int stock;
  final String description;
  final int bestSeller;

  WishlistProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.image,
    required this.discount,
    required this.stock,
    required this.description,
    required this.bestSeller,
  });

  factory WishlistProduct.fromJson(Map<String, dynamic> json) {
    return WishlistProduct(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
      discount: json['discount'],
      stock: json['stock'],
      description: json['description'],
      bestSeller: json['best_seller'],
    );
  }
}
