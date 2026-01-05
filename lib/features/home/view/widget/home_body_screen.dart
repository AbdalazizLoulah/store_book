import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_book/core/utile/Custom_Text.dart';
import 'package:store_book/features/home/view/widget/custom_app_bar.dart';
import 'package:store_book/features/home/view/widget/custom_grade_view.dart';
import 'package:store_book/features/home/view/widget/custom_slider.dart';
import 'package:store_book/features/home/view_model/products/cubit/products_cubit.dart';
import 'package:store_book/features/home/view_model/slider/cubit/slider_cubit.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  void initState() {
    context.read<SliderCubit>().getSliderData();
    context.read<ProductsCubit>().getAlProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: h * 0.05),
            CustomAppBar(),
            SizedBox(height: h * 0.02),
            BlocBuilder<SliderCubit, SliderState>(
              builder: (context, state) {
                if (state is SliderSuccess) {
                  return CustomSlider(data: state.data);
                }
                if (state is SliderFailure) {
                  return Container(
                    child: Center(
                      child: CustomText(
                        title: state.errMassage,
                        hight: 0.02,
                        color: Colors.black,
                      ),
                    ),
                  );
                }
                return Container(
                  height: h*0.2,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            SizedBox(height: h * 0.02),
            CustomText(title: "Popular Books", hight: 0.022, color: Colors.black),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return CustomGradeView(data: state.data,);
                }
                if (state is ProductsFailure) {
                  return CustomText(
                    title: state.errMassage,
                    hight: 0.02,
                    color: Colors.black,
                  );
                }
                return Container(
                  height: h*0.9,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


