class LoginModel {
  final Data? data;
  final String? message;
  final List<dynamic>? error;
  final int? status;

  LoginModel({this.data, this.message, this.error, this.status});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'],
      error: json['error'] ?? [],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}

class Data {
  final User? user;
  final String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'user': user?.toJson(), 'token': token};
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? address;
  final String? city;
  final String? phone;
  final bool? emailVerified;
  final String? image;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      emailVerified: json['email_verified'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'email_verified': emailVerified,
      'image': image,
    };
  }
}
