part of 'up_date_cart_cubit.dart';

@immutable
sealed class UpDateCartState {}

final class UpDateCartInitial extends UpDateCartState {}

final class UpDateCartSuccess extends UpDateCartState {
  final CartModel data;

  UpDateCartSuccess({required this.data});
}

final class UpDateCartLoading extends UpDateCartState {}

final class UpDateCartFailure extends UpDateCartState {
  final String errMassage;

  UpDateCartFailure({required this.errMassage});
}
