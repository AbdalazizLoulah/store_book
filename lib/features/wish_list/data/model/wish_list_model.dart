class WishListModel {
  final int? id;
  final String name;
  final String image;
  final double price;

  WishListModel({
    this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory WishListModel.fromMap(Map<String, dynamic> map) {
    return WishListModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      price: map['price'] is int
          ? (map['price'] as int).toDouble()
          : map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'image': image, 'price': price};
  }
}
