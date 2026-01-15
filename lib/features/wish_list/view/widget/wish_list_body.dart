import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_app_bar.dart';
import 'package:store_book/core/utile/custom_card_item.dart';
import 'package:store_book/features/wish_list/view_model/cubit/get_wish_list_cubit.dart';

class WishListBody extends StatefulWidget {
  const WishListBody({super.key});

  @override
  State<WishListBody> createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  @override
  void initState() {
    context.read<GetWishListCubit>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: h * 0.05),
            CustomAppBar(title: "WishList", addIcon: false),
            BlocBuilder<GetWishListCubit, GetWishListState>(
              builder: (context, state) {
                if (state is GetWishListLoading) {
                  return SizedBox(
                    height: h * 0.85,
                    child: Shimmer(
                      color: Colors.black,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, count) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Container(
                              height: h * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                if (state is GetWishListSuccess) {
                  var data = state.data.data.items;
                  return SizedBox(
                    height: h * 0.85,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, count) {
                        final data = state.data.data.items;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            height: h * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: CustomCardItem(
                              image: data[count].image,
                              name: data[count].name,
                              prise: data[count].price.toString(),
                              quantity: data[count].stock,
                              cartId: data[count].id,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is GetWishListFailure) {
                  return Container(
                    child: Center(
                      child: CustomText(
                        title: "${state.errMassage}",
                        hight: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return Container(
                  child: CustomText(
                    title: "zezo",
                    hight: 0.05,
                    color: AppColor.darkerColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
