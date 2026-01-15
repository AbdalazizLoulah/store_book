import 'package:bloc/bloc.dart';

import 'package:store_book/features/check_out/data/model/check_out/check_out_model.dart';
import 'package:store_book/features/check_out/data/repo/check_out_repo.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState> {
  CheckOutCubit(this.checkOutRepo) : super(CheckOutInitial());
  final CheckOutRepo checkOutRepo;
  Future checkOut() async {
    var res = await checkOutRepo.checkOut();
    res.fold(
      (failure) {
        emit(CheckOutFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(CheckOutSuccess(data: data));
      },
    );
  }
}
