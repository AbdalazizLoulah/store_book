import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/features/details/view/details_screen.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/prouduct_model.dart';
import 'package:store_book/features/home/view_model/add_cart/cubit/add_to_cart_cubit.dart';

class BookItem extends StatelessWidget {
  final Product data;

  const BookItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(id: data.id!)),
        );
      },
      child: Container(
        height: h * 0.01,
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
                  BlocConsumer<AddToCartCubit, AddToCartState>(
                    listener: (context, state) {
                    if (state is AddToCartFailure) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Error"),
                        icon: Icon(Icons.error),
                        content: Container(
                          height: h * 0.05,
                          width: h * 0.05,
                          child: Column(
                            children: [
                              Text(
                                state.errMassage,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is AddToCartSuccess) {
                    var d = state.data;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${d.message}'),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(50, 30),
                        ),
                        onPressed: () {
                          context.read<AddToCartCubit>().addToCart(data.id!);
                        },
                        child: CustomText(
                          title: "Buy",
                          hight: 0.02,
                          color: AppColor.whiteColor,
                        ),
                      );
                    },
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
