class SliderItem {
  final String? image;

  SliderItem({this.image});

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(image: json['image']);
  }
}
