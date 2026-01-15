import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/details/data/model/add_to_wish_list_model.dart';
import 'package:store_book/features/details/data/repo/add_wish_repo/add_to_wish_list_repo.dart';

part 'add_to_wish_list_state.dart';

class AddToWishListCubit extends Cubit<AddToWishListState> {
  AddToWishListCubit(this.wishListRepo) : super(AddToWishListInitial());
  AddToWishListRepo wishListRepo;
  Future add( int id) async {
    emit(AddToWishListLoading());
    var data = await wishListRepo.addToWishList(id);
    data.fold(
      (failure) {
        emit(AddToWishListFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(AddToWishListSuccess(data: data));
      },
    );
  }
}
