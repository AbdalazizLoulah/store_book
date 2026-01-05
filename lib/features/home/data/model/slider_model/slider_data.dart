import 'package:store_book/features/home/data/model/slider_model/slider_item.dart';

class SliderData {
  final List<SliderItem>? sliders;

  SliderData({this.sliders});

  factory SliderData.fromJson(Map<String, dynamic> json) {
    return SliderData(
      sliders: json['sliders'] != null
          ? List<SliderItem>.from(
              json['sliders'].map((x) => SliderItem.fromJson(x)),
            )
          : [],
    );
  }
}
