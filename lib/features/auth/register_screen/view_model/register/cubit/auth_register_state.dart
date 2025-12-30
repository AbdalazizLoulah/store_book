part of 'auth_register_cubit.dart';

@immutable
sealed class AuthRegisterState {}

final class AuthRegisterInitial extends AuthRegisterState {}

final class AuthRegisterLoading extends AuthRegisterState {}

final class AuthRegisterSuccess extends AuthRegisterState {
  final RegisterModel register;

  AuthRegisterSuccess({required this.register});
}

final class AuthRegisterFailure extends AuthRegisterState {
  final String errMassage;

  AuthRegisterFailure({required this.errMassage});
}
