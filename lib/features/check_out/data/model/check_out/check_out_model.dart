class CartResponseModel {
  final CartData data;
  final String message;
  final List<dynamic> error;
  final int status;

  CartResponseModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) {
    return CartResponseModel(
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
  final String userEmail;
  final String? address;
  final String? phone;

  CartUser({
    required this.userId,
    required this.userName,
    required this.userEmail,
    this.address,
    this.phone,
  });

  factory CartUser.fromJson(Map<String, dynamic> json) {
    return CartUser(
      userId: json['user_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      address: json['address'],
      phone: json['phone'],
    );
  }
}
class CartItem {
  final int itemId;
  final int productId;
  final String productName;
  final String productPrice;
  final int quantity;
  final String itemTotal;

  CartItem({
    required this.itemId,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.quantity,
    required this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'],
      productId: json['item_product_id'],
      productName: json['item_product_name'],
      productPrice: json['item_product_price'],
      quantity: json['item_quantity'],
      itemTotal: json['item_total'],
    );
  }
}

