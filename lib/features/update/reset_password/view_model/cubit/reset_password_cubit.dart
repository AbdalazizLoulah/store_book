import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store_book/features/update/reset_password/data/model/reset_password.dart';
import 'package:store_book/features/update/reset_password/data/repo/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordRepo) : super(ResetPasswordInitial());
  ResetPasswordRepo resetPasswordRepo;
  Future updatePassword({
    String? currentPassword,
    String? newPassword,
    String? newPasswordConfirmation,
  }) async {
    emit(ResetPasswordLoading());
    var res = await resetPasswordRepo.upDatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
      newPasswordConfirmation: newPasswordConfirmation,
    );
    res.fold(
      (failure) {
        emit(ResetPasswordFailure(errMassage: failure.errMassage));
      },
      (data) {
        emit(ResetPasswordSuccess(data: data));
      },
    );
  }
}
