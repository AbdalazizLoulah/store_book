class CartModel {
  final CartData data;
  final String message;
  final List<dynamic> error;
  final int status;

  CartModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      data: CartData.fromJson(json['data']),
      message: json['message'],
      error: json['error'],
      status: json['status'],
    );
  }
}
class CartData {
  final int id;
  final CartUser user;
  final String total;
  final List<CartItem> cartItems;

  CartData({
    required this.id,
    required this.user,
    required this.total,
    required this.cartItems,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    return CartData(
      id: json['id'],
      user: CartUser.fromJson(json['user']),
      total: json['total'],
      cartItems: List<CartItem>.from(
        json['cart_items'].map((e) => CartItem.fromJson(e)),
      ),
    );
  }
}
class CartUser {
  final int userId;
  final String userName;

  CartUser({required this.userId, required this.userName});

  factory CartUser.fromJson(Map<String, dynamic> json) {
    return CartUser(userId: json['user_id'], userName: json['user_name']);
  }
}
class CartItem {
  final int itemId;
  final int productId;
  final String productName;
  final String productImage;
  final String productPrice;
  final int productDiscount;
  final double priceAfterDiscount;
  final int stock;
  final int quantity;
  final double total;

  CartItem({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDiscount,
    required this.priceAfterDiscount,
    required this.stock,
    required this.quantity,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'],
      productId: json['item_product_id'],
      productName: json['item_product_name'],
      productImage: json['item_product_image'],
      productPrice: json['item_product_price'],
      productDiscount: json['item_product_discount'],
      priceAfterDiscount: (json['item_product_price_after_discount'] as num)
          .toDouble(),
      stock: json['item_product_stock'],
      quantity: json['item_quantity'],
      total: (json['item_total'] as num).toDouble(),
    );
  }
}
