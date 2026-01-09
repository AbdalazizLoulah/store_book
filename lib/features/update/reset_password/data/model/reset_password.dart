class UpdatePasswordModel {
  final UserData data;
  final String message;
  final List<dynamic> error;
  final int status;

  UpdatePasswordModel({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    return UpdatePasswordModel(
      data: UserData.fromJson(json['data']),
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'],
    );
  }
}
class UserData {
  final int id;
  final String name;
  final String email;
  final String? address;
  final String? city;
  final String? phone;
  final bool emailVerified;
  final String image;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.emailVerified,
    required this.image,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
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
}
