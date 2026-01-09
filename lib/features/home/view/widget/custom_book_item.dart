import 'package:flutter/material.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/features/details/view/details_screen.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/prouduct_model.dart';

class BookItem extends StatelessWidget {
  final Product data;

  const BookItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsScreen(id:data.id!)));
      },
      child: Container(
        height: h*0.01,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.itemColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      "${data.image}",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.01),
              CustomText(
                title: "${data.name}",
                hight: 0.013,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '₹${data.price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      minimumSize: const Size(50, 30),
                    ),
                    onPressed: () {},
                    child: CustomText(
                      title: "Buy",
                      hight: 0.02,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
