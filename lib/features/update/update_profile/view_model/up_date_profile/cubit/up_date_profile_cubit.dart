import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/core/service/api_service.dart';
import 'package:store_book/features/update/update_profile/data/model/update_profile_model.dart';
import 'package:store_book/features/update/update_profile/data/repo/update_profile_repo.dart';

part 'up_date_profile_state.dart';

class UpDateProfileCubit extends Cubit<UpDateProfileState> {
  UpDateProfileCubit(this.updateProfileRepo) : super(UpDateProfileInitial());
  UpdateProfileRepo updateProfileRepo;
  Future upDateProfile({
    required String name,
    String? address,
    String? phone,
    String? email,
  }) async {
    emit(UpDateProfileLoading());
    var res = await updateProfileRepo.update(
      name: name,
      address: address,
      email: email,
      phone: phone,
    );
    res.fold(
      (failure) {
        emit(UpDateProfileFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(UpDateProfileSuccess(data: data));
      },
    );
  }
}
