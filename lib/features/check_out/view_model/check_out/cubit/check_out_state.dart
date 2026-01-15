part of 'check_out_cubit.dart';

sealed class CheckOutState {}

final class CheckOutInitial extends CheckOutState {}

final class CheckOutSuccess extends CheckOutState {
  final CartResponseModel data;

  CheckOutSuccess({required this.data});
}

final class CheckOutLoading extends CheckOutState {}

final class CheckOutFailure extends CheckOutState {
  final String errMassage;

  CheckOutFailure({required this.errMassage});
}
