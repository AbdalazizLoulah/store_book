import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/check_out/data/model/governorate/governorate_response_model.dart';
import 'package:store_book/features/check_out/data/repo/check_out_repo.dart';

part 'get_governorate_state.dart';

class GetGovernorateCubit extends Cubit<GetGovernorateState> {
  GetGovernorateCubit(this.checkOutRepo) : super(GetGovernorateInitial());
  CheckOutRepo checkOutRepo;
  Future getGovernorate() async {
    emit(GetGovernorateLoading());
    var res = await checkOutRepo.getGovernorate();
    res.fold(
      (failure) {
        emit(GetGovernorateFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(GetGovernorateSuccess(data: data));
      },
    );
  }
}
