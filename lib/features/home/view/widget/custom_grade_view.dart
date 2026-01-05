import 'package:flutter/material.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/product_respons.dart';
import 'package:store_book/features/home/view/widget/custom_book_item.dart';

class CustomGradeView extends StatelessWidget {
  const CustomGradeView({super.key, required this.data});
  final ProductsResponse data;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 17,
        crossAxisSpacing: 16,
        childAspectRatio: 0.51,
      ),
      itemBuilder: (context, index) {
        return BookItem(data: data.data!.products![index],);
      },
    );
  }
}
