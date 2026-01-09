import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/wish_list/data/model/wish_list_model.dart';
import 'package:store_book/features/wish_list/data/repo/wish_list_repo.dart';

part 'get_local_data_state.dart';

class GetLocalDataCubit extends Cubit<GetLocalDataState> {
  GetLocalDataCubit(this.wishListRepo) : super(GetLocalDataInitial());
  WishListRepo wishListRepo;
  Future get() async {
    emit(GetLocalDataLoading());
    var data = await wishListRepo.getLocalData();
    data.fold(
      (failure) {
        emit(GetLocalDataFailure());
      },
      (data) {
        emit(GetLocalDataSuccess(data: data));
      },
    );
  }
}
