import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/cart/data/model/get_cart_model.dart';
import 'package:store_book/features/cart/data/repo/cart_repo.dart';

part 'up_date_cart_state.dart';

class UpDateCartCubit extends Cubit<UpDateCartState> {
  UpDateCartCubit(this.cartRepo) : super(UpDateCartInitial());
  CartRepo cartRepo;
  Future update(int? cartId, int? quantity) async {
    emit(UpDateCartLoading());
    var res = await cartRepo.updateCart(cartId, quantity);
    res.fold(
      (failure) {
        emit(UpDateCartFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(UpDateCartSuccess(data: data));
      },
    );
  }
}
