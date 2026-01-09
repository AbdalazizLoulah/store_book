part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final UpdatePasswordModel data;
  ResetPasswordSuccess({required this.data});
}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordFailure extends ResetPasswordState {
  final String errMassage;

  ResetPasswordFailure({required this.errMassage});
}
