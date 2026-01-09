import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/profile/data/models/profile_model/profile_model.dart';
import 'package:store_book/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.profileRepo) : super(ProfileInitial());
  ProfileRepo profileRepo;
  Future getProfile() async {
    emit(ProfileLoading());
    var res = await profileRepo.getProfileData();
    res.fold(
      (failure) {
        emit(ProfileFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(ProfileSuccess(data: data));
      },
    );
  }
}
