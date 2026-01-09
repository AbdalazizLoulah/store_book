import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
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
            CustomAppBarHome(),
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
                return Shimmer(
                  color: Colors.black,
                  child: Container(
                    height:h*0.2 ,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                );
              },
            ),
            SizedBox(height: h * 0.02),
            CustomText(
              title: "Popular Books",
              hight: 0.022,
              color: Colors.black,
            ),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return CustomGradeView(data: state.data);
                }
                if (state is ProductsFailure) {
                  return CustomText(
                    title: state.errMassage,
                    hight: 0.02,
                    color: Colors.black,
                  );
                }
                return  GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 17,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.51,
                  ),
                  itemBuilder: (context, index) {
                    return Shimmer(
                      color: Colors.black,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                        height: h*0.01,width: h*0.02,));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
