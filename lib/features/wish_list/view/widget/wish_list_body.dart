import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/utile/Custom_Text.dart';

import 'package:store_book/core/utile/custom_app_bar.dart';
import 'package:store_book/core/utile/custom_bottom.dart';

import 'package:store_book/features/wish_list/view_model/get_local_data/cubit/get_local_data_cubit.dart';

class WishListBody extends StatefulWidget {
  const WishListBody({super.key});

  @override
  State<WishListBody> createState() => _WishListBodyState();
}

class _WishListBodyState extends State<WishListBody> {
  @override
  void initState() {
    context.read<GetLocalDataCubit>().get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          CustomAppBar(title: "WishList", addIcon: false),
          SizedBox(height: h * 0.03),
          // BlocBuilder<GetLocalDataCubit, GetLocalDataState>(
          //   builder: (context, state) {
          //     if (state is GetLocalDataLoading) {
          //       return ListView.builder(
          //         itemBuilder: (context, count) {
          //           return Container(
          //             height: h * 0.17,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     if (state is GetLocalDataSuccess) {
          //       return ListView.builder(
          //         itemCount: state.data.length,
          //         itemBuilder: (context, count) {
          //           final data = state.data;
          //           return Container(
          //             height: h * 0.17,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Row(
          //                 children: [
          //                   Image.asset("${data[count].image}"),
          //                   SizedBox(width: h * 0.01),
          //                   Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //                           Container(
          //                             height: h * 0.06,
          //                             child: Column(
          //                               crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                               children: [
          //                                 CustomText(
          //                                   title: "${data[count].name}",
          //                                   hight: 0.02,
          //                                   color: Colors.black,
          //                                 ),
          //                                 CustomText(
          //                                   title: "₹${data[count].price}",
          //                                   hight: 0.02,
          //                                   color: Colors.black,
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                           SizedBox(width: h * 0.08),
          //                           Icon(Icons.close),
          //                         ],
          //                       ),
          //                       SizedBox(height: h * 0.034),
          //                       Padding(
          //                         padding: const EdgeInsets.only(left: 50),
          //                         child: CustomBottom(
          //                           height: 0.05,
          //                           w: 0.20,
          //                           title: "AddToCart",
          //                           titleColor: AppColor.whiteColor,
          //                           bottomColor: AppColor.firstColor,
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     return Container();
          //   },
          // ),
        ],
      ),
    );
  }
}
