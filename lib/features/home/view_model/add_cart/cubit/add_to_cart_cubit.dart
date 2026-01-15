import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/cart/data/model/get_cart_model.dart';
import 'package:store_book/features/home/data/repo/add_to_cart/add_to_cart_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this.addToCartRepo) : super(AddToCartInitial());
  AddToCartRepo addToCartRepo;
  Future addToCart(int id) async {
    emit(AddToCartLoading());
    var res = await addToCartRepo.addToCart(id);
    res.fold(
      (failure) {
        emit(AddToCartFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(AddToCartSuccess(data: data));
      },
    );
  }
}
