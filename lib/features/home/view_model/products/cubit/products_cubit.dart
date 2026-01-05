import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/home/data/model/product_model/all_product_model/product_respons.dart';
import 'package:store_book/features/home/data/repo/product_repo/home_product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeProductRepo) : super(ProductsInitial());
  final HomeProductRepo homeProductRepo;
  Future getAlProducts() async {
    emit(ProductsLoading());
    var data = await homeProductRepo.getAllProducts();
    data.fold(
      (failure) {
        emit(ProductsFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(ProductsSuccess(data: data));
      },
    );
  }
}
