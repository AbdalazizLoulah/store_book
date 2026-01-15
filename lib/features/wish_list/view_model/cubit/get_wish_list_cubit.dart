import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/wish_list/data/model/wish_list_model.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo.dart';

part 'get_wish_list_state.dart';

class GetWishListCubit extends Cubit<GetWishListState> {
  GetWishListCubit(this.wishListRepo) : super(GetWishListInitial());
  WishListRepo wishListRepo;
  Future getData() async {
    emit(GetWishListLoading());
    var res = await wishListRepo.getWishList();
    res.fold(
      (failure) {
        emit(GetWishListFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(GetWishListSuccess(data: data));
      },
    );
  }
}
