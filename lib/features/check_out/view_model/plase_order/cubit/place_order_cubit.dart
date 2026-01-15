import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/cart/data/model/place_order/place_order_model.dart';
import 'package:store_book/features/cart/data/repo/cart_repo.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit(this.cartRepo) : super(PlaceOrderInitial());
  CartRepo cartRepo;
  Future placeOrder(
    int id,
    String name,
    String phone,
    String email,
    String address,
  ) async {
    emit(PlaceOrderLoading());
    var res = await cartRepo.placeOrder(id, name, phone, email, address);
    res.fold(
      (failure) {
        emit(PlaceOrderFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(PlaceOrderSuccess(data: data));
      },
    );
  }
}
