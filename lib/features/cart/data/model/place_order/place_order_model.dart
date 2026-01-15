class OrderPlacedModel {
  final OrderData? data;
  final String message;
  final List<dynamic> error;
  final int status;

  OrderPlacedModel({
    this.data,
    required this.message,
    required this.error,
    required this.status,
  });

  factory OrderPlacedModel.fromJson(Map<String, dynamic> json) {
    return OrderPlacedModel(
      data: json['data'] != null ? OrderData.fromJson(json['data']) : null,
      message: json['message'] ?? '',
      error: json['error'] ?? [],
      status: json['status'] ?? 0,
    );
  }
}

class OrderData {
  final int id;

  OrderData({required this.id});

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(id: json['id']);
  }
}
