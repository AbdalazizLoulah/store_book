import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/const/app_color.dart';
import 'package:store_book/core/service/local_data/local_service_sqf.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/core/utile/custom_back_bottom.dart';
import 'package:store_book/core/utile/custom_bottom.dart';
import 'package:store_book/features/details/view_model/deitails/cubit/details_cubit.dart';

class DetailsScreenBody extends StatefulWidget {
  const DetailsScreenBody({super.key, required this.id});
  final int id;
  @override
  State<DetailsScreenBody> createState() => _DetailsScreenBodyState();
}

class _DetailsScreenBodyState extends State<DetailsScreenBody> {
  @override
  void initState() {
    context.read<DetailsCubit>().getAllDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LocalServiceSqf sql = LocalServiceSqf();
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsFailure) {
            return Container(
              child: Center(
                child: CustomText(
                  title: state.errMassage,
                  hight: 0.05,
                  color: Colors.black,
                ),
              ),
            );
          }
          if (state is DetailsSuccess) {
            var data = state.data.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: h * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomBackBottom(),
                      GestureDetector(
                        onTap: () async {
                          int response = await sql.insertData(
                            name: '${data!.name}', image: '${data.image}', price: '${data.price}'
                          );
                          print("===============$response+++++++++");
                        },
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          size: h * 0.04,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.05),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(15),
                      child: Image.network(
                        "${data!.image}",
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Center(
                    child: CustomText(
                      title: "${data.name}",
                      hight: 0.03,
                      color: Colors.black,
                    ),
                  ),
                  CustomText(
                    title: "${data.category}",
                    hight: 0.02,
                    color: AppColor.firstColor,
                  ),
                  SizedBox(height: h * 0.04),
                  Container(
                    height: h * 0.30,
                    child: CustomText(
                      title:
                          "${data.description!.substring(3, data.description!.length - 4)}",
                      hight: 0.015,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        title: "₹${data.price}",
                        hight: 0.04,
                        color: Colors.black,
                      ),
                      CustomBottom(
                        height: 0.06,
                        w: 0.17,
                        title: "AddToCart",
                        titleColor: AppColor.whiteColor,
                        bottomColor: const Color.fromARGB(255, 21, 21, 21),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Container(
            height: h,
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
